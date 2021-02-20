package oidc

import (
	"context"
	"encoding/json"
	"fmt"
	"github.com/coreos/go-oidc"
	"github.com/google/uuid"
	"github.com/kataras/iris/v12"
	"github.com/kataras/iris/v12/sessions"
	"golang.org/x/oauth2"
	"net/http"
)

func SetUpOIDC(app *iris.Application) {
	oauth2Config, verifier := oidcConfigurer()
	var middleware = NewOidcMiddleware(oauth2Config)
	app.Use(middleware)
	callback := oidcCallbackHandlerFactory(oauth2Config, verifier)
	app.Get("/demo/callback", callback)
}

func oidcConfigurer() (*oauth2.Config, *oidc.IDTokenVerifier) {
	configURL := "http://local.todo-list.com/auth/realms/todo-list"
	ctx := context.Background()
	provider, err := oidc.NewProvider(ctx, configURL)
	if err != nil {
		panic(err)
	}

	clientID := "application"
	clientSecret := "b047cc08-f324-4bd4-a7fa-31d8ddbc08e6"
	redirectURL := "http://localhost:8080/demo/callback"

	// Configure an OpenID Connect aware OAuth2 client.
	oauth2Config := &oauth2.Config{
		ClientID:     clientID,
		ClientSecret: clientSecret,
		RedirectURL:  redirectURL,
		// Discovery returns the OAuth2 endpoints.
		Endpoint: provider.Endpoint(),
		// "openid" is a required scope for OpenID Connect flows.
		Scopes: []string{oidc.ScopeOpenID, "profile", "email"},
	}
	oidcConfig := &oidc.Config{
		ClientID: clientID,
	}
	verifier := provider.Verifier(oidcConfig)

	return oauth2Config, verifier
}

func NewOidcMiddleware(oauth2Config *oauth2.Config) func(ctx iris.Context) {
	return func(ctx iris.Context) {
		session := sessions.Get(ctx)

		idToken := session.Get("id_token")
		fmt.Printf("idToken: %v", idToken)
		if ctx.Path() == "/demo/callback" {
			ctx.Next()
		}

		if idToken == nil {
			state := stateFactory()
			session := sessions.Get(ctx)
			session.Set("state", state)
			session.Set("request_url", ctx.Path())
			ctx.Redirect(oauth2Config.AuthCodeURL(state))
		}
		ctx.Next()
	}
}

func oidcCallbackHandlerFactory(oauth2Config *oauth2.Config, verifier *oidc.IDTokenVerifier) func(ctx iris.Context) {
	return func(ctx iris.Context) {
		fmt.Println("START Callback")
		background := context.Background()
		session := sessions.Get(ctx)

		fmt.Printf("state from session: %v\n", session.GetString("state"))
		fmt.Printf("state from uri: %v\n", ctx.URLParam("state"))

		if ctx.URLParam("state") != session.GetString("state") {
			fmt.Println("state did not match")
			ctx.StatusCode(http.StatusBadRequest)
			return
		}
		oauth2Token, err := oauth2Config.Exchange(background, ctx.URLParam("code"))
		if err != nil {
			fmt.Println("Failed to exchange token: " + err.Error())
			ctx.StatusCode(http.StatusInternalServerError)
			return
		}
		rawIDToken, ok := oauth2Token.Extra("id_token").(string)
		if !ok {
			fmt.Println("No id_token field in oauth2 token.")
			ctx.StatusCode(http.StatusInternalServerError)
			return
		}
		idToken, err := verifier.Verify(background, rawIDToken)
		if err != nil {
			fmt.Println("Failed to verify ID Token: " + err.Error())
			ctx.StatusCode(http.StatusInternalServerError)
			return
		}

		resp := struct {
			OAuth2Token   *oauth2.Token
			IDTokenClaims *json.RawMessage // ID Token payload is just JSON.
		}{oauth2Token, new(json.RawMessage)}

		if err := idToken.Claims(&resp.IDTokenClaims); err != nil {
			fmt.Println(err.Error())
			ctx.StatusCode(http.StatusInternalServerError)
			return
		}
		data, err := json.MarshalIndent(resp, "", "    ")

		fmt.Println(data)
		session.Set("id_token", data)
		ctx.Redirect(session.GetString("request_url"))
	}
}

func stateFactory() string {
	return uuid.NewString()
}
