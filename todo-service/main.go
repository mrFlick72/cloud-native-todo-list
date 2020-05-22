package main

import (
	"github.com/labstack/echo"
)

func main() {
	//repository := adapter.MySqlTodoRepository{ConnectionString: "root:root@tcp(localhost)/todo?parseTime=true"}
	server := echo.New()
	//web.Endpoints(server, &repository)

	server.Start(":8000")
}
