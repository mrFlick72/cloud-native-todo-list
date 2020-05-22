CREATE TABLE TODO (
    id VARCHAR NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    date date,
    todo VARCHAR (255) DEFAULT "",

    PRIMARY KEY (id)
);