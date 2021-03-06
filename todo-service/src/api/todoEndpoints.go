package api

import (
	"githab/mrflick72/cloud-native-todo-list/todo-service/src/internal/clock"
	"githab/mrflick72/cloud-native-todo-list/todo-service/src/internal/logging"
	"githab/mrflick72/cloud-native-todo-list/todo-service/src/internal/todo"
	"github.com/labstack/echo"
	"net/http"
)

type todoRepresentation struct {
	Id       string `json:"id"`
	UserName string `json:"userName"`
	Date     string `json:"date"`
	Content  string `json:"content"`
}
type TodoEndpoints struct {
	TodoRepository todo.TodoRepository
}

func (endpoints *TodoEndpoints) GetTodoEndpoint(c echo.Context) error {
	userNameParameter := c.QueryParam("username")
	allTodo, err := endpoints.TodoRepository.GetAllTodo(userNameParameter)

	if noErrorFor(err) {
		todoRepresentation := fromDomainToRepresentationForAllTodoInList(allTodo)
		err = c.JSON(http.StatusOK, &todoRepresentation)
	}

	return err
}

func (endpoints *TodoEndpoints) GetOneTodoEndpoint(c echo.Context) error {
	id := c.Param("id")
	todo, err := endpoints.TodoRepository.GetTodo(id)

	if foundAtodo(err, todo) {
		err = c.JSON(http.StatusOK, fromDomainToRepresentation(todo))
	} else if notFoundAtodo(err, todo) {
		err = c.NoContent(http.StatusNotFound)
	}

	return err
}

func noErrorFor(err error) bool {
	return err == nil
}

func foundAtodo(err error, todo *todo.Todo) bool {
	return err == nil && todo != nil
}

func notFoundAtodo(err error, todo *todo.Todo) bool {
	return err != nil && todo == nil
}

func (endpoints *TodoEndpoints) SaveTodoEndpoint(c echo.Context) error {
	todoRepresentation := new(todoRepresentation)
	if err := c.Bind(todoRepresentation); err != nil {
		logging.LogErrorFor(err)
		return err
	}

	err := endpoints.TodoRepository.SaveTodo(fromRepresentationToDomain(todoRepresentation))

	if err != nil {
		logging.LogErrorFor(err)
		return c.NoContent(http.StatusInternalServerError)
	}
	return c.NoContent(http.StatusCreated)
}

func (endpoints *TodoEndpoints) DeleteTodoEndpoint(c echo.Context) error {
	id := c.Param("id")
	err := endpoints.TodoRepository.RemoveTodo(id)

	if err != nil {
		logging.LogErrorFor(err)
		return c.NoContent(http.StatusInternalServerError)
	}
	return c.NoContent(http.StatusNoContent)
}

func manageErrorFor(err error, c echo.Context) {
	if err != nil {
		logging.LogErrorFor(err)
		c.NoContent(http.StatusInternalServerError)
	}
}

func fromDomainToRepresentationForAllTodoInList(allTodo []*todo.Todo) []todoRepresentation {
	todoRepresentation := []todoRepresentation{}
	for _, todo := range allTodo {
		todoRepresentation = append(todoRepresentation, fromDomainToRepresentation(todo))
	}
	return todoRepresentation
}

func fromDomainToRepresentation(todo *todo.Todo) todoRepresentation {
	return todoRepresentation{
		Id:       todo.Id,
		UserName: todo.UserName,
		Date:     clock.FormatDateFor(todo.Date),
		Content:  todo.Content,
	}
}
func fromRepresentationToDomain(representation *todoRepresentation) *todo.Todo {
	return &todo.Todo{
		Id:       representation.Id,
		UserName: representation.UserName,
		Date:     clock.ParseDateFor(representation.Date),
		Content:  representation.Content,
	}
}
