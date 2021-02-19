package todo

import (
	"database/sql"
	"githab/mrflick72/cloud-native-todo-list/todo-service/src/internal/logging"
	"time"
)

func GetDatabaseConnectionFor(repository *MySqlTodoRepository) (*sql.DB, error) {
	database, err := OpenConnectionFor(repository)
	ErrorLog(err)
	return database, err
}

func OpenConnectionFor(repository *MySqlTodoRepository) (*sql.DB, error) {
	return sql.Open("mysql", repository.ConnectionString)
}

func CloseResources(rows *sql.Rows, query *sql.Stmt, database *sql.DB) {
	defer rows.Close()
	defer query.Close()
	defer database.Close()
}

func ErrorLog(err error) {
	if err != nil {
		logging.LogErrorFor(err)
	}
}

func BuildTodos(rows *sql.Rows, result []*Todo) []*Todo {
	for rows.Next() {
		var id, content, username string
		var date time.Time
		err := rows.Scan(&id, &username, &date, &content)
		ErrorLog(err)

		result = append(result, &Todo{
			Id:       id,
			UserName: username,
			Date:     date,
			Content:  content,
		})
	}
	return result
}
