package web

import (
	"fmt"
	"githab/mrflick72/cloud-native-todo-list/todo-service/src/model"
	"github.com/labstack/echo"
	"net/http"
)

type todoRepresentation struct {
	Id       string
	UserName string
	Date     string
	Content  string
}

func Endpoints(server *echo.Echo, todoRepository model.TodoRepository) {
	server.GET("/todo", func(c echo.Context) error {
		allTodo, _ := todoRepository.GetAllTodo()
		todoRepresentation := []todoRepresentation{}
		for _, todo := range allTodo {
			fmt.Println(todo)
			todoRepresentation = append(todoRepresentation, fromDomainToRepresentation(todo))
		}
		return c.JSON(http.StatusOK, &todoRepresentation)
	})

	server.GET("/todo/:id", func(c echo.Context) error {
		id := c.Param("id")
		todo, _ := todoRepository.GetTodo(id)
		return c.JSON(http.StatusOK, fromDomainToRepresentation(todo))
	})

	server.POST("/todo", func(c echo.Context) error {
		todo := new(todoRepresentation)
		if err := c.Bind(todo); err != nil {
			return err
		}

		err := todoRepository.SaveTodo(&model.Todo{
			Id:       todo.Id,
			UserName: todo.UserName,
			Date:     model.ParseDateFor(todo.Date),
			Content:  todo.Content,
		})

		if err != nil {
			return c.NoContent(http.StatusInternalServerError)
		}
		return c.NoContent(http.StatusCreated)
	})

	server.DELETE("/todo/:id", func(c echo.Context) error {
		id := c.Param("id")
		err := todoRepository.RemoveTodo(id)

		if err != nil {
			return c.NoContent(http.StatusInternalServerError)
		}
		return c.NoContent(http.StatusNoContent)
	})

}

func fromDomainToRepresentation(todo *model.Todo) todoRepresentation {
	return todoRepresentation{
		Id:       todo.Id,
		UserName: todo.UserName,
		Date:     model.FormatDateFor(todo.Date),
		Content:  todo.Content,
	}
}
