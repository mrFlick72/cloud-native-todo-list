
export function insertTodoFor(todo) {
    return fetch(`/website/todo`, {
        method: "POST",
        headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
        },
        body: JSON.stringify(todo),
        credentials: 'same-origin'
    })
}

export function readAllTodo() {
    return fetch(`/website/todo`, {
        method: "GET",
        headers: {
            "Accept": "application/json"
        },
        credentials: 'same-origin'
    }).then((response => response.json()))
}

export function deleteTodoFor(todoId) {
    return fetch(`/website/todo/${todoId}`, {
        method: "DELETE",
        credentials: 'same-origin'
    }).then((response => new Promise((resolve, reject) => {
        resolve(response.status === 204)
    })));
}