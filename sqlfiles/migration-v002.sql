USE ynov;
CREATE TABLE users (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	name VARCHAR(50),
	lastname VARCHAR(50),
	email VARCHAR(100)
);