import React from 'react';
import HeaderRow from "../component/HeaderRow";
import NewTodoItem from "../component/NewTodoItem";
import TodoItemList from "../component/TodoItemList";
import UpdateTodoItemPopUp from "../component/UpdateTodoItemPopUp";
import TodoRepository from "../domain/repository/TodoRepository";
import NewTodoUseCase from "../domain/usecase/DeleteTodoUseCase";
import UpdateTodoUseCase from "../domain/usecase/UpdateTodoUseCase";
import DeleteTodoUseCase from "../domain/usecase/DeleteTodoUseCase";

export default class Index extends React.Component {

    constructor(props) {
        super(props);
        this.todoRepository = new TodoRepository();
        this.state = {todoItems: []};
        this.newTodoInputRef = React.createRef();
        this.updateTodoInputRef = React.createRef();
        this.updatePopupId = "updatePopupId";

        this.newTodoUseCase = new NewTodoUseCase(this.todoRepository,
            value => {
                this.setState((prevState) => ({todoItems: [...prevState.todoItems, value]}))
            });

        this.updateTodoUseCase = new UpdateTodoUseCase(this.todoRepository, (todoId, todoTextValue) => {
            this.setState((prevState) => ({
                todoItems: prevState.todoItems.map(todoItem => {
                    if (todoItem.id === todoId) {
                        todoItem.todo = todoTextValue;
                    }

                    return todoItem;
                })
            }));
            $("#" + this.updatePopupId).modal("hide")
        });

        this.deleteTodoUseCase = new DeleteTodoUseCase(this.todoRepository, (todoId) => {
            this.setState((prevState) => ({
                todoItems: prevState.todoItems.filter(todoItem => todoItem.id !== todoId)
            }))
        });


        this.deleteTodoItem = this.deleteTodoItem.bind(this);
        this.newTodoInputOnClickHandler = this.newTodoInputOnClickHandler.bind(this);
        this.updateTodoItem = this.updateTodoItem.bind(this);
        this.openUpdatePopUpTodoItem = this.openUpdatePopUpTodoItem.bind(this);
    }

    componentDidMount() {
        this.todoRepository.readAll(new Date().getTime()).then(response => {
            this.setState({todoItems: response})
        });
    }

    newTodoInputOnClickHandler() {
        this.newTodoUseCase.newTodo(this.newTodoInputRef.current.value);
    };

    deleteTodoItem(todoId) {
        this.deleteTodoUseCase.deleteTodo(todoId);
    }

    openUpdatePopUpTodoItem(popupId, todoId, prevTodoText) {
        this.setState({updateItemId: todoId});
        this.updateTodoInputRef.current.value = prevTodoText;
        $("#" + this.updatePopupId).modal("show")
    }

    updateTodoItem() {
        this.updateTodoUseCase.updateTodo(this.state.updateItemId, this.updateTodoInputRef.current.value);
    }

    render() {
        return (
            <div className="container">
                <HeaderRow title="Todo List App"/>

                <div className="row">
                    <div className="col-12">
                        <NewTodoItem buttonText="Insert todo"
                                     newTodoInputRef={this.newTodoInputRef}
                                     newTodoInputOnClickHandler={this.newTodoInputOnClickHandler}/>
                    </div>
                </div>
                <div className="row">
                    <div className="col-12">
                        <hr/>
                    </div>
                </div>
                <div className="row">
                    <div className="col-12">
                        <TodoItemList deleteTodoItem={this.deleteTodoItem}
                                      openUpdatePopUpTodoItem={this.openUpdatePopUpTodoItem}
                                      openUpdatePopUpId={this.updatePopupId}
                                      todoItems={this.state.todoItems}/>
                    </div>
                </div>

                <UpdateTodoItemPopUp updateTodoInputRef={this.updateTodoInputRef}
                                     updateTodoItem={this.updateTodoItem}
                                     modalId={this.updatePopupId}/>
            </div>
        )
    }
}