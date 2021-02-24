package todo

import (
	"errors"
	_ "github.com/go-sql-driver/mysql"
)

type MySqlTodoRepository struct {
	ConnectionString string
}

func (repository *MySqlTodoRepository) GetAllTodo(userName string) ([]*Todo, error) {
	result := make([]*Todo, 0)

	db, err := GetDatabaseConnectionFor(repository)

	query, _ := db.Prepare("SELECT id, user_name as username, date, content FROM TODO where user_name = ?")
	rows, err := query.Query(userName)
	ErrorLog(err)
	result = BuildTodos(rows, result)

	CloseResources(rows, query, db)
	return result, err
}

func (repository *MySqlTodoRepository) GetTodo(id string) (*Todo, error) {
	var selectAll []*Todo

	db, err := GetDatabaseConnectionFor(repository)

	query, _ := db.Prepare("SELECT id, user_name as username, date, content FROM TODO WHERE ID=?")
	rows, err := query.Query(id)
	ErrorLog(err)

	selectAll = BuildTodos(rows, selectAll)

	CloseResources(rows, query, db)

	if selectAll != nil && len(selectAll) > 0 {
		return selectAll[0], err
	} else {
		err := errors.New("todo with id " + id + " not found")
		ErrorLog(err)
		return nil, err
	}

}

func (repository *MySqlTodoRepository) SaveTodo(todo *Todo) error {
	db, err := GetDatabaseConnectionFor(repository)

	query, _ := db.Prepare("INSERT into TODO (id, user_name, date, content) VALUES (?, ?, ?, ?)")
	rows, err := query.Query(todo.Id, todo.UserName, todo.Date, todo.Content)
	ErrorLog(err)

	CloseResources(rows, query, db)

	return err
}

func (repository *MySqlTodoRepository) RemoveTodo(id string) error {
	db, err := GetDatabaseConnectionFor(repository)

	query, _ := db.Prepare("DELETE FROM TODO WHERE id=?")
	rows, err := query.Query(id)
	ErrorLog(err)

	CloseResources(rows, query, db)

	return err
}
