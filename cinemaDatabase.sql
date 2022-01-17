CREATE DATABASE cinema CHARACTER SET utf8mb4;

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

CREATE TABLE cinema.CinemaComplex (
    id INT(255) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(60) NOT NULL,
    address VARCHAR(255) NOT NULL,
    city_code INT(5)
);

CREATE TABLE cinema.Administrator (
    id INT(255) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    firstname VARCHAR(60) NOT NULL,
    lastname VARCHAR(60) NOT NULL,
    cinema_complex_id INT(255) NOT NULL,
    FOREIGN KEY(cinema_complex_id) REFERENCES CinemaComplex(id)
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
    id INT(255) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    seat_number INT(20) NOT NULL,
    cinema_complex_id INT(255) NOT NULL,
    FOREIGN KEY (cinema_complex_id) REFERENCES CinemaComplex(id)
);

CREATE TABLE cinema.MovieDirector (
    id INT(255) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    lastname VARCHAR(60) NOT NULL,
    firstname VARCHAR(60) NOT NULL
);

CREATE TABLE cinema.Movie (
    id INT(255) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title VARCHAR(60) NOT NULL,
    year INT(4) NOT NULL,
    movie_director_id INT(255) NOT NULL,
    FOREIGN KEY (movie_director_id) REFERENCES MovieDirector(id)
);

CREATE TABLE cinema.Session (
    id INT(255) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    date DATETIME NOT NULL,
    room_id INT(255) NOT NULL,
    movie_id INT(255) NOT NULL,
    FOREIGN KEY (room_id) REFERENCES Room(id),
    FOREIGN KEY (movie_id)REFERENCES Movie(id)
);

CREATE TABLE cinema.Ticket (
    id INT(255) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    user_id INT(255) NOT NULL,
    session_id INT(255) NOT NULL,
    rate_id INT(255) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (session_id) REFERENCES Session(id),
    FOREIGN KEY (rate_id) REFERENCES Rate(id)
);

CREATE TABLE cinema.CrudRate (
    administrator_id INT(255) NOT NULL,
    rate_id INT(255) NOT NULL,
    PRIMARY KEY (administrator_id, rate_id),
    FOREIGN KEY (administrator_id) REFERENCES Administrator(id),
    FOREIGN KEY (rate_id) REFERENCES Rate(id)
);

CREATE TABLE cinema.CrudSession (
    administrator_id INT(255) NOT NULL,
    session_id INT(255) NOT NULL,
    PRIMARY KEY (administrator_id, session_id),
    FOREIGN KEY (administrator_id) REFERENCES Administrator(id),
    FOREIGN KEY (session_id) REFERENCES Session(id)
);