-- 1. Change to use the database cruise
use cruise;

-- a. Create a table named timesheet with the following attributes, data types, and constraints:
CREATE TABLE timesheet (
    ID int NOT NULL AUTO_INCREMENT,
    crewId int NOT NULL,
    sun int NOT NULL DEFAULT(0),
    mon int NOT NULL DEFAULT(0),
    tue int NOT NULL DEFAULT(0),
    wed int NOT NULL DEFAULT(0),
    thurs int NOT NULL DEFAULT(0),
    fri int NOT NULL DEFAULT(0),
    sat int NOT NULL DEFAULT(0),
    PRIMARY KEY (ID),
    CONSTRAINT fk_timesheet_crewId FOREIGN KEY (crewId) REFERENCES crew (id) 
);

-- 2. insert data in file timesheet.sql into table timesheet
SELECT * FROM crew;
INSERT INTO timesheet (crewId, sun, mon, tue, wed, thurs, fri, sat)
VALUES
(25, 12, 0, 12, 0, 4, 12, 0),
(13, 7, 4, 9, 0, 0, 10, 3),
(27, 0, 12, 6, 10, 6, 8, 0),
(36, 8, 8, 0, 0, 8, 10, 6),
(12, 0, 8, 8, 8, 8, 8, 0),
(29, 12, 0, 12, 0, 4, 12, 0),
(32, 0, 12, 6, 10, 6, 8, 0),
(4, 10, 8, 0, 0, 8, 10, 10),
(20, 8, 8, 0, 0, 8, 10, 6),
(14, 12, 0, 12, 0, 4, 12, 0),
(21, 8, 8, 0, 0, 8, 10, 6),
(16, 12, 0, 12, 0, 4, 12, 0),
(34, 0, 8, 8, 8, 8, 8, 0),
(7, 12, 0, 12, 0, 4, 12, 0),
(10, 6, 6, 6, 6, 6, 5, 0),
(39, 0, 8, 8, 8, 8, 8, 0),
(30, 10, 8, 0, 0, 8, 10, 10),
(38, 7, 4, 9, 0, 0, 10, 3),
(37, 6, 6, 6, 6, 6, 5, 0),
(5, 6, 6, 6, 6, 6, 5, 0),
(40, 10, 8, 0, 0, 8, 10, 10),
(15, 7, 4, 9, 0, 0, 10, 3),
(31, 10, 8, 0, 0, 8, 10, 10),
(11, 10, 8, 0, 0, 8, 10, 10),
(24, 7, 4, 9, 0, 0, 10, 3),
(35, 8, 8, 0, 0, 8, 10, 6),
(28, 12, 0, 12, 0, 4, 12, 0),
(6, 0, 8, 8, 8, 8, 8, 0),
(17, 10, 8, 0, 0, 8, 10, 10),
(18, 0, 8, 8, 8, 8, 8, 0),
(23, 6, 6, 6, 6, 6, 5, 0),
(1, 0, 12, 6, 10, 6, 8, 0),
(2, 0, 8, 8, 8, 8, 8, 0),
(8, 8, 8, 0, 0, 8, 10, 6),
(9, 0, 12, 6, 10, 6, 8, 0),
(26, 0, 12, 6, 10, 6, 8, 0),
(22, 6, 6, 6, 6, 6, 5, 0),
(33, 0, 12, 6, 10, 6, 8, 0),
(3, 6, 6, 6, 6, 6, 5, 0),
(19, 0, 8, 8, 8, 8, 8, 0);

-- 3. Create vbiew timesheetView with a join query to join tables crew and timesheet to do the following
CREATE VIEW timesheetView AS
SELECT CONCAT(c.firstName, ' ', c.lastName) AS `Crew Member`, 
       SUM(t.sun + t.mon + t.tue + t.wed + t.thurs + t.fri + t.sat) AS `Hours`
FROM timesheet t
INNER JOIN crew c ON t.crewId = c.id
GROUP BY t.crewId
ORDER BY c.lastName;
