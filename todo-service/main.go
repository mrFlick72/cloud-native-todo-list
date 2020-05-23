package main

import (
	"githab/mrflick72/cloud-native-todo-list/todo-service/src/adapter"
	"githab/mrflick72/cloud-native-todo-list/todo-service/src/web"
	"github.com/labstack/echo"
	"github.com/labstack/echo/middleware"
)

func main() {
	repository := adapter.MySqlTodoRepository{ConnectionString: "root:root@tcp(localhost)/todo?parseTime=true"}
	server := echo.New()
	endpoint := web.TodoEndpoints{TodoRepository: &repository}

	server.GET("/todo", endpoint.GetTodoEndpoint)
	server.GET("/todo/:id", endpoint.GetOneTodoEndpoint)
	server.POST("/todo", endpoint.SaveTodoEndpoint)
	server.DELETE("/todo/:id", endpoint.DeleteTodoEndpoint)

	server.Use(middleware.CORSWithConfig(middleware.CORSConfig{
		AllowOrigins: []string{"http://localhost:8000"},
		AllowHeaders: []string{echo.HeaderOrigin, echo.HeaderContentType, echo.HeaderAccept},
	}))
	server.Start(":8000")
}
