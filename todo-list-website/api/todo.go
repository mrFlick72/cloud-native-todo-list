package api

import (
	"encoding/json"
	"githab/mrflick72/cloud-native-todo-list/todo-list-website/middleware/security/oidc"
	"github.com/go-resty/resty/v2"
	"github.com/kataras/iris/v12"
	"net/http"
)

type TodoRepresentation struct {
	Id       string
	Date     string
	UserName string
	Content  string
}

func SetUpTodoEndpoints(baseUrl string, client *resty.Client, app *iris.Application) {

	app.Get("/todo", func(ctx iris.Context) {
		userName := oidc.GetUserFromSession(ctx).UserName
		response, _ := client.R().Get(baseUrl + "/todo?username=" + userName)
		ctx.ContentType("application/json")
		ctx.Write(response.Body())
	})

	app.Post("/todo", func(ctx iris.Context) {
		representation, err := getTodoFromBody(ctx)
		if err != nil {
			ctx.StatusCode(http.StatusBadRequest)
			return
		}

		userName := oidc.GetUserFromSession(ctx).UserName
		representation.UserName = userName
		response, err := client.R().Post(baseUrl + "/todo")

		if response.IsError() || err != nil {
			ctx.StatusCode(http.StatusInternalServerError)
		}
	})

	app.Delete("/todo/{id}", func(ctx iris.Context) {
		id := ctx.Params().Get("id")
		response, err := client.R().Delete(baseUrl + "/todo/" + id)
		if response.IsError() || err != nil {
			ctx.StatusCode(http.StatusInternalServerError)
		}
	})
}

func getTodoFromBody(ctx iris.Context) (TodoRepresentation, error) {
	representation := TodoRepresentation{}
	body, err := ctx.GetBody()
	err = json.Unmarshal(body, &representation)

	return representation, err
}
