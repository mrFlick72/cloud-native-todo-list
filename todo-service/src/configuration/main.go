package configuration

import (
	"fmt"
	"githab/mrflick72/cloud-native-todo-list/todo-service/src/api"
	"githab/mrflick72/cloud-native-todo-list/todo-service/src/internal/todo"
	"github.com/labstack/echo"
	"github.com/labstack/echo/middleware"
	"os"
)

func ServerConfigurer() *echo.Echo {
	repository := todo.MySqlTodoRepository{ConnectionString: databaseConnectionStringFromEnv()}
	server := echo.New()
	endpoint := api.TodoEndpoints{TodoRepository: &repository}

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

	return server
}

func databaseConnectionStringFromEnv() string {
	databaseUrl := os.Getenv("DATABASE_URL")
	databaseUserName := os.Getenv("DATABASE_USER")
	databasePassword := os.Getenv("DATABASE_PASSWORD")
	databaseConnectionString := fmt.Sprintf("%v:%v@tcp(%v)/todo?parseTime=true", databaseUserName, databasePassword, databaseUrl)
	return databaseConnectionString
}
