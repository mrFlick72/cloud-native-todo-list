import makeStyles from "@material-ui/core/styles/makeStyles";
import React, {useEffect, useState} from "react";
import {deleteTodoFor, readAllTodoFor} from "../domain/repository/TodoRepository";
import {AddCircle, Delete} from "@material-ui/icons";
import {Container} from "@material-ui/core";
import AppBar from "@material-ui/core/AppBar";
import Toolbar from "@material-ui/core/Toolbar";
import IconButton from "@material-ui/core/IconButton";
import MenuIcon from "@material-ui/icons/Menu";
import MenuItem from "@material-ui/core/MenuItem";
import Paper from "@material-ui/core/Paper";
import Card from "@material-ui/core/Card";
import CardContent from "@material-ui/core/CardContent";
import Typography from "@material-ui/core/Typography";
import TodoListTale from "../component/TodoListTable";

const useStyles = makeStyles({
    root: {
        flexGrow: 1,
        minWidth: 275,
    },
    bullet: {
        display: 'inline-block',
        margin: '0 2px',
        transform: 'scale(0.8)',
    },
    title: {
        fontSize: 14,
    },
    pos: {
        marginBottom: 12,
    },
});

export default function TodoListPage() {
    const classes = useStyles();
    const [todoList, setTodoList] = useState([])

    const fetchTodoListForToDay = () => {
        readAllTodoFor(new Date().getTime())
            .then(value => {
                let rows = value.map(value => {
                    value.id = value.id
                    value.content = value.content
                    value.delete = getDeleteLinkFor(value.id)
                    return value
                })
            })
    }

    const getDeleteLinkFor = (todoId) => {
        return <Delete onClick={() => {
            deleteTodoFor(todoId)
                .then(response => {
                    if (response) {
                        fetchTodoListForToDay();
                    }
                })
        }}/>;
    }

    useEffect(() => {
        fetchTodoListForToDay();
    }, [])

    return (
        <div className={classes.root}>
            <Container maxWidth="sm">

                <AppBar position="static">
                    <Toolbar variant="dense">
                        <IconButton className={classes.menuButton} aria-label="menu">
                            <MenuIcon/>
                        </IconButton>
                        <div dir="rtl">
                            <MenuItem>
                                <AddCircle fontSize="large"/>
                            </MenuItem>
                        </div>
                    </Toolbar>
                </AppBar>

                <Paper elevation={3}>
                    <Card className={classes.root} variant="outlined">
                        <CardContent>
                            <Typography className={classes.title} color="textSecondary" gutterBottom>
                                Todo list
                            </Typography>
                            <TodoListTale todoList={todoList}/>
                        </CardContent>

                    </Card>
                </Paper>
            </Container>
        </div>
    );
}
