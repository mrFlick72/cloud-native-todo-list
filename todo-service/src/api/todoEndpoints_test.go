package api

import (
	"database/sql"
	"encoding/json"
	"githab/mrflick72/cloud-native-todo-list/todo-service/src/internal/clock"
	"githab/mrflick72/cloud-native-todo-list/todo-service/src/internal/todo"
	"github.com/labstack/echo"
	"github.com/stretchr/testify/assert"
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"
)

var (
	userName         = "user-name"
	connectionString = "root:root@tcp(localhost)/todo?parseTime=true"
	repository       = todo.MySqlTodoRepository{ConnectionString: connectionString}
)

func TestGetAllTodo(t *testing.T) {
	clearDatabase()
	initDatabase(&repository)
	e := echo.New()

	req := httptest.NewRequest(http.MethodGet, "/todo?username=valerio.vaudi", nil)
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
	clearDatabase()
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

func TestGetOneTodo(t *testing.T) {
	clearDatabase()
	initDatabase(&repository)
	e := echo.New()

	req := httptest.NewRequest(http.MethodGet, "/todo/1", nil)
	rec := httptest.NewRecorder()

	c := e.NewContext(req, rec)
	c.SetPath("/todo/:id")
	c.SetParamNames("id")
	c.SetParamValues("1")

	endpoint := TodoEndpoints{TodoRepository: &repository}
	endpoint.GetOneTodoEndpoint(c)

	expected, _ := json.Marshal(fromDomainToRepresentation(aNewTodo()))
	actual := strings.Trim(rec.Body.String(), "\n")

	assert.Equal(t, http.StatusOK, rec.Code)
	assert.Equal(t, string(expected), actual)
}

func TestWhenGetOneTodoIsEmpty(t *testing.T) {
	clearDatabase()
	e := echo.New()

	req := httptest.NewRequest(http.MethodGet, "/todo/1", nil)
	rec := httptest.NewRecorder()

	c := e.NewContext(req, rec)
	c.SetPath("/todo/:id")
	c.SetParamNames("id")
	c.SetParamValues("1")

	endpoint := TodoEndpoints{TodoRepository: &repository}
	endpoint.GetOneTodoEndpoint(c)

	assert.Equal(t, http.StatusNotFound, rec.Code)
}

func TestTodoEndpoints_SaveTodoEndpoint(t *testing.T) {
	clearDatabase()
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
	clearDatabase()
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

func aNewTodo() *todo.Todo {
	return &todo.Todo{
		Id:       "1",
		UserName: "valerio.vaudi",
		Date:     clock.Now(),
		Content:  "a content",
	}
}

func initDatabase(repository todo.TodoRepository) {
	repository.SaveTodo(aNewTodo())
}

func clearDatabase() {
	open, _ := sql.Open("mysql", connectionString)
	open.Exec("truncate table TODO")
}
