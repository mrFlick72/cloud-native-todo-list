package web

import (
	"githab/mrflick72/cloud-native-todo-list/todo-service/src/logging"
	"githab/mrflick72/cloud-native-todo-list/todo-service/src/model"
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
	TodoRepository model.TodoRepository
}

func (endpoints *TodoEndpoints) GetTodoEndpoint(c echo.Context) error {
	userNameParameter := c.QueryParam("username")
	allTodo, err := endpoints.TodoRepository.GetAllTodo(userNameParameter)
	manageErrorFor(err, c)

	todoRepresentation := fromDomainToRepresentationForAllTodoInList(allTodo)
	err = c.JSON(http.StatusOK, &todoRepresentation)
	return err
}

func (endpoints *TodoEndpoints) GetOneTodoEndpoint(c echo.Context) error {
	id := c.Param("id")
	todo, err := endpoints.TodoRepository.GetTodo(id)
	manageErrorFor(err, c)

	if noErrorFor(err) {
		if todo != nil {
			err = c.JSON(http.StatusOK, fromDomainToRepresentation(todo))
		} else {
			err = c.NoContent(http.StatusNotFound)
		}
	}

	return err
}

func noErrorFor(err error) bool {
	return err == nil
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

func fromDomainToRepresentationForAllTodoInList(allTodo []*model.Todo) []todoRepresentation {
	todoRepresentation := []todoRepresentation{}
	for _, todo := range allTodo {
		todoRepresentation = append(todoRepresentation, fromDomainToRepresentation(todo))
	}
	return todoRepresentation
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
