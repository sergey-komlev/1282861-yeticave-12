CREATE DATABASE YetiCave
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE YetiCave;

CREATE TABLE user (
    id INT AUTO_INCREMENT,
    email VARCHAR(128) NOT NULL UNIQUE,
    password CHAR(64) NOT NULL
);

CREATE TABLE category (
    id INT PRIMARY KEY,
    name VARCHAR(128) UNIQUE NOT NULL,
    symbol_code VARCHAR(128) UNIQUE NOT NULL
);

CREATE TABLE lot (
    id INT PRIMARY KEY,
    date_of_create DATETIME(6) NOT NULL,
    title VARCHAR(128) NOT NULL,
    description TEXT,
    img VARCHAR(128),
    start_price INT NOT NULL,
    expiration_date DATE NOT NULL,
    bet_step INT NOT NULL,
    category_id INT NOT NULL,
    winner_id INT,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (winner_id) REFERENCES user(id),
    FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE bet (
    id INT PRIMARY KEY,
    user_id INT NOT NULL,
    date DATETIME(6) NOT NULL,
    price INT NOT NULL,
    lot_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (lot_id) REFERENCES lot(id)
);