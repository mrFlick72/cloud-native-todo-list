package adapter

import (
	"database/sql"
	"fmt"
	"githab/mrflick72/cloud-native-todo-list/todo-service/src/model"
	_ "github.com/go-sql-driver/mysql"
	"time"
)

type MySqlTodoRepository struct {
	ConnectionString string
}

func (repository *MySqlTodoRepository) GetAllTodo() ([]*model.Todo, error) {
	var result []*model.Todo

	database, err := openConnectionFor(repository)
	errorLog(err)

	query, _ := database.Prepare("SELECT id, user_name as username, date, content FROM TODO")
	rows, err := query.Query()
	errorLog(err)

	result = buildTodos(rows, result)

	closeResources(rows, query, database)

	return result, err
}

func (repository *MySqlTodoRepository) GetTodo(id string) (*model.Todo, error) {
	var result []*model.Todo

	database, err := openConnectionFor(repository)
	errorLog(err)

	query, _ := database.Prepare("SELECT id, user_name as username, date, content FROM TODO WHERE ID=?")
	rows, err := query.Query(id)
	errorLog(err)

	result = buildTodos(rows, result)

	closeResources(rows, query, database)

	return result[0], err
}

func (repository *MySqlTodoRepository) SaveTodo(todo *model.Todo) error {
	database, err := openConnectionFor(repository)
	errorLog(err)

	query, _ := database.Prepare("INSERT into TODO (id, user_name, date, content) VALUES (?, ?, ?, ?)")
	rows, err := query.Query(todo.Id, todo.UserName, todo.Date, todo.Content)
	errorLog(err)

	closeResources(rows, query, database)

	return err
}

func (repository *MySqlTodoRepository) RemoveTodo(id string) error {
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
		var id, content, username string
		var date time.Time
		rows.Scan(&id, &username, &date, &content)
		result = append(result, &model.Todo{
			Id:       id,
			UserName: username,
			Date:     date,
			Content:  content,
		})
	}
	return result
}

func errorLog(err error) {
	if err != nil {
		fmt.Println(err)
		panic(err.Error())
	}
}
