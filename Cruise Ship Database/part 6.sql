use cruise;

-- 2. Create table named crewExcursion with the following attributes, data types, and constraints:
CREATE TABLE crewExcursion (
  crewId int NOT NULL,
  excursionId int NOT NULL,
  PRIMARY KEY (crewId, excursionId),
  CONSTRAINT crew_excursion_crewId_fk FOREIGN KEY (crewId) REFERENCES crew (id),
  CONSTRAINT crew_excursion_excursionId_fk FOREIGN KEY (excursionId) REFERENCES excursion (ID)
);

-- 3. Insert into table crewExcursion data in file crewExcursion.sql
INSERT INTO crewExcursion (crewId, excursionId)
VALUES (16,8),
(29, 6),
(31, 11),
(32, 3),
(16, 10),
(29, 9),
(32, 9),
(31, 2),
(32, 1),
(16, 7),
(29, 4),
(31, 5);

-- 4. Create view crewPositionView with a join query to join tables crew, position, and crewPosition to do the following:
CREATE VIEW crewPositionView AS 
SELECT CONCAT(c.firstName, ' ', c.lastName) AS `Crew Member`, 
       c.phone AS `Crew Phone`, 
       p.description AS `Crew Position`
FROM crew c
JOIN crewPosition cp ON c.id = cp.crewId
JOIN position p ON cp.positionId = p.id
ORDER BY p.description, c.lastName;

-- 5. Create view excursionView with a join query to join tables excursion, foodBeverage, type, size, and activityLevel to do the following:
CREATE VIEW excursionView AS
SELECT e.name AS Excursion, s.exSize AS Size, t.exType AS Type, 
       f.offering AS `Food/Beverage`, a.exLevel AS `Activity Level`,
       e.durationMinutes AS `Duration in Minutes`, e.price AS Price
FROM excursion e
INNER JOIN size s ON e.sizeId = s.ID
INNER JOIN type t ON e.typeId = t.ID
INNER JOIN foodBeverage f ON e.foodBeverageId = f.ID
INNER JOIN activityLevel a ON e.activityLevelId = a.ID
ORDER BY a.exLevel;

-- 6. Create view bookedExcursionView with a join query to join tables crew, passenger, excursion, passengerExcursion, foodBeverage, and crewExcursion to do the following:
CREATE VIEW bookedExcursionView AS
SELECT CONCAT(c.firstName, ' ', c.lastName) AS "Crew Member",
       CONCAT(p.firstName, ' ', p.lastName) AS "Passenger",
       e.name AS "Excursion",
       f.offering AS "Food/Beverage",
       e.durationMinutes AS "Duration in Minutes"
FROM crew c, passenger p, excursion e, passengerExcursion pe, foodBeverage f, crewExcursion ce
WHERE pe.passengerId = p.ID
  AND pe.excursionId = e.ID
  AND ce.crewId = c.ID
  AND ce.excursionId = e.ID
  AND e.foodBeverageId = f.ID
  AND ce.excursionId = pe.excursionId
ORDER BY e.name;
