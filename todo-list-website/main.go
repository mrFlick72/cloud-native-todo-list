package main

import (
	"context"
	"encoding/json"
	"github.com/coreos/go-oidc"
	"github.com/kataras/iris/v12"
	"github.com/kataras/iris/v12/middleware/logger"
	"github.com/kataras/iris/v12/middleware/recover"
	"github.com/kataras/iris/v12/sessions"
	"golang.org/x/oauth2"
	"net/http"
	"strings"
	"time"
)

func main() {
	app := iris.New()
	app.Use(recover.New())
	app.Use(logger.New())

	sess := sessions.New(sessions.Config{
		Cookie:       "go_session_id",
		AllowReclaim: true,
		Expires:      time.Second * 10,
	})
	app.Use(sess.Handler())

	tmpl := iris.HTML("./views", ".html")
	app.RegisterView(tmpl)
	app.Get("/", func(ctx iris.Context) {
		session := sessions.Get(ctx)
		ctx.ViewData("session_lifetime", session.Lifetime)
		ctx.ViewData("session_isNew", session.IsNew())
		session.Set("username", "a user name")
		ctx.View("index.html")
	})

	app.Get("/next", func(ctx iris.Context) {
		session := sessions.Get(ctx)
		ctx.ViewData("session_lifetime", session.Lifetime)
		ctx.ViewData("session_isNew", session.IsNew())
		ctx.ViewData("username", session.GetString("username"))
		ctx.View("index.html")
	})

	app.Listen(":8080")
}

func provider() {
	configURL := "http://localhost:8080/auth/realms/demo"
	ctx := context.Background()
	provider, err := oidc.NewProvider(ctx, configURL)
	if err != nil {
		panic(err)
	}

	clientID := "demo-client"
	clientSecret := "cbfd6e04-a51c-4982-a25b-7aaba4f30c81"

	redirectURL := "http://localhost:8181/demo/callback"
	// Configure an OpenID Connect aware OAuth2 client.
	oauth2Config := oauth2.Config{
		ClientID:     clientID,
		ClientSecret: clientSecret,
		RedirectURL:  redirectURL,
		// Discovery returns the OAuth2 endpoints.
		Endpoint: provider.Endpoint(),
		// "openid" is a required scope for OpenID Connect flows.
		Scopes: []string{oidc.ScopeOpenID, "profile", "email"},
	}
	state := "somestate"

	oidcConfig := &oidc.Config{
		ClientID: clientID,
	}
	verifier := provider.Verifier(oidcConfig)

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		rawAccessToken := r.Header.Get("Authorization")
		if rawAccessToken == "" {
			http.Redirect(w, r, oauth2Config.AuthCodeURL(state), http.StatusFound)
			return
		}

		parts := strings.Split(rawAccessToken, " ")
		if len(parts) != 2 {
			w.WriteHeader(400)
			return
		}
		_, err := verifier.Verify(ctx, parts[1])

		if err != nil {
			http.Redirect(w, r, oauth2Config.AuthCodeURL(state), http.StatusFound)
			return
		}

		w.Write([]byte("hello world"))
	})

	http.HandleFunc("/demo/callback", func(w http.ResponseWriter, r *http.Request) {
		if r.URL.Query().Get("state") != state {
			http.Error(w, "state did not match", http.StatusBadRequest)
			return
		}

		oauth2Token, err := oauth2Config.Exchange(ctx, r.URL.Query().Get("code"))
		if err != nil {
			http.Error(w, "Failed to exchange token: "+err.Error(), http.StatusInternalServerError)
			return
		}
		rawIDToken, ok := oauth2Token.Extra("id_token").(string)
		if !ok {
			http.Error(w, "No id_token field in oauth2 token.", http.StatusInternalServerError)
			return
		}
		idToken, err := verifier.Verify(ctx, rawIDToken)
		if err != nil {
			http.Error(w, "Failed to verify ID Token: "+err.Error(), http.StatusInternalServerError)
			return
		}

		resp := struct {
			OAuth2Token   *oauth2.Token
			IDTokenClaims *json.RawMessage // ID Token payload is just JSON.
		}{oauth2Token, new(json.RawMessage)}

		if err := idToken.Claims(&resp.IDTokenClaims); err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
		data, err := json.MarshalIndent(resp, "", "    ")
		if err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
		w.Write(data)
	})
}
