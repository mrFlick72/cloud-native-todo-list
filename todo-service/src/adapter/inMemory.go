package adapter

import (
	"errors"
	"githab/mrflick72/cloud-native-todo-list/todo-service/src/model"
)

type InMemoryTodoRepository struct {
	Database []*model.Todo
}

func (repository *InMemoryTodoRepository) GetAllTodo(userName string) ([]*model.Todo, error) {
	database := repository.Database
	var err error
	if database == nil {
		err = errors.New("not valid database")
	}
	var result = []*model.Todo{}

	for _, todo := range database {
		if todo.UserName == userName {
			result = append(result, todo)
		}
	}
	return result, err
}

func (repository *InMemoryTodoRepository) GetTodo(id string) (*model.Todo, error) {
	database := repository.Database

	for _, todo := range database {
		if todo.Id == id {
			return todo, nil
		}
	}
	return &model.Todo{}, errors.New("todo entry do not found")
}

func (repository *InMemoryTodoRepository) SaveTodo(todo *model.Todo) error {
	repository.Database = append(repository.Database, todo)
	return nil
}

func (repository *InMemoryTodoRepository) RemoveTodo(id string) error {
	database := repository.Database

	for index, todo := range database {
		if todo.Id == id {
			repository.Database = append(database[:index], database[index+1:]...)
			return nil
		}
	}
	return nil
}
