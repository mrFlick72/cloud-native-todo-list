package main

import (
	"githab/mrflick72/cloud-native-todo-list/todo-service/src/adapter"
	"githab/mrflick72/cloud-native-todo-list/todo-service/src/web"
	"github.com/labstack/echo"
)

func main() {
	repository := adapter.MySqlTodoRepository{ConnectionString: "root:root@tcp(localhost)/todo?parseTime=true"}
	server := echo.New()
	web.Endpoints(server, &repository)

	server.Start(":8000")
}
