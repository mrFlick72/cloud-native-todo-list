package web

import (
	"encoding/json"
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
	repository := adapter.InMemoryTodoRepository{}
	initDatabase(&repository)
	e := echo.New()

	req := httptest.NewRequest(http.MethodGet, "/todo", nil)
	rec := httptest.NewRecorder()

	c := e.NewContext(req, rec)
	c.SetPath("/todo")

	endpoint := TodoEndpoints{TodoRepository: &repository}
	endpoint.GetTodoEndpoint(c)

	expected, _ := json.Marshal([]todoRepresentation{fromDomainToRepresentation(aNewTodo())})
	actual := strings.Trim(rec.Body.String(), "\n")

	assert.Equal(t, http.StatusOK, rec.Code)
	assert.Equal(t, string(expected), actual)
}
func TestGetAllTodoWhenTodoIsEmpty(t *testing.T) {
	repository := adapter.InMemoryTodoRepository{}
	e := echo.New()

	req := httptest.NewRequest(http.MethodGet, "/todo", nil)
	rec := httptest.NewRecorder()

	c := e.NewContext(req, rec)
	c.SetPath("/todo")

	endpoint := TodoEndpoints{TodoRepository: &repository}
	endpoint.GetTodoEndpoint(c)

	expected, _ := json.Marshal([]todoRepresentation{})
	actual := strings.Trim(rec.Body.String(), "\n")

	assert.Equal(t, http.StatusOK, rec.Code)
	assert.Equal(t, string(expected), actual)
}
func TestGetAllTodoWhenRepositoryGoesInError(t *testing.T) {
	e := echo.New()

	req := httptest.NewRequest(http.MethodGet, "/todo", nil)
	rec := httptest.NewRecorder()

	c := e.NewContext(req, rec)
	c.SetPath("/todo")

	endpoint := TodoEndpoints{TodoRepository: nil}
	endpoint.GetTodoEndpoint(c)

	assert.Equal(t, http.StatusInternalServerError, rec.Code)
}

func TestGetOneTodo(t *testing.T) {
	repository := &adapter.InMemoryTodoRepository{}
	initDatabase(repository)
	e := echo.New()

	req := httptest.NewRequest(http.MethodGet, "/todo/1", nil)
	rec := httptest.NewRecorder()

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

func TestTodoEndpoints_SaveTodoEndpoint(t *testing.T) {
	repository := adapter.InMemoryTodoRepository{}
	initDatabase(&repository)
	e := echo.New()

	body, _ := json.Marshal(fromDomainToRepresentation(aNewTodo()))

	req := httptest.NewRequest(http.MethodPost, "/todo", strings.NewReader(string(body)))
	req.Header.Set(echo.HeaderContentType, echo.MIMEApplicationJSON)

	rec := httptest.NewRecorder()

	c := e.NewContext(req, rec)
	c.SetPath("/todo/:id")
	c.SetParamNames("id")
	c.SetParamValues("1")

	endpoint := TodoEndpoints{TodoRepository: &repository}
	endpoint.DeleteTodoEndpoint(c)

	assert.Equal(t, http.StatusNoContent, rec.Code)
}

func TestTodoEndpoints_DeleteTodoEndpoint(t *testing.T) {
	repository := adapter.InMemoryTodoRepository{}
	initDatabase(&repository)
	e := echo.New()

	body, _ := json.Marshal(fromDomainToRepresentation(aNewTodo()))

	req := httptest.NewRequest(http.MethodPost, "/todo", strings.NewReader(string(body)))
	req.Header.Set(echo.HeaderContentType, echo.MIMEApplicationJSON)

	rec := httptest.NewRecorder()

	c := e.NewContext(req, rec)
	c.SetPath("/todo")

	endpoint := TodoEndpoints{TodoRepository: &repository}
	endpoint.SaveTodoEndpoint(c)

	assert.Equal(t, http.StatusCreated, rec.Code)
}

func initDatabase(repository *adapter.InMemoryTodoRepository) {
	repository.SaveTodo(aNewTodo())
}

func aNewTodo() *model.Todo {
	return &model.Todo{
		Id:       "1",
		UserName: "valerio.vaudi",
		Date:     model.Now(),
		Content:  "a content",
	}
}
