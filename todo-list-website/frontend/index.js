import React from "react";
import ReactDOM from 'react-dom';
import TodoListPage from "./app/page/TodoListPage";

let div = document.createElement('div');
div.id = "app"
document.append(div)
ReactDOM.render(<TodoListPage/>, document.getElementById('app'));