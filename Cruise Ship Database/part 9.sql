-- Change to use the database cruise
use cruise;

-- 1. Create stored procedure payCheck to do the following
-- a. Set the delimiter to $$
DELIMITER $$
DROP PROCEDURE IF EXISTS payCheck$$
CREATE PROCEDURE payCheck (IN crewNum INT, INOUT salary VARCHAR(4000))
BEGIN

-- c. Declare the following variables
  DECLARE v_finished INTEGER DEFAULT 0;
  DECLARE v_lines VARCHAR(100) DEFAULT "-------------------------------------------------------";
  DECLARE v_cFirst VARCHAR(100) DEFAULT "";
  DECLARE v_cLast VARCHAR(100) DEFAULT "";
  DECLARE v_cAddress VARCHAR(100) DEFAULT "";
  DECLARE v_cCity VARCHAR(100) DEFAULT "";
  DECLARE v_cState VARCHAR(100) DEFAULT "";
  DECLARE v_cZip VARCHAR(100) DEFAULT "";
  DECLARE v_tHours INT DEFAULT 0;
  DECLARE v_pHourly DECIMAL(5,2) DEFAULT 0.0;
  DECLARE v_overtime INT DEFAULT 0;
  DECLARE v_count INTEGER DEFAULT 0;
  DECLARE v_pay DECIMAL(8,2) DEFAULT 0.0;

-- d. Declare cursor crew_cursor for the following join query
  DECLARE crew_cursor CURSOR FOR
    SELECT c.firstName,
           c.lastName,
           c.address,
           cs.city,
           cs.state,
           cs.zipCode,
           (t.sun + t.mon + t.tue + t.wed + t.thurs + t.fri + t.sat)
           AS hours,
           p.hourly
    FROM crew c, cityState cs, timesheet t, position p, crewposition cp
    WHERE c.zipCode = cs.zipCode
      AND t.crewId = c.id
      AND cp.crewId = c.id
      AND cp.positionId = p.id
      AND t.crewId = crewNum;

-- e. Declare continue exception handler for not found set variable v_finished equal to 1
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_finished = 1;

-- f. Open crew_cursor
  OPEN crew_cursor;

-- g. Loop through the crew_cursor, using loop label get_crew
  get_crew: LOOP
    
    FETCH crew_cursor INTO 
    v_cFirst, 
    v_cLast, 
    v_cAddress, 
    v_cCity, 
    v_cState, 
    v_cZip, 
    v_tHours, 
    v_pHourly;
    
    IF v_finished = 1 THEN
      LEAVE get_crew;
    END IF;

    SET v_count = v_count + 1;
    
    IF v_count = 1 THEN

    -- calculate the salary
    IF v_tHours <= 40 THEN
      SET v_pay = v_tHours * v_pHourly;
    ELSEIF v_tHours > 40 THEN
      SET v_overtime = (v_tHours - 40) * (v_pHourly * 1.5);
      SET v_pay = 40 * v_pHourly;
      SET v_pay = v_pay + v_overtime;
    END IF;

-- from
    SET salary = CONCAT(salary, "\n", v_lines, "\n");
    SET salary = CONCAT(salary, "\From:");
    SET salary = CONCAT(salary, "\nCGS 2545 Cruise Line\n");
    SET salary = CONCAT(salary, "\MSB 260\n\n");
    
    SET salary = CONCAT(salary, "Pay to the order of: \n");
    SET salary = CONCAT(salary, v_cFirst, " ", v_cLast, "\n");
    SET salary = CONCAT(salary, v_cAddress, "\n");
    SET salary = CONCAT(salary, v_cCity, ", ", v_cState, " ", v_cZip, "\n\n");

-- Amount
    SET salary = CONCAT(salary, "In the amount of: \n");
    SET salary = CONCAT(salary, "Pay: $", v_pay, "\n");
    SET salary = CONCAT(salary, v_lines, "\n");
  END IF;

-- h. End the loop label get_crew
  END LOOP get_crew;

-- i. Close the stored cursor crew_cursor
  CLOSE crew_cursor;

-- j. end the stored procedure
END$$

-- k. reset the delimiter
DELIMITER ;


-- 2. Write the source code to test the stored procedure
-- Ty Bell
SET @salary = "";
CALL payCheck(36, @salary);
SELECT @salary;

-- Oliwier Barnett
SET @salary = "";
CALL payCheck(13, @salary);
SELECT @salary;

-- Rebekah Morgan
SET @salary = "";
CALL payCheck(24, @salary);
SELECT @salary;

-- Krystal Walters
SET @salary = "";
CALL payCheck(22, @salary);
SELECT @salary;

-- Kaya Hodge
SET @salary = "";
CALL payCheck(30, @salary);
SELECT @salary;

-- Paris Solis
SET @salary = "";
CALL payCheck(9, @salary);
SELECT @salary;

-- Umaiza Heath
SET @salary = "";
CALL payCheck(10, @salary);
SELECT @salary;

-- Floyd Johns
SET @salary = "";
CALL payCheck(37, @salary);
SELECT @salary;

-- Jemima HeatMillerh
SET @salary = "";
CALL payCheck(31, @salary);
SELECT @salary;

-- Raja Glass
SET @salary = "";
CALL payCheck(16, @salary);
SELECT @salary;
