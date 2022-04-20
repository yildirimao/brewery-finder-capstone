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
		'45236', 'zach@email.com', 'ROLE_USER');
		
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
	hours_of_operation varchar(1000) NOT NULL,
	address varchar(300) NOT NULL,
	bio varchar(100000) NOT NULL,
	brewery_img varchar(10000) NOT NULL,
	active boolean NOT NULL,
	CONSTRAINT PK_brewery PRIMARY KEY (brewery_id)
);


INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active, brewery_img)
VALUES ('MadTree', 'Cincinnati, OH', '513-836-8733', 'Thursday: 11AM–11PM; Friday: 11AM–12AM; Saturday: 10AM–12AM; Sunday: 10AM–11PM; Monday: 11AM–11PM; Tuesday: 11AM–11PM; Wednesday: 11AM–11PM', '3301 Madison Road Cincinnati, OH 45209',
'MadTree puts purpose in every pour. Founded in 2013, MadTree has always been driven to craft great beer - but more importantly - to build something bigger than themselves and the high-quality beer they produce. Since the beginning, MadTree has cared deeply about creating meaningful connections with their communities. They embrace their namesake and work to celebrate and protect nature while reducing their impact on the environment. They are proud members of 1% for the Planet, with a commitment to donate 1% of sales to non-profits focused on environmental sustainability. The craftspeople at MadTree wake up every day to connect people to nature and each other. MadTree. Inspiring Madness. Rooted in Purpose', 
true, 'https://cincinnatiusa.com/sites/default/files/styles/Array/public/Venues/MadTree-00.jpg');

INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active, brewery_img)
VALUES ('Great Lakes', 'Cleveland, OH', '216-771-4404', 'Friday: 12–11PM; Saturday: 11:30AM–11PM; Sunday: Closed; Monday: 12–10PM; Tuesday: 12–10PM; Wednesday: 12–10PM; Thursday: 12–10PM', '2516 Market Ave, Cleveland, OH 44113', 
'From the beginning, we have aspired to craft our beloved and award-winning beers in a socially and environmentally responsible way. As we continue to grow and expand, we will do so with care and respect for our products, employees, customers, and planet. Our employees are our most valued asset, so we have brewed a careful selection process to hire only the best ambassadors for our company. We seek driven, enthusiastic people who share a dedication to our core values: passion for product, respect for resources, the fostering of relationships, and the sharing of success. We continuously strive to grow our innovative and resourceful team of individuals with high standards, integrity, and vision—and who can also appreciate sharing a little camaraderie or a pint with their co-workers. ', 
true, 'https://d1ynl4hb5mx7r8.cloudfront.net/wp-content/uploads/2020/02/17140001/great-lakes-1024x633.jpg');

INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active, brewery_img)
VALUES ('50 West', 'Cincinnati, OH', '513-834-8789', 'Friday: 11AM–11PM; Saturday: 11AM–11PM; Sunday: 11AM–9PM; Monday: 11AM–10PM; Tuesday: 11AM–10PM; Wednesday: 11AM–10PM; Thursday: 11AM–10PM', '7605 Wooster Pike, Cincinnati, OH 45227', 
'Located in a former roadside speakeasy on US Route 50 heading west into the city of Cincinnati, Fifty West Brewing Company first opened its doors in November of 2012. Stretching across the country, U.S.Route 50 passes through 12 states from Ocean City, Maryland to Sacramento, California. It’s our pleasure at the Fifty West to serve you tastes of Americana from this fabled road trip. We thrive to provide each customer an experience as fond and memorable as a long haul across the country with your co-pilot riding shotgun. At Fifty West, every beer is a journey. Join us for the ride.', 
true, 'https://media1.citybeat.com/citybeat/imager/u/original/12086253/copy_of_20180412_4e9a2481.5c9e70e104fc3.png');

INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active, brewery_img)
VALUES ('Fretboard', 'Cincinnati, OH', '513-914-4677', 'Friday: 12PM–12AM; Saturday: 12PM–12AM; Sunday: 12–8PM; Monday: 3–10PM; Tuesday: 3–10PM; Wednesday: 3–10PM; Thursday: 3–10PM', '5800 Creek Rd, Cincinnati, OH 45242', 
		'Fretboard Brewing Company is an award-winning brewery & live music venue in Blue Ash, OH. #brewsintune.', true, 'https://www.gannett-cdn.com/presto/2021/11/03/PCIN/49bf6db3-ff37-4b74-b615-fab35b87d110-Fretboard.jpg');

INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active, brewery_img)
VALUES ('High Grain', 'Cincinnati, OH', '513-791-7000', 'Monday: 3PM-10PM; Tuesday: 3PM-10PM; Wednesday: 3PM-10PM; Thursday: 3PM–10PM; Friday: 12PM–11PM; Saturday: 11AM–11PM; Sunday: 11PM–8PM', 
		'6860 Plainfield Road, Cincinnati, OH, 45236', 'We’re a brewery with a scratch kitchen making sustainable choices from the onset of each project. We love beer and believe beer is best with a good meal with locally sourced food. Our seasonally rotating menu includes vegan options and local foods from Cincy farms such as Gorman Heritage Farm and Perch Farms.', true, 'https://media.bizj.us/view/img/11339109/highgrain29*1200xx1800-1013-0-94.jpg');

INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active, brewery_img)
VALUES ('Nine Giant', 'Cincinnati, OH', '513-366-4550', 
'Monday: CLOSED; Tuesday: 11:30AM–10PM; Wednesday: 11:30AM–10PM; Thursday: 11:30PM–10PM; Friday: 11:30PM–10PM; Saturday: 11:30AM–11PM; Sunday: 11:30PM–9PM', '6095 Montgomery Rd, Cincinnati, OH 45213', 
'Our crack team of beer wizards crafts award-winning small batch beers to delight any tummy. Our beers change frequently so there’s always something new and delicious to indulge in.', true, 'https://www.gannett-cdn.com/media/2016/06/23/Cincinnati/Cincinnati/636022930752296332-062316-NINE-GIANT-335.jpg?width=640');

INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active, brewery_img)
VALUES ('Rhinegeist', 'Cincinnati, OH', '513-381-1367', 
'Monday: 3PM-10PM; Tuesday: 3PM-10PM; Wednesday: 3PM-10PM; Thursday: 3PM-10PM; Friday: 12PM–12AM; Saturday: 12PM–12AM; Sunday: 12PM–9PM', 
'1910 Elm St, Cincinnati, OH 45202', 'Rhinegeist is located in the historic Over-the-Rhine neighborhood in Cincinnati, Ohio. Our 25,000 square foot, active brewing facility is housed in the former bottling plant of Christian Moerlein Brewing Co., a formidable pre-Prohibition beermaker. We cant wait to meet ya!', true, 'https://media-exp1.licdn.com/dms/image/C4E1BAQGCkrtCNsSMMg/company-background_10000/0/1578514862862?e=2147483647&v=beta&t=Tbeps4MHeNRqWXULVPPqvyG_fYdFIBf3bT3_twwQgXg');

INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active, brewery_img)
VALUES ('Braxton', 'Covington, KY', '859-261-5600', 
'Monday: 3PM-9PM; Tuesday: 11AM-10PM; Wednesday: 11AM-10PM; Thursday: 11AM-10PM; Friday: 11AM-12AM; Saturday: 11AM-12AM; Sunday: 11AM–9PM', 
 '27 West 7th Street, Covington, KY 41011', 'Welcome to Braxton Brewing Company. You’re witnessing a dream coming to life. A place where ideas are born and fermented. It’s a great deal of work, but hell, that’s what makes a dream worth pursuing. This brewery celebrates determination, knowledge, and the humble pride we wave like a battle flag.', true, 'https://www.americanway.com/public/uploads/Cincinnati-Braxton-Brewing-Co-courtesy.jpg');

INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active, brewery_img)
VALUES ('Cartridge Brewing', 'Maineville, OH', '513-697-3434', 
'Monday: CLOSED; Tuesday: 4PM-10PM; Wednesday: 4PM-10PM; Thursday: 4PM-10PM; Friday: 11AM-11PM; Saturday: 11AM-11PM; Sunday: 11AM–9PM', 
'1411 Grandin Rd, Maineville, OH 45039', 'Opened in 1916, the historic Peters Cartridge Factory was once a community hub and the heart of Kings Mills. The space is now fully restored and is home to Cartridge Brewing. Built on the banks of the Little Miami River, Cartridge Brewing is a veteran-owned business focused on celebrating the traditional craft of brewing. Cartridge is proud to serve a selection of old world beers alongside easy-drinking specialty styles – all brewed on-site in our 15 bbl brewhouse.', true, 'https://cartridgebrewing.com/assets/general/_1200x630_crop_center-center_82_none/CTG_Hero.jpg?mtime=1531776428');

INSERT INTO breweries (brewery_name, brewery_location, phone_number,hours_of_operation, address, bio, active, brewery_img)
VALUES ('Sonder Brewing', 'Mason, OH', '513-779-2739', 
'Monday: 11AM-10PM; Tuesday: 11AM-10PM; Wednesday: 11AM-10PM; Thursday: 11AM-10PM; Friday: 11AM-12AM; Saturday: 11AM-12AM; Sunday: 10AM–9PM',  
'8584 Duke Blvd, Mason, OH 45040', 'Just like every person has a unique story, so does every beer. The story of Sonder beer begins with our unique, high-quality beer selection brewed on site at the Sonder Brewing production facility and taproom located in the Cincinnati area at 8584 Duke Boulevard in Mason, Ohio. The 15,200-square-foot building holds a 30-barrel brew house with American-made equipment and features 2,000-square-feet of taproom space. The Sonder brewing team, led by Chase Legler, has over 20 years of craft brewing experience, with a passion for quality and flavor that showcases throughout the Sonder beer lineup.', true, 'https://images.squarespace-cdn.com/content/v1/58c814d2414fb5205e266a1c/1573761869001-9UZJOYSOWTIT0S32URDZ/Beer+Garden+Sunet.jpg?format=1000w');

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
		WHERE username= 'brewer'),
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name ='MadTree'));
	   
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
	beer_name varchar(50) NOT NULL,
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
VALUES ('42 Mile', 5.6, 'Cider', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'MadTree'), 0.0, '', 'A semi-sweet cider brewed with apples grown locally at Beiersdorfer Orchard.', true, 'https://untappd.akamaized.net/photos/2021_10_24/c9088acfac56d856fa18a955247bd770_640x640.jpg');

INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('Bockaveli', 7.6, 'Bock', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'MadTree'), 18.0, '', 'Single / Traditional', true, 'https://untappd.akamaized.net/photos/2022_04_15/688fff70a4f25671639c141d911fb943_raw.jpg');
	
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('Born To Be Mild', 3.5, 'Mild',
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'MadTree'), 22.0, '', 'Bready, toasty malt with noticeable but not overpowering black tea notes.', true, 'https://untappd.akamaized.net/photos/2022_02_27/47add1842f940a5d2ae2ca780c4eb2eb_640x640.jpg');
	   
INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('Burning Apparition', 6.66, 'Peanut Butter Porter', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'MadTree'), 0.0, 'N/A', 'Peanut Butter Porter', true, 'https://untappd.akamaized.net/photos/2022_03_18/32ec0528e92a4417d64fc2a1057b9d58_640x640.jpg');

INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('Espressoself', 4.9, 'Brown Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'MadTree'), 17.0, '', 'Light bodied brown ale brewed with Deeper Roots coffee. Espresso coffee knows chocolate and Caramel note clean and let a dry finish.', true, 'https://untappd.akamaized.net/photos/2022_03_24/306c9af049188407f4ed01447bba4b68_640x640.jpg');

INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('Fable', 7.0, 'Porter', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'MadTree'), 30.0, '', 'Baltic', true, 'https://untappd.akamaized.net/photos/2022_04_06/ccc8278d572052689b74ca3933b50070_raw.jpg');

INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('Fiesta Forever', 4.6, 'Fruit Tart Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'MadTree'), 18.0, '', 'A margarita version of Shade with a boost of lime juice and sea salt.', true, 'https://untappd.akamaized.net/photos/2021_07_06/bf20e6d1e208e0d8d0dc6499e1d70a21_640x640.jpg');

INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('Galaxy High', 9.5, 'IPA', 
(SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'MadTree'), 120.0, '', 'Join two Australian hops as you encounter a crazy collection of tropical and dank flavors throughout this Imperial IPA. It’s big on your palate… disruptive even. Think "trophic cascades" disruptive.', true, 'https://cdn2.cincinnatimagazine.com/wp-content/uploads/sites/5/2015/03/Galaxy-High-01-e1426528515292.jpg');

INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('Happy Amber', 6.0, 'Red Ale', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'MadTree'), 30.0, '', '2018 GABF Gold Medal Winner | This dry-hopped ale combines caramel and biscuit malt flavors in happy equilibrium with late addition American hops. The approachable balance is intentional although the name is a “hoppy” accident.', true, 'https://pbs.twimg.com/media/FNl84_yXIAY0-gF?format=jpg&name=large');

INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('Its October Somewhere', 5.7, 'Lager - Amber', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'MadTree'), 17.0, '', '', true, 'https://untappd.akamaized.net/photos/2022_04_13/e612bf38977213957c572ab70343de0a_640x640.jpg');

INSERT INTO beers(beer_name, abv, beer_type, brewery_id, ibu, hops, description, available, beer_img)
VALUES ('Legendary Lager', 4.2, 'Lager', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'MadTree'), 15.0, '', '', true, 'https://www.gannett-cdn.com/presto/2021/03/08/PCIN/a8100e77-63ef-4c46-9887-ab30532d35c6-20210301_191851.jpg');

	   
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
VALUES ('Truth', 7.2, 'IPA', 
	   (SELECT brewery_id
	   FROM breweries
	   WHERE brewery_name = 'Rhinegeist'), 75, 'Amarillo, Citra, Simcoe, Centennial', 'Rare are moments of truth, when you’ve struck the last match, belting out tunes with your friends, staring deep into the campfire – times when you feel infinite. Our Truth is found in the scintillating brilliance of hops. Brewed with a nod to the Pacific, hops sizzle with tropical fruit aroma, grapefruit and mango notes and a dry finish.', true, 'https://rhinegeist.com/wp-content/uploads/2019/04/Truth_2019-9-576x380.jpg');	
	  
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
	rating int NOT NULL CHECK (rating <= 5),
	review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	beer_id int CONSTRAINT fk_beers REFERENCES beers(beer_id) NOT NULL,
	reviewer_id int CONSTRAINT fk_users REFERENCES users(user_id)
);


INSERT INTO reviews (review, rating, beer_id, reviewer_id)
VALUES ('That is one good beer!', 5, (
SELECT beer_id
FROM beers
WHERE beer_name = 'Truth'),(
SELECT user_id
FROM users
WHERE username = 'Zach'));

COMMIT TRANSACTION;
