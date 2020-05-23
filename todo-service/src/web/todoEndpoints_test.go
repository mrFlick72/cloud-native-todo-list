package web

import (
	"encoding/json"
	"fmt"
	"githab/mrflick72/cloud-native-todo-list/todo-service/src/adapter"
	"githab/mrflick72/cloud-native-todo-list/todo-service/src/model"
	"github.com/labstack/echo"
	"github.com/stretchr/testify/assert"
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"
)

func TestGetAllTodo(t *testing.T) {
	var repository model.TodoRepository = &adapter.InMemoryTodoRepository{}
	repository.SaveTodo(aNewTodo())
	e := echo.New()

	req := httptest.NewRequest(http.MethodGet, "/todo", nil)
	rec := httptest.NewRecorder()

	e.NewContext(req, rec)

	c := e.NewContext(req, rec)
	c.SetPath("/todo")

	endpoint := TodoEndpoints{TodoRepository: repository}
	endpoint.GetTodoEndpoint(c)

	expected, _ := json.Marshal([]todoRepresentation{fromDomainToRepresentation(aNewTodo())})
	actual := strings.Trim(rec.Body.String(), "\n")

	assert.Equal(t, http.StatusOK, rec.Code)
	assert.Equal(t, string(expected), actual)
}

func TestGetOneTodo(t *testing.T) {
	var repository model.TodoRepository = &adapter.InMemoryTodoRepository{}
	repository.SaveTodo(aNewTodo())
	e := echo.New()

	req := httptest.NewRequest(http.MethodGet, "/todo/1", nil)
	rec := httptest.NewRecorder()

	e.NewContext(req, rec)

	c := e.NewContext(req, rec)
	c.SetPath("/todo/:id")
	c.SetParamNames("id")
	c.SetParamValues("1")

	endpoint := TodoEndpoints{TodoRepository: repository}
	endpoint.GetOneTodoEndpoint(c)

	expected, _ := json.Marshal(fromDomainToRepresentation(aNewTodo()))
	actual := strings.Trim(rec.Body.String(), "\n")

	assert.Equal(t, http.StatusOK, rec.Code)
	assert.Equal(t, string(expected), actual)
}

func initDatabase(repository *adapter.InMemoryTodoRepository) {
	fmt.Println("save a todo")
}

func aNewTodo() *model.Todo {
	return &model.Todo{
		Id:       "1",
		UserName: "valerio.vaudi",
		Date:     model.Now(),
		Content:  "a content",
	}
}
