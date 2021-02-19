package main

import (
	"github.com/kataras/iris/v12"
	"github.com/kataras/iris/v12/middleware/logger"
	"github.com/kataras/iris/v12/middleware/recover"
)

func main() {
	app := iris.New()
	app.Use(recover.New())
	app.Use(logger.New())
	tmpl := iris.HTML("./views", ".html")
	app.RegisterView(tmpl)
	app.Get("/", func(ctx iris.Context) {
		ctx.View("index.html")
	})
	app.Listen(":8080")
}
