package web

import (
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
type TodoEndpoints struct {
	TodoRepository model.TodoRepository
}

func (endpoints *TodoEndpoints) GetTodoEndpoint(c echo.Context) error {
	allTodo, _ := endpoints.TodoRepository.GetAllTodo()
	var todoRepresentation []todoRepresentation
	for _, todo := range allTodo {
		todoRepresentation = append(todoRepresentation, fromDomainToRepresentation(todo))
	}
	return c.JSON(http.StatusOK, &todoRepresentation)
}

func (endpoints *TodoEndpoints) GetOneTodoEndpoint(c echo.Context) error {
	id := c.Param("id")
	todo, _ := endpoints.TodoRepository.GetTodo(id)
	return c.JSON(http.StatusOK, fromDomainToRepresentation(todo))
}

func (endpoints *TodoEndpoints) SaveTodoEndpoint(c echo.Context) error {
	todoRepresentation := new(todoRepresentation)
	if err := c.Bind(todoRepresentation); err != nil {
		return err
	}

	err := endpoints.TodoRepository.SaveTodo(fromRepresentationToDomain(todoRepresentation))

	if err != nil {
		return c.NoContent(http.StatusInternalServerError)
	}
	return c.NoContent(http.StatusCreated)
}

func (endpoints *TodoEndpoints) DeleteTodoEndpoint(c echo.Context) error {
	id := c.Param("id")
	err := endpoints.TodoRepository.RemoveTodo(id)

	if err != nil {
		return c.NoContent(http.StatusInternalServerError)
	}
	return c.NoContent(http.StatusNoContent)
}

func fromDomainToRepresentation(todo *model.Todo) todoRepresentation {
	return todoRepresentation{
		Id:       todo.Id,
		UserName: todo.UserName,
		Date:     model.FormatDateFor(todo.Date),
		Content:  todo.Content,
	}
}
func fromRepresentationToDomain(representation *todoRepresentation) *model.Todo {
	return &model.Todo{
		Id:       representation.Id,
		UserName: representation.UserName,
		Date:     model.ParseDateFor(representation.Date),
		Content:  representation.Content,
	}
}
