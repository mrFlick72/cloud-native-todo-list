import Table from "@material-ui/core/Table";
import TableHead from "@material-ui/core/TableHead";
import TableRow from "@material-ui/core/TableRow";
import React from "react";
import TableBody from "@material-ui/core/TableBody";
import TableCell from "@material-ui/core/TableCell";
import TableContainer from "@material-ui/core/TableContainer";
import Paper from '@material-ui/core/Paper';

export default function TodoListTale({todoList}) {
    return (<TableContainer component={Paper}>
        <Table aria-label="simple table">
            <TableHead>
                <TableRow>
                    <TableCell>Content</TableCell>
                    <TableCell>Delete</TableCell>
                </TableRow>
            </TableHead>
            <TableBody>
                {todoList.map((todo) => (
                    <TableRow key={todo.id}>
                        <TableCell component="th" scope="row">
                            {todo.content}
                        </TableCell>
                        <TableCell align="right">{todo.delete}</TableCell>
                    </TableRow>
                ))}
            </TableBody>
        </Table>
    </TableContainer>)
}