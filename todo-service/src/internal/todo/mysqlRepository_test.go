package todo

import (
	"database/sql"
	"fmt"
	"githab/mrflick72/cloud-native-todo-list/todo-service/src/internal/clock"
	"github.com/google/uuid"
	"sort"
	"testing"
)

var (
	repository = MySqlTodoRepository{ConnectionString: "root:root@tcp(localhost)/todo?parseTime=true"}
)

func TestMySqlTodoRepository_SaveTodo(t *testing.T) {
	todo := aNewTodo()

	err := repository.SaveTodo(&todo)

	assertThatNoErrorFor(t, err, "some errors occurs during the insert query")
	clearDatabase()
}

func TestMySqlTodoRepository_GetTodo(t *testing.T) {
	expected := aNewTodo()
	err := repository.SaveTodo(&expected)
	assertThatNoErrorFor(t, err, "some errors occurs during the insert query")

	actual, err := repository.GetTodo(expected.Id)
	t.Log("actual ", actual)
	assertThatNoErrorFor(t, err, "some errors occurs during the find one query")

	if expected != *actual {
		t.Log("expected ", expected)
		t.Log("actual ", actual)
		t.Error("the retrieved todo is not wat we expect")
	}

	clearDatabase()
}

func TestMySqlTodoRepository_GetTodoNotFound(t *testing.T) {
	actual, err := repository.GetTodo("123456789987")
	fmt.Println("actual ", actual)
	assertThatNoErrorFor(t, err, "some errors occurs during the find one query")

	if actual != nil {
		fmt.Println("actual ", actual)
		t.Error("the retrieved todo is not wat we expect")
	}

	clearDatabase()
}

func TestMySqlTodoRepository_GetAllTodo(t *testing.T) {
	aTodo := aNewTodo()
	anotherTodo := aNewTodo()

	repository.SaveTodo(&aTodo)
	repository.SaveTodo(&anotherTodo)

	expected := orderedTodoListById(aTodo, anotherTodo)

	actual, err := repository.GetAllTodo("user-name")
	assertThatNoErrorFor(t, err, "some errors occurs during the select query")

	assertEqualityFor(t, expected[0], actual[0])
	assertEqualityFor(t, expected[1], actual[1])

	clearDatabase()
}

func TestMySqlTodoRepository_RemoveTodo(t *testing.T) {
	aTodo := aNewTodo()
	anotherTodo := aNewTodo()

	repository.SaveTodo(&aTodo)
	repository.SaveTodo(&anotherTodo)

	expected := []Todo{aTodo}

	sort.Slice(expected, func(p, q int) bool {
		return expected[p].Id < expected[q].Id
	})

	repository.RemoveTodo(anotherTodo.Id)
	actual, err := repository.GetAllTodo("user-name")
	assertThatNoErrorFor(t, err, "some errors occurs during the select query")

	assertEqualityFor(t, expected[0], actual[0])
	clearDatabase()
}

func assertEqualityFor(t *testing.T, expected Todo, actual *Todo) {
	if expected != *actual {
		t.Error("expected: ", expected)
		t.Error("actual: ", actual)
		t.Error("the retrieved todo is not wat we expect")
	}
}

func clearDatabase() {
	open, _ := sql.Open("mysql", repository.ConnectionString)
	open.Exec("truncate table TODO")
}

func assertThatNoErrorFor(t *testing.T, err error, errorMessage string) {
	if err != nil {
		t.Log(errorMessage)
	}
}

func aNewTodo() Todo {
	random, _ := uuid.NewRandom()
	return Todo{
		Id:       random.String(),
		Content:  "it is a todo",
		UserName: "user-name",
		Date:     clock.ToDay(),
	}
}
func orderedTodoListById(aTodo Todo, anotherTodo Todo) []Todo {
	expected := []Todo{aTodo, anotherTodo}
	sort.Slice(expected, func(p, q int) bool {
		return expected[p].Id < expected[q].Id
	})
	return expected
}
