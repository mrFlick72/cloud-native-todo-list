package main

import (
	"githab/mrflick72/cloud-native-todo-list/todo-service/src/adapter"
	"githab/mrflick72/cloud-native-todo-list/todo-service/src/web"
	"github.com/labstack/echo"
)

func main() {
	repository := adapter.MySqlTodoRepository{ConnectionString: "root:root@tcp(localhost)/todo?parseTime=true"}
	server := echo.New()
	endpoint := web.TodoEndpoints{TodoRepository: &repository}

	server.GET("/todo", endpoint.GetTodoEndpoint)
	server.GET("/todo/:id", endpoint.GetOneTodoEndpoint)
	server.POST("/todo", endpoint.SaveTodoEndpoint)
	server.DELETE("/todo/:id", endpoint.DeleteTodoEndpoint)

	server.Start(":8000")
}
