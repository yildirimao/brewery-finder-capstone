BEGIN TRANSACTION;

DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS beers;
DROP SEQUENCE IF EXISTS seq_beer_id;
DROP TABLE IF EXISTS brewers;
DROP TABLE IF EXISTS breweries;
DROP SEQUENCE IF EXISTS seq_brewery_id;
DROP TABLE IF EXISTS users;
DROP SEQUENCE IF EXISTS seq_user_id;

CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;


CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) UNIQUE NOT NULL,
	password_hash varchar(200) NOT NULL,
	zipcode varchar(10),
	email varchar(100),
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username, password_hash, zipcode, email, role) 
VALUES ('Zach','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 
		45236, 'zach@email.com', 'ROLE_USER');

CREATE SEQUENCE seq_brewery_id
 INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
CREATE TABLE breweries (
	brewery_id int DEFAULT nextval('seq_brewery_id'::regclass) NOT NULL,
	brewery_name varchar(50) UNIQUE NOT NULL,
	brewery_location varchar(60) NOT NULL,
	CONSTRAINT PK_brewery PRIMARY KEY (brewery_id)
);

INSERT INTO breweries (brewery_name, brewery_location)
VALUES ('Madtree Brewery', 'Cincinnati, OH');

CREATE TABLE brewers (
	brewer_id int CONSTRAINT fk_users REFERENCES users(user_id),
	brewery_id int CONSTRAINT fk_breweries REFERENCES breweries(brewery_id)
);

INSERT INTO brewers (brewer_id, brewery_id)
VALUES ((SELECT user_id
		FROM users 
		WHERE username= 'Zach'),
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name ='Madtree Brewery'));

CREATE SEQUENCE seq_beer_id
 INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
CREATE TABLE beers(
	beer_id int DEFAULT nextval('seq_beer_id'::regclass) NOT NULL,
	beer_name varchar(50) UNIQUE NOT NULL,
	abv decimal NOT NULL,
	beer_type varchar(30) NOT NULL,
	brewery_id int CONSTRAINT fk_breweries REFERENCES breweries(brewery_id),
	CONSTRAINT PK_beer PRIMARY KEY (beer_id)
);

INSERT INTO beers(beer_name, abv, beer_type, brewery_id)
VALUES ('Shade', 4.6, 'sour', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Madtree Brewery'));

CREATE TABLE reviews(
	review varchar(10000) NOT NULL,
	rating int NOT NULL CHECK (rating >= 5),
	beer_id int CONSTRAINT fk_beers REFERENCES beers(beer_id),
	reviewer_id int CONSTRAINT fk_users REFERENCES users(user_id)
);

INSERT INTO reviews (review, rating, beer_id, reviewer_id)
VALUES ('That is one good beer!', 5, (
SELECT beer_id
FROM beers
WHERE beer_name = 'Shade'),(
SELECT user_id
FROM users
WHERE username = 'Zach'));

COMMIT TRANSACTION;
