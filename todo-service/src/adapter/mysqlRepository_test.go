package adapter

import (
	"fmt"
	"githab/mrflick72/go-playground/src/model"
	"github.com/google/uuid"
	"testing"
)

var (
	repository = MySqlTodoRepository{ConnectionString: "root:root@tcp(localhost)/todo?parseTime=true"}
)

func TestMySqlTodoRepository_SaveTodo(t *testing.T) {
	random, _ := uuid.NewRandom()
	err := repository.SaveTodo(&model.Todo{
		Id:       random.String(),
		Content:  "it is a todo",
		UserName: "my user name",
		Date:     model.Now(),
	})

	if err != nil {
		t.Error("some errors occurs during the insert query")
	}
}

func TestMySqlTodoRepository_GetTodo(t *testing.T) {
	random, _ := uuid.NewRandom()

	expected := model.Todo{
		Id:       random.String(),
		Content:  "it is a todo",
		UserName: "my user name",
		Date:     model.Now(),
	}
	err := repository.SaveTodo(&expected)

	if err != nil {
		t.Error("some errors occurs during the insert query")
	}

	actual, err := repository.GetTodo(random.String())

	if err != nil {
		t.Error("some errors occurs during the find one query")
	}

	if expected != *actual {
		fmt.Println("expected ", expected)
		fmt.Println("actual ", actual)
		t.Error("the retrieved todo is not wat we expect")

	}
}
