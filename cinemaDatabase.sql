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
    permission VARCHAR(30) NOT NULL,
    cinema_complex_id INT(255) NOT NULL,
    FOREIGN KEY(cinema_complex_id) REFERENCES CinemaComplex(id)
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

INSERT INTO cinema.Users (id, firstname, lastname, email, password) VALUES (1, 'Vernor', 'Da Costa', 'vdacosta0@tuttocitta.it', '$2y$10$CRDhDrzQwBUgbmLTxyOfcOiny1rvS45PD2nUlCJkLA6DglqHuYrG6');
INSERT INTO cinema.Users (id, firstname, lastname, email, password) VALUES (2, 'Clo', 'Dumingo', 'cdumingo1@businesswire.com', '$2y$10$lgB/g7fYVa2qITi9lMhaxube5Wo3xNHKYo5ouRvseGZIz6Csb3Iq2');
INSERT INTO cinema.Users (id, firstname, lastname, email, password) VALUES (3, 'Addy', 'Grabban', 'agrabban2@delicious.com', '$2y$10$QtDIoMesWWrfiVbASbhLyOgyvx.FZjWK4bUZfUlKhhhD0In2VMVl6');
INSERT INTO cinema.Users (id, firstname, lastname, email, password) VALUES (4, 'Tanney', 'Vassall', 'tvassall3@liveinternet.ru', '$2y$10$dXBJRYIDDbL6.dJFchzx2OgfPPMcKRpf7B4bfM0BYxorfEIgYLJXW');
INSERT INTO cinema.Users (id, firstname, lastname, email, password) VALUES (5, 'Cad', 'Dunsford', 'cdunsford4@bluehost.com', '$2y$10$JunKg88EeCcWzMqJsKHf/uHP49EVxl90Dbry5F5Gd0fJiYe1233cK');
INSERT INTO cinema.Users (id, firstname, lastname, email, password) VALUES (6, 'Cherry', 'Gilbertson', 'cgilbertson5@ihg.com', '$2y$10$q.gfCfY5Dj63Es/0G14K6uDvzdn5tiOHZcB.Wtg5RPmSNPudxKvmW');
INSERT INTO cinema.Users (id, firstname, lastname, email, password) VALUES (7, 'Silvio', 'Brothers', 'sbrothers6@nbcnews.com', '$2y$10$iu4pIdQEJq0X/6j9sNZjfOc/Yi2LpBrU5o6KRkbpHDxERDCh3JI5.');
INSERT INTO cinema.Users (id, firstname, lastname, email, password) VALUES (8, 'Willette', 'Glasscoe', 'wglasscoe7@hibu.com', '$2y$10$OH6689RlNFszD/tyxOJR0.9FDspWC3xb4xZDYeYEH/LZXfxN6kuee');
INSERT INTO cinema.Users (id, firstname, lastname, email, password) VALUES (9, 'Imojean', 'Ashe', 'iashe8@barnesandnoble.com', '$2y$10$tX7z4h3geh8EesYjflAX1OZobukDwyQ0QIXf0aBh2JLb0AwNVKc92');
INSERT INTO cinema.Users (id, firstname, lastname, email, password) VALUES (10, 'Hertha', 'Tillot', 'htillot9@seesaa.net', '$2y$10$MGKo2gSC2ioZThnP9kbRZO9.J4XquKLGtqeG7pgx47oR11cXocygq');

INSERT INTO cinema.PaiementMode (id, title, description) VALUES (1, 'CB', 'paiement en carte bancaire');
INSERT INTO cinema.PaiementMode (id, title, description) VALUES (2, 'Espèces', 'paiement en espèces');
INSERT INTO cinema.PaiementMode (id, title, description) VALUES (3, 'Chèque', 'paiement en chèque bancaire');

INSERT INTO cinema.Pay (user_id, paiement_mode_id) VALUES (1, 1);
INSERT INTO cinema.Pay (user_id, paiement_mode_id) VALUES (3, 1);
INSERT INTO cinema.Pay (user_id, paiement_mode_id) VALUES (4, 1);
INSERT INTO cinema.Pay (user_id, paiement_mode_id) VALUES (5, 2);
INSERT INTO cinema.Pay (user_id, paiement_mode_id) VALUES (6, 1);
INSERT INTO cinema.Pay (user_id, paiement_mode_id) VALUES (7, 1);
INSERT INTO cinema.Pay (user_id, paiement_mode_id) VALUES (8, 1);
INSERT INTO cinema.Pay (user_id, paiement_mode_id) VALUES (10, 2);
