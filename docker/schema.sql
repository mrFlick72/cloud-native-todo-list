CREATE TABLE TODO (
    id VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    date timestamp,
    content VARCHAR (255) DEFAULT "",

    PRIMARY KEY (id)
);