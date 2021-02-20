package main

import (
	"githab/mrflick72/cloud-native-todo-list/todo-list-website/middleware/security/oidc"
	"github.com/kataras/iris/v12"
	"github.com/kataras/iris/v12/middleware/logger"
	"github.com/kataras/iris/v12/middleware/recover"
	"github.com/kataras/iris/v12/sessions"
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
	app.Use(oidc.NewOidcMiddleware)

	tmpl := iris.HTML("./views", ".html")
	app.RegisterView(tmpl)
	app.Get("/demo/callback", oidc.NewOidcMiddleware)

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
