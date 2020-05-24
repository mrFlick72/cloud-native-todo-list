import React from "react";
import ReactDOM from 'react-dom';
import TodoListPage from "./app/page/TodoListPage";


if (document.getElementById('app')) {
    ReactDOM.render(<TodoListPage/>, document.getElementById('app'));
}