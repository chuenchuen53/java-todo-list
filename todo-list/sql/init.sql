USE todo;

CREATE TABLE users
(
    id       INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE todos
(
    id           INT AUTO_INCREMENT PRIMARY KEY,
    user_id      INT          NOT NULL,
    description  VARCHAR(255) NOT NULL DEFAULT '',
    completed TINYINT      NOT NULL DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES users (id)
);