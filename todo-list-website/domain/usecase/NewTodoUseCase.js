export default class NewTodoUseCase {

    constructor(todoRepository, updateStateCallback) {
        this.updateStateCallback = updateStateCallback;
        this.todoRepository = todoRepository;
    }


    newTodo(inputValue) {
        this.todoRepository.insert({"todo": inputValue})
            .then((response) => {
                let splittedLocation = response.headers.get("Location").split("/");
                this.todoRepository.read(splittedLocation[splittedLocation.length - 1])
                    .then(value => this.updateStateCallback(value))
            })
    };

}