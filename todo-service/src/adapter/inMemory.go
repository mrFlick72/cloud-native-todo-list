package adapter

import (
	"errors"
	"githab/mrflick72/cloud-native-todo-list/todo-service/src/model"
)

type InMemoryTodoRepository struct {
	database []*model.Todo
}

func (repository *InMemoryTodoRepository) GetAllTodo() ([]*model.Todo, error) {
	return repository.database, nil
}

func (repository *InMemoryTodoRepository) GetAllTodoByDate(date string) ([]*model.Todo, error) {
	database := repository.database
	filteredDatabase := []*model.Todo{}

	for _, todo := range database {
		if model.FormatDateFor(todo.Date) == date {
			filteredDatabase = append(filteredDatabase, todo)
		}
	}
	return filteredDatabase, errors.New("todo entry do not found")
}

func (repository *InMemoryTodoRepository) GetTodo(id string) (*model.Todo, error) {
	database := repository.database

	for _, todo := range database {
		if todo.Id == id {
			return todo, nil
		}
	}
	return &model.Todo{}, errors.New("todo entry do not found")
}

func (repository *InMemoryTodoRepository) SaveTodo(todo *model.Todo) error {
	repository.database = append(repository.database, todo)
	return nil
}

func (repository *InMemoryTodoRepository) RemoveTodo(id string) error {
	database := repository.database

	for index, todo := range database {
		if todo.Id == id {
			repository.database = append(database[:index], database[index+1:]...)
			return nil
		}
	}
	return nil
}
