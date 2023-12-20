CREATE DATABASE cruise;
use cruise;

CREATE TABLE crew (
        ID INT unsigned NOT NULL AUTO_INCREMENT,
        lastName varchar(50) NOT NULL,
        firstName varchar(50) NOT NULL,
        address varchar(90) NOT NULL,
        city varchar(50) NOT NULL,
        state char(2) NOT NULL,
        zipCode char(5) NOT NULL,
        phone char(10) NOT NULL UNIQUE,
        email varchar(90) NOT NULL,
        PRIMARY KEY (ID)
    );

    CREATE TABLE passenger (
        ID INT unsigned NOT NULL AUTO_INCREMENT,
        lastName varchar(50) NOT NULL,
        firstName varchar(50) NOT NULL,
        address varchar(90) NOT NULL,
        city varchar(50) NOT NULL,
        state char(2) NOT NULL,
        zipCode char(5) NOT NULL,
        phone char(10) NOT NULL UNIQUE,
        email varchar(90) NOT NULL,
        PRIMARY KEY (ID)
    );

    CREATE TABLE `position` (
        ID INT NOT NULL AUTO_INCREMENT,
        description VARCHAR(50) NOT NULL UNIQUE,
        hourly float(5,2) NOT NULL DEFAULT 11.00,
        PRIMARY KEY (ID)
    );

    -- Crew Data --
    INSERT INTO crew (lastName, firstName, address, city, state, zipCode, phone, email)
    VALUES
    ("Igor", "Prince", "12 Creekside St", "Huntington Beach", "CA", 92647, 2025550109, "iprince@cruise.com"),
    ("Dante", "Rennie", "137 Wall St", "Memphis", "TN", 38117, 2025550112, "drennie@cruise.com"),
    ("Thomas", "Waters", "411 Shirley St", "Abingdon", "VA", "24210", "2025550115", "twaters@cruise.com"),
    ("Avaya", "Clarke", "7771 Border Court", "San Marcos", "CA", "92078", "2025550119", "aclarke@cruise.com"),
    ("Haniya", "Kaiser", "6 South Sulphur Springs Street", "Jefferson", "LA", "70121", "2025550121", "hkaiser@cruise.com"),
    ("Victor", "Newman", "942 New Saddle Drive", "Covington", "LA", "70433", "2025550122", "vnewman@cruise.com"),
    ("Douglas", "Guthrie", "9 Wrangler Ave", "Ontario", "CA", "91764", "2025550124", "dguthrie@cruise.com"),
    ("Brian", "Roberts", "7319 S. Greenview Drive", "Cuyahoga Falls", "OH", "44223", "2025550125", "broberts@cruise.com"),
    ("Paris", "Solis", "763 West Mulberry St", "Battle Creek", "MI", "49016", "2025550132", "psolis@cruise.com"),
    ("Umaiza", "Heath", "545 Ohio Ave", "Scottsdale", "AZ", "85260", "2025550135", "uheath@cruise.com");

    -- Passenger -- 
    INSERT INTO passenger (lastName, firstName, address, city, state, zipCode, phone, email) 
    VALUES 
    ("Goodman", "Yvonne", "12 Creekside St", "Nashville", "TN", "37205", "2025550109", "ygoodman@isp.com"), 
    ("Mackenzie", "Dante", "137 Wall St", "Nashville", "TN", "37205", "2025550112", "dmackenzie@isp.com"), 
    ("Rollins", "Alysha", "411 Shirley St", "Nashville", "TN", "37205", "2025550115", "arollins@isp.com"), 
    ("Gonzalez", "Avaya", "7771 Border Court", "Nashville", "TN", "37205", "2025550119", "agonzalez@isp.com"), 
    ("Kelly", "Haniya", "6 South Sulphur Springs Street", "Nashville", "TN", "37205", "2025550121", "hkelly@isp.com"), 
    ("Chambers", "Nathalie", "942 New Saddle Drive", "Clover", "SC", "29710", "2025550122", "nchambers@isp.com"), 
    ("Rollins", "Daniel", "9 Wrangler Ave", "Clover", "SC", "29710", "2025550124", "drollins@isp.com"), 
    ("Mckee", "Beverley", "7319 S. Greenview Drive", "Clover", "SC", "29710", "2025550125", "bmckee@isp.com"), 
    ("Lindsey", "Paris", "763 West Mulberry St", "Clover", "SC", "29710", "2025550132", "plindsey@isp.com"), 
    ("Melia", "Umaiza", "545 Ohio Ave", "Clover", "SC", "29710", "2025550135", "umelia@isp.com"), 
    ("Prince", "Nico", "20 Middle River Street", "Willoughby", "OH", "44094", "2025550137", "nprince@isp.com"), 
    ("Rennie", "Javan", "8112 North Country St", "Willoughby", "OH", "44094", "2025550139", "jrennie@isp.com"), 
    ("Waters", "Ali", "83 Rockland Lane", "Willoughby", "OH", "44094", "2025550144", "awaters@isp.com"), 
    ("Clarke", "JohnPaul", "1 Riverside Lane", "Willoughby", "OH", "44094", "2025550153", "jpcClarke@isp.com"), 
    ("Kaiser", "Dane", "694 Wall Road", "Willoughby", "OH", "44094", "2025550155", "kdaiser@isp.com"), 
    ("Newman", "Hammad", "9970 State Court", "Duluth", "GA", "30096", "2025550157", "hnewman@isp.com"),
    ('Guthrie', 'Maha', '54 Woodsman Drive', 'Duluth', 'GA', '30096', '2025550161', 'mguthrie@isp.com'),
    ('Roberts', 'Tulisa', '7174 Studebaker Street', 'Duluth', 'GA', '30096', '2025550163', 'troberts@isp.com'),
    ('Solis', 'Robin', '8474 Wentworth Street', 'Duluth', 'GA', '30096', '2025550164', 'rsolis@isp.com'),
    ('Heath', 'Kavita', '796 Hartford St', 'Duluth', 'GA', '30096', '2025550165', 'kheath@isp.com'),
    ('White', 'Meera', '484 Bridge St', 'Piscataway', 'NJ', '08854', '2025550166', 'mwhite@isp.com'),
    ('Esparza', 'Bradlee', '7031 Gainsway St', 'Piscataway', 'NJ', '08854', '2025550173', 'besparza@isp.com'),
    ('Leonard', 'Leilani', '37 Monroe Street', 'Piscataway', 'NJ', '08854', '2025550175', 'lleonard@isp.com'),
    ('Brook', 'Stefanie', '7990 West Surrey St', 'Piscataway', 'NJ', '08854', '2025550179', 'sbrook@isp.com'),
    ('Squires', 'Grover', '7618 Madison Court', 'Piscataway', 'NJ', '08854', '2025550180', 'gsquires@isp.com'),
    ('Kumar', 'Jonathan', '25 Annadale Court', 'Jupiter', 'FL', '33458', '2025550182', 'jkumar@isp.com'),
    ('Neville', 'Angus', '9841 Smith Drive', 'Jupiter', 'FL', '33458', '2025550187', 'aneville@isp.com'),
    ('Sparrow', 'Uzair', '7999 Hall Street', 'Jupiter', 'FL', '33458', '2025550188', 'usparrow@isp.com'),
    ('Currie', 'Amari', '8411 Pleasant St', 'Jupiter', 'FL', '33458', '2025550194', 'acurrie@isp.com'),
    ('Wallace', 'Imaani', '33 Pierce Rd', 'Jupiter', 'FL', '33458', '2025550195', 'iwallace@isp.com'),
    ('House', 'Efe', '97 High Point Street', 'Glenarden', 'MD', '20706', '2025550196', 'ehouse@isp.com'),
    ('Atkinson', 'Atticus', '66 Harrison Dr', 'Glenarden', 'MD', '20706',2025550197, 'aatkinson@isp.com'),
    ('Ramirez', 'Michelle', '370 Hill Field Ave', 'Glenarden', 'MD', '20706', 2025550198, 'mramirez@isp.com'),
    ('Hassan', 'Remy', '249 Devon Lane', 'Glenarden', 'MD', 20706, 2025550199, 'rhassan@isp.com'),
    ('Beck', 'Jordana', '7911 Carson Lane', 'Glenarden', 'MD', 20706, 2025550200, 'jbeck@isp.com');
    
    -- Position --
    INSERT INTO `position` (description, hourly)
    VALUES
    ("Accounting & Finance", 15.00),
    ("Activities & Fitness", 15.00),
    ("Administration", 18.00),
    ("Advertising & Marketing", 21.00),
    ("Casino", 13.00),
    ("Culinary Chef", 25.00),
    ("Deck & Engine", 18.00),
    ("Engineering", 39.00),
    ("Entertainment", 22.00),
    ("Food & Beverage", 13.00),
    ("Front Desk & Concierge", 21.00),
    ("Guest Services", 14.00),
    ("Housekeeping", 12.00),
    ("HR", 15.00),
    ("IT & Internet", 20.00),
    ("Legal", 40.00),
    ("Mechanic & Maintenance", 34.00),
    ("Procurement & Purchasing", 18.00),
    ("Retail & Merchandising", 24.00),
    ("Sales & Reservations", 24.00),
    ("Salon & Spa", 25.00),
    ("Security & Surveillance", 18.00),
    ("Shore Excursion", 20.00),
    ("Travel & Tourism", 23.00);
