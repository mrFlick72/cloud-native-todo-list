import React from "react";
import ReactDOM from 'react-dom';
import TodoListPage from "./app/page/TodoListPage";

let body = document.getElementsByTagName('body')[0];
let div = document.createElement('div');
div.id = "app"
body.append(div)
ReactDOM.render(<TodoListPage/>, document.getElementById('app'));