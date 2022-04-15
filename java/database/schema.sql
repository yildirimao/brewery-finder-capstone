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
	brewery_img varchar(10000) NOT NULL,
	active boolean NOT NULL,
	CONSTRAINT PK_brewery PRIMARY KEY (brewery_id)
);


INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active, brewery_img)
VALUES ('MadTree', 'Cincinnati, OH', '513-836-8733', 'Thursday: 11AM–11PM; Friday: 11AM–12AM; Saturday: 10AM–12AM; Sunday: 10AM–11PM;
Monday: 11AM–11PM; Tuesday: 11AM–11PM; Wednesday: 11AM–11PM', '3301 Madison Road Cincinnati, OH 45209',
'MadTree puts purpose in every pour. Founded in 2013, MadTree has always been driven to craft great beer - but more importantly - to build something bigger than themselves and the high-quality beer they produce. 
Since the beginning, MadTree has cared deeply about creating meaningful connections with their communities. They embrace their namesake and work to celebrate and protect nature while reducing their impact on the environment. 
They are proud members of 1% for the Planet, with a commitment to donate 1% of sales to non-profits focused on environmental sustainability. The craftspeople at MadTree wake up every day to connect people to nature and each other.
MadTree. Inspiring Madness. Rooted in Purpose', 
true, 'https://cincinnatiusa.com/sites/default/files/styles/Array/public/Venues/MadTree-00.jpg');

INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active, brewery_img)
VALUES ('Great Lakes', 'Cleveland, OH', '216-771-4404', 'Friday: 12–11PM; Saturday: 11:30AM–11PM; Sunday: Closed; 
Monday: 12–10PM; Tuesday: 12–10PM; Wednesday: 12–10PM; Thursday: 12–10PM', '2516 Market Ave, Cleveland, OH 44113', 
'From the beginning, we have aspired to craft our beloved and award-winning beers in a socially and environmentally responsible way. As we continue to grow and expand, we will do so with care and respect for our products, employees, customers, and planet. 
Our employees are our most valued asset, so we have brewed a careful selection process to hire only the best ambassadors for our company.
We seek driven, enthusiastic people who share a dedication to our core values: passion for product, respect for resources, the fostering of relationships, and the sharing of success. 
We continuously strive to grow our innovative and resourceful team of individuals with high standards, integrity, and vision—and who can also appreciate sharing a little camaraderie or a pint with their co-workers. ', 
true, 'https://d1ynl4hb5mx7r8.cloudfront.net/wp-content/uploads/2020/02/17140001/great-lakes-1024x633.jpg');

INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active, brewery_img)
VALUES ('50 West', 'Cincinnati, OH', '513-834-8789', 'Friday: 11AM–11PM; Saturday: 11AM–11PM; Sunday: 11AM–9PM; Monday: 11AM–10PM; 
Tuesday: 11AM–10PM; Wednesday: 11AM–10PM; Thursday: 11AM–10PM', '1010 Street Address, City, State 01010', 
'Located in a former roadside speakeasy on US Route 50 heading west into the city of Cincinnati, Fifty West Brewing Company first opened its doors in November of 2012. 
Stretching across the country, U.S.Route 50 passes through 12 states from Ocean City, Maryland to Sacramento, California. It’s our pleasure at the Fifty West to serve you tastes of Americana from this fabled road trip. 
We thrive to provide each customer an experience as fond and memorable as a long haul across the country with your co-pilot riding shotgun. 
At Fifty West, every beer is a journey. Join us for the ride.', 
true, 'https://media1.citybeat.com/citybeat/imager/u/original/12086253/copy_of_20180412_4e9a2481.5c9e70e104fc3.png');

INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active, brewery_img)
VALUES ('Fretboard', 'Cincinnati, OH', '555-555-5555', 'Thursday: 11AM–11PM, Friday: 11AM–12AM, Saturday: 10AM–12AM, Sunday: 10AM–11PM,
Monday: 11AM–11PM, Tuesday: 11AM–11PM, Wednesday: 11AM–11PM', '1010 Street Address, City, State 01010', 'They make beers', true, 'https://www.gannett-cdn.com/presto/2021/11/03/PCIN/49bf6db3-ff37-4b74-b615-fab35b87d110-Fretboard.jpg');

INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active, brewery_img)
VALUES ('High Grain', 'Cincinnati, OH', '555-555-5555', 'Thursday: 11AM–11PM, Friday: 11AM–12AM, Saturday: 10AM–12AM, Sunday: 10AM–11PM,
Monday: 11AM–11PM, Tuesday: 11AM–11PM, Wednesday: 11AM–11PM', '1010 Street Address, City, State 01010', 'They make beers', true, 'https://media.bizj.us/view/img/11339109/highgrain29*1200xx1800-1013-0-94.jpg');

INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active, brewery_img)
VALUES ('Nine Giant', 'Cincinnati, OH', '555-555-5555', 'Thursday: 11AM–11PM, Friday: 11AM–12AM, Saturday: 10AM–12AM, Sunday: 10AM–11PM,
Monday: 11AM–11PM, Tuesday: 11AM–11PM, Wednesday: 11AM–11PM', '1010 Street Address, City, State 01010', 
'They make beers', true, 'https://www.gannett-cdn.com/media/2016/06/23/Cincinnati/Cincinnati/636022930752296332-062316-NINE-GIANT-335.jpg?width=640');

INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active, brewery_img)
VALUES ('Rhinegeist', 'Cincinnati, OH', '555-555-5555', 'Thursday: 11AM–11PM, Friday: 11AM–12AM, Saturday: 10AM–12AM, Sunday: 10AM–11PM,
Monday: 11AM–11PM, Tuesday: 11AM–11PM, Wednesday: 11AM–11PM', '1010 Street Address, City, State 01010', 'They make beers', true, 'https://media-exp1.licdn.com/dms/image/C4E1BAQGCkrtCNsSMMg/company-background_10000/0/1578514862862?e=2147483647&v=beta&t=Tbeps4MHeNRqWXULVPPqvyG_fYdFIBf3bT3_twwQgXg');

INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active, brewery_img)
VALUES ('Braxton', 'Covington, Ky', '555-555-5555', 'Thursday: 11AM–11PM, Friday: 11AM–12AM, Saturday: 10AM–12AM, Sunday: 10AM–11PM,
Monday: 11AM–11PM, Tuesday: 11AM–11PM, Wednesday: 11AM–11PM', '1010 Street Address, City, State 01010', 'They make beers', true, 'https://www.americanway.com/public/uploads/Cincinnati-Braxton-Brewing-Co-courtesy.jpg');

INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active, brewery_img)
VALUES ('Fake Brewery 1', 'City, State', '555-555-5555', 'Thursday: 11AM–11PM, Friday: 11AM–12AM, Saturday: 10AM–12AM, Sunday: 10AM–11PM,
Monday: 11AM–11PM, Tuesday: 11AM–11PM, Wednesday: 11AM–11PM', '1010 Street Address, City, State 01010', 'They make beers', false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Chandler-San_Tan_Brewery-2007.jpg/1200px-Chandler-San_Tan_Brewery-2007.jpg');

INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active, brewery_img)
VALUES ('Fake Brewery 2', 'City, State', '555-555-5555', 'Thursday: 11AM–11PM, Friday: 11AM–12AM, Saturday: 10AM–12AM, Sunday: 10AM–11PM,
Monday: 11AM–11PM, Tuesday: 11AM–11PM, Wednesday: 11AM–11PM', '1010 Street Address, City, State 01010', 'They make beers', false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Chandler-San_Tan_Brewery-2007.jpg/1200px-Chandler-San_Tan_Brewery-2007.jpg');


INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active, brewery_img)
VALUES ('Fake Brewery 3', 'City, State', '555-555-5555', 'Thursday: 11AM–11PM, Friday: 11AM–12AM, Saturday: 10AM–12AM, Sunday: 10AM–11PM,
Monday: 11AM–11PM, Tuesday: 11AM–11PM, Wednesday: 11AM–11PM', '1010 Street Address, City, State 01010', 'They make beers', false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Chandler-San_Tan_Brewery-2007.jpg/1200px-Chandler-San_Tan_Brewery-2007.jpg');

INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active, brewery_img)
VALUES ('Fake Brewery 4', 'City, State', '555-555-5555', 'Thursday: 11AM–11PM, Friday: 11AM–12AM, Saturday: 10AM–12AM, Sunday: 10AM–11PM,
Monday: 11AM–11PM, Tuesday: 11AM–11PM, Wednesday: 11AM–11PM', '1010 Street Address, City, State 01010', 'They make beers', false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Chandler-San_Tan_Brewery-2007.jpg/1200px-Chandler-San_Tan_Brewery-2007.jpg');

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


INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('Madtree beer 1', 4.6, 'sour', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'MadTree'), 10, 'Perle', 'A sour beer from Madtree', true, 'http://www.piedmont.org/media/BlogImages/iStock_000049664402_470x260.jpg');

INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('Madtree beer 2', 4.6, 'sour', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'MadTree'), 10, 'test hops', 'A pilsner from Madtree', true, 'http://www.piedmont.org/media/BlogImages/iStock_000049664402_470x260.jpg');
	
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('Madtree beer 3', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'MadTree'), 10, 'test hops', 'A placeholder beer from Madtree', false, 'http://www.piedmont.org/media/BlogImages/iStock_000049664402_470x260.jpg');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('Madtree beer 4', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'MadTree'), 10, 'test hops', 'A placeholder beer from Madtree', false, 'http://www.piedmont.org/media/BlogImages/iStock_000049664402_470x260.jpg');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('Great lakes beer 1', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Great Lakes'), 10, 'test hops', 'A placeholder beer from Great lakes', false, 'http://www.piedmont.org/media/BlogImages/iStock_000049664402_470x260.jpg');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('Great lakes beer 2', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Great Lakes'), 10, 'test hops', 'A placeholder beer from Great lakes', true, 'http://www.piedmont.org/media/BlogImages/iStock_000049664402_470x260.jpg');
	 
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('Great lakes beer 3', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Great Lakes'), 10, 'test hops', 'A placeholder beer from Great lakes', true, 'http://www.piedmont.org/media/BlogImages/iStock_000049664402_470x260.jpg');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('Great lakes beer 4', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Great Lakes'), 10, 'test hops', 'A placeholder beer from Great lakes', true, 'http://www.piedmont.org/media/BlogImages/iStock_000049664402_470x260.jpg');

INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('50 west beer 1', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = '50 West'), 10, 'test hops', 'A placeholder beer from 50 west', false, 'http://www.piedmont.org/media/BlogImages/iStock_000049664402_470x260.jpg');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('50 west beer 2', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = '50 West'), 10, 'test hops', 'A placeholder beer from 50 west', true, 'http://www.piedmont.org/media/BlogImages/iStock_000049664402_470x260.jpg');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('50 west beer 3', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = '50 West'), 10, 'test hops', 'A placeholder beer from 50 west', false, 'http://www.piedmont.org/media/BlogImages/iStock_000049664402_470x260.jpg');	 
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('50 west beer 4', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = '50 West'), 10, 'test hops', 'A placeholder beer from 50 west', false, 'http://www.piedmont.org/media/BlogImages/iStock_000049664402_470x260.jpg');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('Fretboard beer 1', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Fretboard'), 10, 'test hops', 'A placeholder beer from Fretboard', false, 'http://www.piedmont.org/media/BlogImages/iStock_000049664402_470x260.jpg');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('Fretboard beer 2', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Fretboard'), 10, 'test hops', 'A placeholder beer from Fretboard', true, 'http://www.piedmont.org/media/BlogImages/iStock_000049664402_470x260.jpg');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('Fretboard beer 3', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Fretboard'), 10, 'test hops', 'A placeholder beer from Fretboard', true, 'http://www.piedmont.org/media/BlogImages/iStock_000049664402_470x260.jpg');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('Fretboard beer 4', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Fretboard'), 10, 'test hops', 'A placeholder beer from Fretboard', true, 'http://www.piedmont.org/media/BlogImages/iStock_000049664402_470x260.jpg');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('High Grain beer 1', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'High Grain'), 10, 'test hops', 'A placeholder beer from High Grain', true, 'http://www.piedmont.org/media/BlogImages/iStock_000049664402_470x260.jpg');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('High Grain beer 2', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'High Grain'), 10, 'test hops', 'A placeholder beer from High Grain', true, 'http://www.piedmont.org/media/BlogImages/iStock_000049664402_470x260.jpg');

INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('High Grain beer 3', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'High Grain'), 10, 'test hops', 'A placeholder beer from High Grain', true, 'http://www.piedmont.org/media/BlogImages/iStock_000049664402_470x260.jpg');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('High Grain beer 4', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'High Grain'), 10, 'test hops', 'A placeholder beer from High Grain', true, 'http://www.piedmont.org/media/BlogImages/iStock_000049664402_470x260.jpg');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('Nine Giant beer 1', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Nine Giant'), 10, 'test hops', 'A placeholder beer from Nine Giant', true, 'http://www.piedmont.org/media/BlogImages/iStock_000049664402_470x260.jpg');	
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('Nine Giant beer 2', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Nine Giant'), 10, 'test hops', 'A placeholder beer from Nine Giant', true, 'http://www.piedmont.org/media/BlogImages/iStock_000049664402_470x260.jpg');		

INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('Nine Giant beer 3', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Nine Giant'), 10, 'test hops', 'A placeholder beer from Nine Giant', false, 'http://www.piedmont.org/media/BlogImages/iStock_000049664402_470x260.jpg');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('Nine Giant beer 4', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Nine Giant'), 10, 'test hops', 'A placeholder beer from Nine Giant', true, 'http://www.piedmont.org/media/BlogImages/iStock_000049664402_470x260.jpg');		
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('Rhinegeist beer 1', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Rhinegeist'), 10, 'test hops', 'A placeholder beer from Rhinegeist', false, 'http://www.piedmont.org/media/BlogImages/iStock_000049664402_470x260.jpg');	
	  
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('Rhinegeist beer 2', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Rhinegeist'), 10, 'test hops', 'A placeholder beer from Rhinegeist', false, 'http://www.piedmont.org/media/BlogImages/iStock_000049664402_470x260.jpg');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('Rhinegeist beer 3', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Rhinegeist'), 10, 'test hops', 'A placeholder beer from Rhinegeist', false, 'http://www.piedmont.org/media/BlogImages/iStock_000049664402_470x260.jpg');	
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('Rhinegeist beer 4', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Rhinegeist'), 10, 'test hops', 'A placeholder beer from Rhinegeist', true, 'http://www.piedmont.org/media/BlogImages/iStock_000049664402_470x260.jpg');	
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('Braxton beer 1', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Braxton'), 10, 'test hops', 'A placeholder beer from Braxton', false, 'http://www.piedmont.org/media/BlogImages/iStock_000049664402_470x260.jpg');	
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('Braxton beer 2', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Braxton'), 10, 'test hops', 'A placeholder beer from Braxton', false, 'http://www.piedmont.org/media/BlogImages/iStock_000049664402_470x260.jpg');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('Braxton beer 3', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Braxton'), 10, 'test hops', 'A placeholder beer from Braxton', true,'http://www.piedmont.org/media/BlogImages/iStock_000049664402_470x260.jpg');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('Braxton beer 4', 5.5, 'Blonde Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Braxton'), 10, 'test hops', 'A placeholder beer from Braxton', true, 'http://www.piedmont.org/media/BlogImages/iStock_000049664402_470x260.jpg');
	   
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
