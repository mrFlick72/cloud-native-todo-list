package main

import (
	"fmt"
	"githab/mrflick72/cloud-native-todo-list/todo-service/src/configuration"
	"os"
)

func main() {
	server := configuration.ServerConfigurer()
	webServerPort := os.Getenv("WEB_SERVER_PORT")
	server.Start(fmt.Sprintf(":%v", webServerPort))
}
