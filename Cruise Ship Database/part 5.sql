-- 1.  Change to use the database cruise 
use cruise;
-- 2.  Update table type, set the value of column exType equal to 'Cultural' where exType equals 'Cultural, Scenic' 
UPDATE type
SET exType = 'Cultural'
WHERE exType = 'Cultural, Scenic';

-- 3. Create table named passengerExcursion with the following attributes, data types, and constraints: 
CREATE TABLE passengerExcursion (
  passengerId INT NOT NULL,
  excursionId INT NOT NULL,
  PRIMARY KEY (passengerId, excursionId),
  FOREIGN KEY (passengerId) REFERENCES passenger(id),
  FOREIGN KEY (excursionId) REFERENCES excursion(id)
);

-- 4.  Insert into table activityLevel data in file activityLevel.sql 
INSERT INTO activityLevel (exLevel)
VALUES ('Difficult');

-- 5.  Insert into table size data in file size.sql 
INSERT INTO size (exSize)
VALUES ('Private');

-- 6.  Insert into table type data in file type.sql 
INSERT INTO type (exType)
VALUES ('Water'), ('Cuisine'), ('Active'), ('Beach');

-- 7.  Insert into table foodBeverage data in file foodBeverage.sql 
INSERT INTO foodBeverage (offering)
VALUES ('None'), ('Snack'), ('Coffee Included'), ('Salmon Bake'), ('Buffet Included'), ('Lunch is Included'), ('Beverages Included');

-- 8.  Insert into table excursion data in file excursion.sql 
INSERT INTO excursion (name, description, sizeId, typeId, foodBeverageId, activityLevelId, durationMinutes, price)
VALUES ('Exclusive Juneau City and Mendenhall Glacier Tour', 'This half day program will give you a city orientation and a visit to the Mendenhall Glacier and visitors center.', 1, 1, 2, 2, 180, 75.00),
('Whales and Mendenhall Glacier', 'Alaska spectacular marine life and one of its best known glaciers all in a half day program on a boat holding a maximum of 40 guests. Whale viewing is guaranteed.', 1, 1, 3, 1, 280, 225.00),
('Best of Juneau', 'Combine whale watching, a salmon bake, and views of the Mendenhall Glacier in this Juneau combination.', 1, 4, 5, 2, 375, 223.00),
('Mendenhall Lake Kayak and Salmon Bake', 'Kayak into the breathtaking glacial waters of Mendenhall Lake and allow your senses to absorb the beauty this majestic place has to offer.', 2 3, 7, 1, 300, 293.00),
('Mendenhall Glacier Trek', 'For the hearty and experienced hiker, come along for glacier trekking on the Mendenhall Glacier!', 2, 3, 3, 3, 480, 257.00),
('Helicopter Dog Sledding Extended Tour', 'This is a "once in a lifetime" tour. The helicopter flight is only one part of this legendary experience that includes flying over the Juneau Icefield to the dog camp and then experiencing a kennel tour and a dogsled ride. Choose this extended adventure for more time at the glacier!', 2, 5, 1, 2, 220, 832.00);

-- 9.  Insert into table passengerExcursion data in file passengerExcursion.sql 
 INSERT INTO passengerExcursion (passengerId, excursionId) 
 VALUES
 (27, 3),
 (32, 8),
 (8, 4),
 (22, 11),
 (15, 7),
 (7, 1),
 (2, 2),
 (31, 11),
 (16, 5),
 (5, 1),
 (30, 5),
 (12, 1),
 (35, 8),
 (20, 6),
 (23, 3),
 (11, 4),
 (19, 6),
 (28, 7),
 (1, 2);

-- 14. Write a join query to join tables passenger, excursion, passengerExcursion, size, type, foodBeverage, activityLevel to select the following: 
SELECT passenger.firstName, passenger.lastName, excursion.name, size.exSize, type.exType, foodBeverage.offering, activityLevel.exLevel, excursion.durationMinutes, excursion.price
FROM passenger
JOIN passengerExcursion ON passenger.id = passengerExcursion.passengerId
JOIN excursion ON passengerExcursion.excursionId = excursion.id
JOIN size ON excursion.sizeId = size.id
JOIN type ON excursion.typeId = type.id
JOIN foodBeverage ON excursion.foodBeverageId = foodBeverage.id
JOIN activityLevel ON excursion.activityLevelId = activityLevel.id
ORDER BY excursion.name, passenger.lastName;
