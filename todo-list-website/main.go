package main

import (
	"fmt"
	"githab/mrflick72/cloud-native-todo-list/todo-list-website/api"
	"githab/mrflick72/cloud-native-todo-list/todo-list-website/middleware/security/oidc"
	"github.com/go-resty/resty/v2"
	"github.com/kataras/iris/v12"
	"github.com/kataras/iris/v12/middleware/logger"
	"github.com/kataras/iris/v12/middleware/recover"
	"github.com/kataras/iris/v12/sessions"
	"os"
	"time"
)

func main() {
	basePath := os.Getenv("BASE_PATH")
	todoServiceBaseUrl := os.Getenv("TODO_SERVICE_BASE_URL")

	app := iris.New()
	app.Use(recover.New())
	app.Use(logger.New())

	sess := sessions.New(sessions.Config{
		Cookie:       "go_session_id",
		AllowReclaim: true,
		Expires:      time.Second * 10,
	})
	app.Use(sess.Handler())

	oidc.SetUpOIDC(app)
	tmpl := iris.HTML("./static", ".html")
	app.RegisterView(tmpl)

	app.HandleDir(basePath, "./static/website")
	app.Get(basePath+"/index.html", func(ctx iris.Context) {
		ctx.View("index.html")
	})
	api.SetUpTodoEndpoints(basePath, todoServiceBaseUrl, resty.New(), app)
	fmt.Println(app.Listen(":8080"))
}
