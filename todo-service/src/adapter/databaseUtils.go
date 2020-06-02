package adapter

import (
	"database/sql"
	"githab/mrflick72/cloud-native-todo-list/todo-service/src/logging"
	"githab/mrflick72/cloud-native-todo-list/todo-service/src/model"
	"time"
)

func getDatabaseConnectionFor(repository *MySqlTodoRepository) (*sql.DB, error) {
	database, err := openConnectionFor(repository)
	errorLog(err)
	return database, err
}

func openConnectionFor(repository *MySqlTodoRepository) (*sql.DB, error) {
	return sql.Open("mysql", repository.ConnectionString)
}

func closeResources(rows *sql.Rows, query *sql.Stmt, database *sql.DB) {
	defer rows.Close()
	defer query.Close()
	defer database.Close()
}

func errorLog(err error) {
	if err != nil {
		logging.LogErrorFor(err)
	}
}

func buildTodos(rows *sql.Rows, result []*model.Todo) []*model.Todo {
	for rows.Next() {
		var id, content, username string
		var date time.Time
		err := rows.Scan(&id, &username, &date, &content)
		errorLog(err)

		result = append(result, &model.Todo{
			Id:       id,
			UserName: username,
			Date:     date,
			Content:  content,
		})
	}
	return result
}
