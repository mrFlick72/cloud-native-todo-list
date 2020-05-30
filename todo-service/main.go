package main

import (
	"fmt"
	"githab/mrflick72/cloud-native-todo-list/todo-service/src/adapter"
	"githab/mrflick72/cloud-native-todo-list/todo-service/src/web"
	"github.com/labstack/echo"
	"github.com/labstack/echo/middleware"
	"os"
)

func main() {
	repository := adapter.MySqlTodoRepository{ConnectionString: databaseConnectionStringFromEnv()}
	server := echo.New()
	endpoint := web.TodoEndpoints{TodoRepository: &repository}

	server.GET("/todo", endpoint.GetTodoEndpoint)
	server.GET("/todo/:id", endpoint.GetOneTodoEndpoint)
	server.POST("/todo", endpoint.SaveTodoEndpoint)
	server.DELETE("/todo/:id", endpoint.DeleteTodoEndpoint)

	server.Use(middleware.CORSWithConfig(middleware.CORSConfig{
		AllowOrigins: []string{"*"},
		AllowMethods: []string{"GET", "POST", "DELETE"},
		AllowHeaders: []string{echo.HeaderOrigin, echo.HeaderContentType, echo.HeaderAccept},
	}))
	server.Use(middleware.Logger())

	webserverPort := os.Getenv("WEB_SERVER_PORT")
	server.Start(fmt.Sprintf(":%v", webserverPort))
}

func databaseConnectionStringFromEnv() string {
	databaseUrl := os.Getenv("DATABASE_URL")
	databaseUserName := os.Getenv("DATABASE_USER")
	databasePassword := os.Getenv("DATABASE_PASSWORD")
	databaseConnectionString := fmt.Sprintf("%v:%v@tcp(%v)/todo?parseTime=true", databaseUserName, databasePassword, databaseUrl)
	return databaseConnectionString
}
