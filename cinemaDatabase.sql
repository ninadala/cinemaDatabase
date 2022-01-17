CREATE DATABASE IF NOT EXISTS cinema CHARACTER SET utf8mb4;

CREATE TABLE cinema.Users (
    id INT(255) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    firstname VARCHAR(60) NOT NULL,
    lastname VARCHAR(60) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE cinema.PaiementMode (
    id INT(255) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title VARCHAR(60) NOT NULL,
    description TEXT(255)
);

CREATE TABLE cinema.Pay (
    user_id INT(255) NOT NULL,
    paiement_mode_id INT(255) NOT NULL,
    PRIMARY KEY(user_id, paiement_mode_id),
    FOREIGN KEY(user_id) REFERENCES Users(id),
    FOREIGN KEY(paiement_mode_id) REFERENCES PaiementMode(id)
);

CREATE TABLE cinema.Role (
    id INT(255) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title VARCHAR(60) NOT NULL,
    description TEXT(500)
);

CREATE TABLE cinema.Cinema (
    id INT(255) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(60) NOT NULL,
    address VARCHAR(255) NOT NULL,
    city_code INT(5)
);

CREATE TABLE cinema.Administrator (
    id INT(255) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    firstname VARCHAR(60) NOT NULL,
    lastname VARCHAR(60) NOT NULL,
    cinema_id INT(255) NOT NULL,
    FOREIGN KEY(cinema_id) REFERENCES Cinema(id)
);

CREATE TABLE cinema.Get (
    role_id INT(255) NOT NULL,
    administrator_id INT(255) NOT NULL,
    PRIMARY KEY(role_id, administrator_id),
    FOREIGN KEY(role_id) REFERENCES Role(id),
    FOREIGN KEY(administrator_id) REFERENCES Administrator(id)
);

CREATE TABLE cinema.Rate (
    id INT(255) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title VARCHAR(60) NOT NULL,
    description TEXT(500) NOT NULL
);

CREATE TABLE cinema.Room (
    
);