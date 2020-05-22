import React from 'react';
import TodoItem from './TodoItem';

export default ({todoItems, deleteTodoItem, openUpdatePopUpTodoItem, openUpdatePopUpId}) => {
    return (<table className="table">
        <thead>
        <tr>
            <th scope="col">Todo</th>
            <th className="text-center" scope="col">Delete</th>
        </tr>
        </thead>
        <tbody>
        {
            todoItems.map(item => <tr key={item.id}>
                <TodoItem todoId={item.id} todo={item.todo}/>
                <td className="text-center">
                    <div className="btn-group" role="group" aria-label="Basic example">
                        <button type="button"
                                className="btn btn-secondary"
                                onClick={openUpdatePopUpTodoItem.bind(this, openUpdatePopUpId, item.id, item.todo)}>
                            <i className="fas fa-edit fa-lg"></i>
                        </button>
                        <button type="button"
                                onClick={deleteTodoItem.bind(this, item.id)}
                                className="btn btn-secondary"
                                data-todoId={item.id}>
                            <i className="fas fa-trash-alt fa-lg"></i>
                        </button>
                    </div>
                </td>
            </tr>)
        }
        </tbody>
    </table>)
}