import React from 'react';

export default ({newTodoInputRef, newTodoInputOnClickHandler, buttonText}) => {
    return (<div className="input-group mb-3">
        <textarea className="form-control" ref={newTodoInputRef}/>
        <div className="input-group-append">
            <span className="input-group-text" onClick={newTodoInputOnClickHandler}> {buttonText}</span>
        </div>
    </div>)
}