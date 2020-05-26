package main

import (
	"githab/mrflick72/cloud-native-todo-list/todo-service/src/adapter"
	"githab/mrflick72/cloud-native-todo-list/todo-service/src/web"
	"github.com/dgrijalva/jwt-go"
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
		AllowOrigins: []string{"*"},
		AllowMethods: []string{"GET", "POST", "DELETE"},
		AllowHeaders: []string{echo.HeaderOrigin, echo.HeaderContentType, echo.HeaderAccept},
	}))
	server.Use(middleware.Logger())

	public_key := "-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAhUROhPm9CVggdSHOEz41BhdgMxG2Z7YAPFV5m/E3Gi0PRWjs8DYa2nxUORYJObk/AJ9WM1AsEszJI6xyzNboNLfTM9tHUJntq7ruCYGrll97+O61HlfuM6sS5zdkgVVrmBwzc2U0uMJZO9IIrr9WxKA2yvoV287qRZKWqJBq5JSvvrnCszo3W4+UkWMQBe7T3F++V//SoXM9iRgJWp0CP7/rHqu/kKymSa+AzZquc7VQ2a5iJnR5OBz8XAx4ZRY+9ABroF6jerB18Bf6aICYMl7lX2sVVDg8enQwHitJhoqYMYTwQhYbhO93Ib1wxnUGiJCaPK88c/KK7ge/puvPIwIDAQAB\n-----END PUBLIC KEY-----"
	//certificate:= "MIICoTCCAYkCBgFyUclOSTANBgkqhkiG9w0BAQsFADAUMRIwEAYDVQQDDAl0b2RvLWxpc3QwHhcNMjAwNTI2MTYxOTA2WhcNMzAwNTI2MTYyMDQ2WjAUMRIwEAYDVQQDDAl0b2RvLWxpc3QwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCFRE6E+b0JWCB1Ic4TPjUGF2AzEbZntgA8VXmb8TcaLQ9FaOzwNhrafFQ5Fgk5uT8An1YzUCwSzMkjrHLM1ug0t9Mz20dQme2ruu4JgauWX3v47rUeV+4zqxLnN2SBVWuYHDNzZTS4wlk70giuv1bEoDbK+hXbzupFkpaokGrklK++ucKzOjdbj5SRYxAF7tPcX75X/9Khcz2JGAlanQI/v+seq7+QrKZJr4DNmq5ztVDZrmImdHk4HPxcDHhlFj70AGugXqN6sHXwF/pogJgyXuVfaxVUODx6dDAeK0mGipgxhPBCFhuE73chvXDGdQaIkJo8rzxz8oruB7+m688jAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAFr5i/ITi7Dg/Z1POB7kJLWob+am/f4mgVlEfAddSc92glUxRtgQJCmmAz+rF0LA9zYJfyypcmijpWdhERplg0c+joJ5gTMnOhequ6/w5++K0SZtfDVH8s57Sgri1NYwGikqZsnNCIGGJKhN10B4h99SalDPpQAnpB47ycB4hRSbklCmorMiG+UP1wvQavVAxr71hRa2xa7ClMI+hIwWci7yMv8AWCjQXHNX+VKASEJy+eO8haVUJ+gwl77/Ww1lH3pgVnM9NXjxtxHumfZWMvhWmzMVblk57tDxwzt9u4oKv0NEq1rbw3MLijS+hosUclxDgH6SQrFhfND/Z/iBFck="

	server.Use(middleware.JWTWithConfig(middleware.JWTConfig{
		SigningMethod: "RS256",
		SigningKey:    public_key,
		TokenLookup:   "header:Authorization",
		AuthScheme:    "Bearer",
		Claims:        jwt.MapClaims{},
	}))

	server.Start(":8000")
}
