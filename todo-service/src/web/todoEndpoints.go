package web

/*
import (
	"githab/mrflick72/go-playground/src/model"
	"github.com/labstack/echo"
	"net/http"
)

func Endpoints(server *echo.Echo, todoRepository model.TodoRepository) {
	server.GET("/todo", func(c echo.Context) error {
		todo, _ := todoRepository.GetAllTodo()
		return c.JSON(http.StatusOK, &todo)
	})

	server.GET("/todo/:id", func(c echo.Context) error {
		id := c.Param("id")
		todo, _ := todoRepository.GetTodo(id)
		return c.JSON(http.StatusOK, &todo)
	})

	server.POST("/todo", func(c echo.Context) error {
		todo := new(model.Todo)
		if err := c.Bind(todo); err != nil {
			return err
		}

		err := todoRepository.SaveTodo(todo)

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

}*/
