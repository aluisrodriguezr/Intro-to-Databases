-- 1. Change to use the database cruise --
use cruise;

-- 2. Create table named crewPosition with the following attributes, data types, and constraints: --
CREATE TABLE crewPosition (
  crewId INT NOT NULL UNIQUE,
  positionId INT NOT NULL,
  PRIMARY KEY (crewId, positionId),
  FOREIGN KEY (crewId) REFERENCES crew(ID),
  FOREIGN KEY (positionId) REFERENCES `position`(ID)
);

-- 3. Insert into table crewPosition data --
INSERT INTO crewPosition (crewId, positionId)
VALUES 
(1,24),
(2,12),
(3,6),
(4,3),
(5,1),
(6,20),
(7,10),
(8,5),
(9,2),
(10,16);

-- 4. Create table named excursion with the following attributes, data types, and constraints: --
CREATE TABLE excursion (
  ID INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL UNIQUE,
  description VARCHAR(300) NOT NULL,
  size VARCHAR(25) NOT NULL,
  type VARCHAR(25) NOT NULL,
  foodBeverage VARCHAR(25) NOT NULL,
  activityLevel VARCHAR(25) NOT NULL,
  durationMinutes INT NOT NULL,
  price DECIMAL(6, 2) NOT NULL,
  PRIMARY KEY (ID)
);

-- 5. Insert into table excursion data --
INSERT INTO excursion (name, description, size, type, foodBeverage, activityLevel, durationMinutes, price)
VALUES 
  ('Skagway City and White Pass Summit', 'Start with a tour of historic Skagway, and learn of its lawless days during the Klondike Gold Rush of 1897-99 and travel through the White Pass Summit with lots of stops along the way to photograph the beautiful scenery.', 'Standard', 'Scenic', 'Not Included', 'Moderate', 150, 65.00),
  ('Scenic Waterfall Adventure', 'When you stop in Skagway, there is no better scenic and relaxing ride to the areas beautiful waterfall destinations, both in the state and along the Klondike Highway into Canada.', 'Standard', 'Cultural, Scenic', 'Not Included', 'Easy', 180, 75.00),
  ('Helicopter Glacier Discovery', 'When you stop in Skagway, there is no better scenic and relaxing ride to the areas beautiful waterfall destinations, both in the state and along the Klondike Highway into Canada.', 'Standard', 'Cultural, Scenic', 'Not Included', 'Easy', 180, 435.00),
  ('White Pass Summit Rail and Bus Excursion', 'See more of Alaska on this scenic excursion that combines the best of the White Pass Railroad with a bus tour along a different route with stops along the way.', 'Small', 'Scenic', 'Not Included', 'Easy', 225, 186.00),
  ('White Pass Summit Rail and Yukon Suspension Bridge', 'See more of Alaska on this scenic excursion that combines the best of the White Pass Railroad with an expedition to the Yukon Suspension Bridge.', 'Small', 'Scenic', 'Not Included', 'Easy', 285, 229.00);
