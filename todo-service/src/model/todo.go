package model

import "time"

type Todo struct {
	Id       string
	UserName string
	Date     time.Time
	Content  string
}

type TodoRepository interface {
	GetAllTodo() ([]*Todo, error)
	GetTodo(id string) (*Todo, error)
	SaveTodo(todo *Todo) error
	RemoveTodo(id string) error
}
