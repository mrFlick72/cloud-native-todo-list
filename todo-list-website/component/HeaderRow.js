import React from 'react';
import Header from "./Header";

export default ({title}) => {
    return (
        <div className="row">
            <div className="col-12">
                <Header title={title} />
            </div>
        </div>)
}