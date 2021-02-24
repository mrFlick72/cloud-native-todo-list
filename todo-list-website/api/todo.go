package api

import (
	"encoding/json"
	"fmt"
	"githab/mrflick72/cloud-native-todo-list/todo-list-website/middleware/security/oidc"
	"github.com/go-resty/resty/v2"
	"github.com/google/uuid"
	"github.com/kataras/iris/v12"
	"net/http"
)

type TodoRepresentation struct {
	Id       string `json:"id"`
	UserName string `json:"userName"`
	Date     string `json:"date"`
	Content  string `json:"content"`
}

func SetUpTodoEndpoints(basePath string, serviceUrl string, client *resty.Client, app *iris.Application) {

	app.Get(basePath+"/todo", func(ctx iris.Context) {
		userName := oidc.GetUserFromSession(ctx).UserName
		response, _ := client.R().Get(serviceUrl + "/todo?username=" + userName)
		ctx.ContentType("application/json")
		ctx.Write(response.Body())
	})

	app.Post(basePath+"/todo", func(ctx iris.Context) {
		body, representation, err := getTodoFromBody(ctx)
		if err != nil {
			fmt.Println("error: " + err.Error())
			ctx.StatusCode(http.StatusBadRequest)
			return
		}

		fmt.Printf("representation: %v\n", representation)

		response, err := client.R().
			SetHeader("Content-Type", "application/json").
			SetBody(body).
			Post(serviceUrl + "/todo")

		fmt.Printf("body %v\n", body)
		fmt.Printf("url %v\n", serviceUrl+"/todo")
		fmt.Printf("response %v\n", response)
		fmt.Printf("response status %v\n", response.Status())
		if err != nil {
			fmt.Println("error: " + err.Error())
			ctx.StatusCode(http.StatusInternalServerError)
		} else {
			ctx.StatusCode(http.StatusCreated)
		}
	})

	app.Delete(basePath+"/todo/{id}", func(ctx iris.Context) {
		id := ctx.Params().Get("id")
		response, err := client.R().Delete(serviceUrl + "/todo/" + id)
		if response.IsError() || err != nil {
			fmt.Println("error: " + err.Error())
			ctx.StatusCode(http.StatusInternalServerError)
		} else {
			ctx.StatusCode(http.StatusNoContent)
		}
	})
}

func getTodoFromBody(ctx iris.Context) (string, *TodoRepresentation, error) {
	userName := oidc.GetUserFromSession(ctx).UserName

	representation := TodoRepresentation{UserName: userName}
	body, err := ctx.GetBody()
	err = json.Unmarshal(body, &representation)

	if representation.Id == "" {
		representation.Id = uuid.New().String()
	}
	marshal, err := json.Marshal(&representation)

	return string(marshal), &representation, err
}
