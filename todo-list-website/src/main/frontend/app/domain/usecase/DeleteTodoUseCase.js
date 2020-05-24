export default class NewTodoUseCase {

    constructor(todoRepository, updateStateCallback) {
        this.updateStateCallback = updateStateCallback;
        this.todoRepository = todoRepository;
    }

    deleteTodo(todoId) {
        this.todoRepository.delete(todoId)
            .then((result) => {this.updateStateCallback(todoId)});
    };

}