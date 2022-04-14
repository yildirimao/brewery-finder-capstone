BEGIN TRANSACTION;

DROP TABLE IF EXISTS reviews;
DROP SEQUENCE IF EXISTS seq_review_id;
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


INSERT INTO users (username,password_hash, zipcode, email, role) 
VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', '55555', 'example@email.com','ROLE_USER');

INSERT INTO users (username,password_hash, zipcode, email, role) 
VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', '55555', 'example@email.com','ROLE_ADMIN');

INSERT INTO users (username, password_hash, zipcode, email, role) 
VALUES ('Zach','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 
		'45236', 'zach@email.com', 'ROLE_BREWER');
		
insert into users(username, password_hash, role)
values ('brewer', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'ROLE_BREWER');

CREATE SEQUENCE seq_brewery_id
 INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
CREATE TABLE breweries (
	brewery_id int DEFAULT nextval('seq_brewery_id'::regclass) NOT NULL,
	brewery_name varchar(50) UNIQUE NOT NULL,
	brewery_location varchar(60) NOT NULL,
	phone_number varchar(20) NOT NULL,
	hours_of_operation varchar(300) NOT NULL,
	address varchar(300) NOT NULL,
	bio varchar(50000) NOT NULL,
	brewery_img varchar(300),
	active boolean NOT NULL,
	CONSTRAINT PK_brewery PRIMARY KEY (brewery_id)
);


INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active)
VALUES ('Madtree Brewing', 'Cincinnati, OH', '513-836-8733', 'Thursday: 11AM–11PM, Friday: 11AM–12AM, Saturday: 10AM–12AM, Sunday: 10AM–11PM,
Monday: 11AM–11PM, Tuesday: 11AM–11PM, Wednesday: 11AM–11PM', '3301 Madison Road Cincinnati, OH 45209', 'Madtree is a cool brewery in Cincinnati.', true);

INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active)
VALUES ('Great Lakes Brewering Company', 'Cleveland, OH', '216-771-4404', 'Thursday: 11AM–11PM, Friday: 11AM–12AM, Saturday: 10AM–12AM, Sunday: 10AM–11PM,
Monday: 11AM–11PM, Tuesday: 11AM–11PM, Wednesday: 11AM–11PM', '2516 Market Ave, Cleveland, OH 44113', 'Great lakes is a cool Brewery', true);

INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active)
VALUES ('50 West Brewery', 'Cincinnati, OH', '555-555-5555', 'Thursday: 11AM–11PM, Friday: 11AM–12AM, Saturday: 10AM–12AM, Sunday: 10AM–11PM,
Monday: 11AM–11PM, Tuesday: 11AM–11PM, Wednesday: 11AM–11PM', '1010 Street Address, City, State 01010', 'They make beers', true);

INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active)
VALUES ('Fretboard', 'Cincinnati, OH', '555-555-5555', 'Thursday: 11AM–11PM, Friday: 11AM–12AM, Saturday: 10AM–12AM, Sunday: 10AM–11PM,
Monday: 11AM–11PM, Tuesday: 11AM–11PM, Wednesday: 11AM–11PM', '1010 Street Address, City, State 01010', 'They make beers', true);

INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active)
VALUES ('High Grain Brewery', 'Cincinnati, OH', '555-555-5555', 'Thursday: 11AM–11PM, Friday: 11AM–12AM, Saturday: 10AM–12AM, Sunday: 10AM–11PM,
Monday: 11AM–11PM, Tuesday: 11AM–11PM, Wednesday: 11AM–11PM', '1010 Street Address, City, State 01010', 'They make beers', true);

INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active)
VALUES ('Nine Giant Brewery', 'Cincinnati, OH', '555-555-5555', 'Thursday: 11AM–11PM, Friday: 11AM–12AM, Saturday: 10AM–12AM, Sunday: 10AM–11PM,
Monday: 11AM–11PM, Tuesday: 11AM–11PM, Wednesday: 11AM–11PM', '1010 Street Address, City, State 01010', 'They make beers', true);

INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active)
VALUES ('Rhinegeist', 'Cincinnati, OH', '555-555-5555', 'Thursday: 11AM–11PM, Friday: 11AM–12AM, Saturday: 10AM–12AM, Sunday: 10AM–11PM,
Monday: 11AM–11PM, Tuesday: 11AM–11PM, Wednesday: 11AM–11PM', '1010 Street Address, City, State 01010', 'They make beers', true);

INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active)
VALUES ('Braxton', 'Covington, Ky', '555-555-5555', 'Thursday: 11AM–11PM, Friday: 11AM–12AM, Saturday: 10AM–12AM, Sunday: 10AM–11PM,
Monday: 11AM–11PM, Tuesday: 11AM–11PM, Wednesday: 11AM–11PM', '1010 Street Address, City, State 01010', 'They make beers', true);

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
	   
VALUES ((SELECT user_id
		FROM users 
		WHERE username= 'brewer'),
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name ='Great Lakes Brewery'));

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
	ibu int NOT NULL,
	hops varchar(100) NOT NULL,
	description varchar(50000) NOT NULL,
	beer_img varchar(300),
	malts varchar(100),
	available boolean,
	brewery_id int CONSTRAINT fk_breweries REFERENCES breweries(brewery_id),
	CONSTRAINT PK_beer PRIMARY KEY (beer_id)
);


INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description)
VALUES ('Madtree beer 1', 4.6, 'sour', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Madtree Brewing'), 10, 'Perle', 'A sour beer from Madtree');

INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description)
VALUES ('Madtree beer 2', 6.0, 'pilsner', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Madtree Brewing'), 10, 'test hops', 'A pilsner from Madtree');
	
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description)
VALUES ('Madtree beer 3', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Madtree Brewing'), 10, 'test hops', 'A placeholder beer from Madtree');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description)
VALUES ('Madtree beer 4', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Madtree Brewing'), 10, 'test hops', 'A placeholder beer from Madtree');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description)
VALUES ('Great lakes beer 1', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Great Lakes Brewering Company'), 10, 'test hops', 'A placeholder beer from Great lakes');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description)
VALUES ('Great lakes beer 2', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Great Lakes Brewering Company'), 10, 'test hops', 'A placeholder beer from Great lakes');
	 
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description)
VALUES ('Great lakes beer 3', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Great Lakes Brewering Company'), 10, 'test hops', 'A placeholder beer from Great lakes');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description)
VALUES ('Great lakes beer 4', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Great Lakes Brewering Company'), 10, 'test hops', 'A placeholder beer from Great lakes');

INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description)
VALUES ('50 west beer 1', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = '50 West Brewery'), 10, 'test hops', 'A placeholder beer from 50 west');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description)
VALUES ('50 west beer 2', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = '50 West Brewery'), 10, 'test hops', 'A placeholder beer from 50 west');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description)
VALUES ('50 west beer 3', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = '50 West Brewery'), 10, 'test hops', 'A placeholder beer from 50 west');	 
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description)
VALUES ('50 west beer 4', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = '50 West Brewery'), 10, 'test hops', 'A placeholder beer from 50 west');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description)
VALUES ('Fretboard beer 1', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Fretboard Brewery'), 10, 'test hops', 'A placeholder beer from Fretboard');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description)
VALUES ('Fretboard beer 2', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Fretboard Brewery'), 10, 'test hops', 'A placeholder beer from Fretboard');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description)
VALUES ('Fretboard beer 3', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Fretboard Brewery'), 10, 'test hops', 'A placeholder beer from Fretboard');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description)
VALUES ('Fretboard beer 4', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Fretboard Brewery'), 10, 'test hops', 'A placeholder beer from Fretboard');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description)
VALUES ('High Grain beer 1', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'High Grain Brewery'), 10, 'test hops', 'A placeholder beer from High Grain');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description)
VALUES ('High Grain beer 2', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'High Grain Brewery'), 10, 'test hops', 'A placeholder beer from High Grain');

INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description)
VALUES ('High Grain beer 3', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'High Grain Brewery'), 10, 'test hops', 'A placeholder beer from High Grain');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description)
VALUES ('High Grain beer 4', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'High Grain Brewery'), 10, 'test hops', 'A placeholder beer from High Grain');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description)	   
VALUES ('Nine Giant beer 1', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Nine Giant Brewery'), 10, 'test hops', 'A placeholder beer from Nine Giant');	
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description)	   
VALUES ('Nine Giant beer 2', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Nine Giant Brewery'), 10, 'test hops', 'A placeholder beer from Nine Giant');		

INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description)	   
VALUES ('Nine Giant beer 3', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Nine Giant Brewery'), 10, 'test hops', 'A placeholder beer from Nine Giant');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description)	   
VALUES ('Nine Giant beer 4', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Nine Giant Brewery'), 10, 'test hops', 'A placeholder beer from Nine Giant');		
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description)	   
VALUES ('Rhinegeist beer 1', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Rhinegeist Brewery'), 10, 'test hops', 'A placeholder beer from Rhinegeist');	
	  
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description)	   
VALUES ('Rhinegeist beer 2', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Rhinegeist Brewery'), 10, 'test hops', 'A placeholder beer from Rhinegeist');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description)	   
VALUES ('Rhinegeist beer 3', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Rhinegeist Brewery'), 10, 'test hops', 'A placeholder beer from Rhinegeist');	
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description)	   
VALUES ('Rhinegeist beer 4', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Rhinegeist Brewery'), 10, 'test hops', 'A placeholder beer from Rhinegeist');	
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description)	   
VALUES ('Braxton beer 1', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Braxton'), 10, 'test hops', 'A placeholder beer from Braxton');	
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description)	   
VALUES ('Braxton beer 2', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Braxton'), 10, 'test hops', 'A placeholder beer from Braxton');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description)	   
VALUES ('Braxton beer 3', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Braxton'), 10, 'test hops', 'A placeholder beer from Braxton');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description)	   
VALUES ('Braxton beer 4', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Braxton'), 10, 'test hops', 'A placeholder beer from Braxton');
	   
CREATE SEQUENCE seq_review_id
 INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
CREATE TABLE reviews(
	review_id int DEFAULT nextval('seq_review_id'::regclass) NOT NULL,
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
