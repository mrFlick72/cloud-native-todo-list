package model

import "time"

type Todo struct {
	Id       string
	Todo     string
	UserName string
	Date     time.Time
}

type TodoRepository interface {
	GetAllTodo() ([]*Todo, error)
	GetTodo(id int64) (*Todo, error)
	SaveTodo(todo *Todo) error
	RemoveTodo(id int64) error
}
