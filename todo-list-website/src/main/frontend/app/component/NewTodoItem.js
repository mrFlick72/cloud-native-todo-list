import React, {useState} from 'react';
import DialogActions from "@material-ui/core/DialogActions";
import Divider from "@material-ui/core/Divider";
import DialogContentText from "@material-ui/core/DialogContentText";
import DialogContent from "@material-ui/core/DialogContent";
import DialogTitle from "@material-ui/core/DialogTitle";
import Button from "@material-ui/core/Button";
import Dialog from "@material-ui/core/Dialog";
import {insertTodoFor} from "../domain/repository/TodoRepository";
import {v4 as uuidv4} from 'uuid';
import moment from "moment";

export default function NewTodoItem({open, onClose, onSave}) {
    const [content, setContent] = useState("")

    return (
        <Dialog onClose={onClose} aria-labelledby="simple-dialog-title" open={open} maxWidth="lg">
            <DialogTitle id="simple-dialog-title">New Todo </DialogTitle>
            <DialogContent>
                <DialogContentText id="alert-dialog-description">
                    <b> Put hear the your new todo</b>
                </DialogContentText>

                <textarea id="todoArea" onChange={(value) => {
                    setContent(value.target.value)
                }}/>

                <Divider/>

                <DialogActions>
                    <Button color="primary"
                            variant="outlined"
                            onClick={() => {
                                insertTodoFor({
                                    id: uuidv4(),
                                    userName: "",
                                    date: moment().format('YYYY-MM-DD'),
                                    content: content
                                }).then(_ => {
                                    onSave()
                                    onClose()
                                })
                            }}>
                        Save
                    </Button>
                    <Button color="primary"
                            variant="outlined"
                            onClick={onClose}>
                        Close
                    </Button>
                </DialogActions>
            </DialogContent>
        </Dialog>)
}