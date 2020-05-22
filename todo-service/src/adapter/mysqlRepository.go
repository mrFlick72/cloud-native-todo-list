package adapter

import (
	"database/sql"
	"fmt"
	"githab/mrflick72/go-playground/src/model"
	_ "github.com/go-sql-driver/mysql"
)

type MySqlTodoRepository struct {
	ConnectionString string
}

func (repository *MySqlTodoRepository) GetAllTodo() ([]*model.Todo, error) {
	var result []*model.Todo

	database, err := openConnectionFor(repository)
	errorLog(err)

	query, _ := database.Prepare("SELECT id, content FROM TODO")
	rows, err := query.Query()
	errorLog(err)

	result = buildTodos(rows, result)

	closeResources(rows, query, database)

	return result, err
}

func (repository *MySqlTodoRepository) GetTodo(id int64) (*model.Todo, error) {
	var result []*model.Todo

	database, err := openConnectionFor(repository)
	errorLog(err)

	query, _ := database.Prepare("SELECT id, content FROM TODO WHERE ID=?")
	rows, err := query.Query(id)
	errorLog(err)

	result = buildTodos(rows, result)

	closeResources(rows, query, database)

	return result[0], err
}

func (repository *MySqlTodoRepository) SaveTodo(todo *model.Todo) error {
	database, err := openConnectionFor(repository)
	errorLog(err)

	query, _ := database.Prepare("INSERT into TODO (id, content) VALUES (?, ?)")
	rows, err := query.Query(todo.Id, todo.Content)
	errorLog(err)

	closeResources(rows, query, database)

	return err
}

func (repository *MySqlTodoRepository) RemoveTodo(id int64) error {
	database, err := openConnectionFor(repository)
	errorLog(err)

	query, _ := database.Prepare("DELETE FROM TODO WHERE id=?")
	rows, err := query.Query(id)
	errorLog(err)

	closeResources(rows, query, database)

	return err
}

func openConnectionFor(repository *MySqlTodoRepository) (*sql.DB, error) {
	return sql.Open("mysql", repository.ConnectionString)
}

func closeResources(rows *sql.Rows, query *sql.Stmt, database *sql.DB) {
	defer rows.Close()
	defer query.Close()
	defer database.Close()
}

func buildTodos(rows *sql.Rows, result []*model.Todo) []*model.Todo {
	for rows.Next() {
		var id int64
		var content string
		rows.Scan(&id, &content)
		todo := model.Todo{Id: id, Content: content}
		result = append(result, &todo)
	}
	return result
}

func errorLog(err error) {
	if err != nil {
		fmt.Println(err, "\n")
	}
}
