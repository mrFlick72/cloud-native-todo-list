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
import TextField from "@material-ui/core/TextField";

export default function NewTodoItem({open, onClose, onSave}) {
    const [content, setContent] = useState("")

    return (
        <Dialog onClose={onClose} aria-labelledby="simple-dialog-title" open={open} maxWidth="lg">
            <DialogTitle id="simple-dialog-title">New Todo </DialogTitle>
            <DialogContent>
                <TextField id="todoArea"
                           variant="outlined"
                           placeholder="Put here your daily todo"
                           multiline
                           rows={4}
                           onChange={(value) => {
                               setContent(value.target.value)
                           }}
                />

                <Divider/>

                <DialogActions>
                    <Button color="primary"
                            variant="outlined"
                            onClick={() => {
                                insertTodoFor({
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