const todoServiceHost = "http://localhost:8000"

export function insertTodoFor(todo) {
    return fetch(`${todoServiceHost}/todo`, {
        method: "POST",
        headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
        },
        body: JSON.stringify(todo),
        credentials: 'same-origin'
    })
}

export function readAllTodoFor(today) {
    return fetch(`${todoServiceHost}/todo?day=${today}`, {
        method: "GET",
        headers: {
            "Accept": "application/json"
        },
        credentials: 'same-origin'
    }).then((response => response.json()))
}

export function deleteTodoFor(todoId) {
    return fetch(`${todoServiceHost}/todo/${todoId}`, {
        method: "DELETE",
        credentials: 'same-origin'
    }).then((response => new Promise((resolve, reject) => {
        resolve(response.status === 204)
    })));
}