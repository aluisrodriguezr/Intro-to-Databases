-- 1. use cruise --
use cruise;

-- 2. Create a table named activityLevel with the following attributes, data types, and constraints:--
CREATE TABLE activityLevel (
  ID INT NOT NULL AUTO_INCREMENT,
  exLevel VARCHAR(25) NOT NULL UNIQUE,
  PRIMARY KEY (ID)
);

-- 3. Create a table named size with the following attributes, data types, and constraints: --
CREATE TABLE size (
  ID INT NOT NULL AUTO_INCREMENT,
  exSize VARCHAR(25) NOT NULL UNIQUE,
  PRIMARY KEY (ID)
);

-- 4. Create a table named type with the following attributes, data types, and constraints: --
CREATE TABLE type (
  ID INT NOT NULL AUTO_INCREMENT,
  exType VARCHAR(25) NOT NULL UNIQUE,
  PRIMARY KEY (ID)
);

-- 5. Create a table named foodBeverage with the following attributes, data types, and constraints: --
CREATE TABLE foodBeverage (
  ID INT NOT NULL AUTO_INCREMENT,
  offering VARCHAR(25) NOT NULL UNIQUE,
  PRIMARY KEY (ID)
);

-- 6. Insert into table activityLevel, column exLevel, the distinct values from table excursion column activityLevel --
INSERT INTO activityLevel (exLevel)
SELECT DISTINCT activityLevel FROM excursion;

-- 7. Insert into table size, column exSize, the distinct values from table excursion column size --
INSERT INTO size (exSize)
SELECT DISTINCT size FROM excursion;

-- 8. Insert into table type, column exType, the distinct values from table excursion column type --
INSERT INTO type (exType)
SELECT DISTINCT type FROM excursion; 

-- 9.Insert into table foodBeverage, column offering, the distinct values from table excursion column foodBeverage --
INSERT INTO foodBeverage (offering)
SELECT DISTINCT foodBeverage
FROM excursion;

-- 10. Update table excursion, set the value of column activityLevel equal to the corresponding id value in the table activityLevel.  This requires a SELECT * FROM activityLevel; to see what the id value is for each exLevel.  For example, in my database --
UPDATE excursion
SET activityLevel = 1 
WHERE activityLevel = 'Moderate';

UPDATE excursion
SET activityLevel = 2 
WHERE activityLevel = 'Easy';

-- 11. Update table excursion, set the value of column size equal to the corresponding id value in the table size.  This requires a SELECT * FROM size; to see what the id value is for each exSize.  For example, in my database --
UPDATE excursion
SET size = 1
WHERE size = 'Standard';

UPDATE excursion
SET size = 2
WHERE size = 'Small';

-- 12.  Update table excursion, set the value of column type equal to the corresponding id value in the table type.  This requires a SELECT * FROM type; to see what the id value is for each exType.  For example, in my database --
UPDATE excursion
SET type = 1
WHERE type = 'Scenic';

UPDATE excursion
SET type = 2
WHERE type = 'Cultural, Scenic';

-- 13. Update table excursion, set the value of column foodBeverage equal to the corresponding id value in the table foodBeverage.  This requires a SELECT * FROM foodBeverage; to see what the id value is for each offering.  For example, in my database --
UPDATE excursion
SET foodBeverage = 1
WHERE foodBeverage = 'Not Included';

-- 14. Alter table excursion so column activityLevel is an integer, not null --
ALTER TABLE excursion MODIFY COLUMN activityLevel INT NOT NULL;

-- 15. Alter table excursion so column size is an integer, not null --
ALTER TABLE excursion MODIFY COLUMN size INT NOT NULL;

-- 16. Alter table excursion so column type is an integer, not null --
ALTER TABLE excursion MODIFY COLUMN type INT NOT NULL;

-- 17. Alter table excursion so column foodBeverage is an integer, not null 
ALTER TABLE excursion MODIFY COLUMN foodBeverage INT NOT NULL;

-- 18. Alter table excursion to rename column activityLevel to activityLevelId 
ALTER TABLE excursion RENAME COLUMN activityLevel TO activityLevelId;

-- 19. Alter table excursion to rename column size to sizeId 
ALTER TABLE excursion RENAME COLUMN size TO sizeId;

-- 20. Alter table excursion to rename column type to typeId 
ALTER TABLE excursion RENAME COLUMN type TO typeId;

-- 21. Alter table excursion to rename column foodBeverage to foodBeverageId 
ALTER TABLE excursion RENAME COLUMN foodBeverage TO foodBeverageId;

-- 22. Alter table excursion so that column activityLevelId is a foreign key to table activityLevel, column ID 
ALTER TABLE excursion
ADD CONSTRAINT activityLevelId
FOREIGN KEY (activityLevelId)
REFERENCES activityLevel(ID);

-- 23. Alter table excursion so that column sizeId is a foreign key to table size, column ID 
ALTER TABLE excursion
ADD CONSTRAINT sizeId
FOREIGN KEY (sizeId)
REFERENCES size(ID);

-- 24. Alter table excursion so that column typeId is a foreign key to table type, column ID 
ALTER TABLE excursion
ADD CONSTRAINT typeId
FOREIGN KEY (typeId)
REFERENCES type(ID);

-- 25. Alter table excursion so that column foodBeverageId is a foreign key to table foodBeverage, column ID 
ALTER TABLE excursion
ADD CONSTRAINT foodBeverageId
FOREIGN KEY (foodBeverageId)
REFERENCES foodBeverage(ID);

-- 26. Write a join query to join tables excursion, foodBeverage, type, size, activityLevel to select the following: 
SELECT e.id, e.name, s.exSize, t.exType, fb.offering, al.exLevel, e.durationMinutes, e.price
FROM excursion e
JOIN size s ON e.sizeId = s.id
JOIN type t ON e.typeId = t.id
JOIN foodBeverage fb ON e.foodBeverageId = fb.id
JOIN activityLevel al ON e.activityLevelId = al.id;
