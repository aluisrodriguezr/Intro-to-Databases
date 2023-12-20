# Intro-to-Databases

# Cruise Ship Database Project

This project focuses on creating a comprehensive database for a cruise ship, managing information about crew members, passengers, various positions on the ship, excursions, and the interactions between crew members, passengers, and excursions. The project is divided into multiple parts, each contributing to the overall functionality.

## Overview

- **Part 0:** Initial setup of the database, including the creation of tables for Crew, Passenger, and Position. Sample data is inserted to showcase the structure.

- **Part 1:** Modifies the database structure:
  1. Switches the columns `firstName` and `lastName` in the `crew` table.
  2. Creates a new table `cityState` with attributes `city`, `state`, and `zipCode`, and inserts distinct values from the `crew` and `passenger` tables.
  3. Establishes foreign key relationships between the `zipCode` column in the `crew` and `passenger` tables and the `zipCode` column in the `cityState` table.
  4. Drops the `city` and `state` columns from the `crew` and `passenger` tables.

- **Part 2:** Introduces new tables:
  1. `crewPosition`: Associates crew members with their positions on the ship.
  2. `excursion`: Stores information about available excursions, including name, description, size, type, food and beverage options, activity level, duration, and price.

- **Part 3:** Further modifies the database:
  1. Inserts data into the `cityState` table from an external file.
  2. Inserts data into the `crew` table from an external file.
  3. Inserts data into the `crewPosition` table from an external file.
  4. Performs a join query involving the `crew`, `position`, and `crewPosition` tables to retrieve specific information.

- **Part 4:** Continues to enhance the database:
  1. Creates tables `activityLevel`, `size`, `type`, and `foodBeverage` to categorize excursion attributes.
  2. Inserts distinct values into these tables based on excursion attributes.
  3. Updates the `excursion` table to reference the new category tables using foreign keys.
  4. Performs a join query to retrieve detailed information about excursions, including size, type, food and beverage options, and activity level.

- **Part 5:** Expands the database functionality:
  1. Updates the `type` table to standardize values.
  2. Creates a new table `passengerExcursion` to associate passengers with booked excursions.
  3. Inserts data into tables `activityLevel`, `size`, `type`, and `foodBeverage` from external files.
  4. Inserts data into the `excursion` table from an external file.
  5. Inserts data into the `passengerExcursion` table from an external file.
  6. Performs a join query to retrieve detailed information about passenger excursions, including passenger names, excursion details, size, type, food and beverage options, and activity level.

- **Part 6:** Introduces new functionality:
  1. Creates a table `crewExcursion` to associate crew members with excursions they are participating in.
  2. Inserts data into the `crewExcursion` table from an external file.
  3. Creates views:
     - `crewPositionView` to provide a summary of crew members and their positions.
     - `excursionView` to present detailed information about excursions, including size, type, food and beverage options, and activity level.
     - `bookedExcursionView` to display information about crew members, passengers, and excursions they are booked on.

- **Part 7:** Adds new elements:
  1. Creates a new table `timesheet` to track crew members' weekly hours.
  2. Inserts data into the `timesheet` table from an external file.
  3. Creates a view `timesheetView` with a join query to retrieve crew members and their total hours worked.

- **Part 8:** Manages database users:
  1. Creates a new user 'karin' with limited privileges.
  2. Grants SELECT, INSERT, and UPDATE privileges on the `cruise` database to the user 'karin'.
  3. Displays the granted privileges for the user 'karin'.
  4. Provides terminal commands to switch to the 'karin' user.

- **Part 9:** Enhances the database functionality with stored procedures:
  1. **payCheck:** A stored procedure to calculate and generate a payment check for a crew member. It takes the crew member's ID and an OUT parameter for the salary statement.
      - Sets the delimiter to `$$`.
      - Declares variables for the crew member's details, hours worked, hourly rate, overtime, and salary.
      - Declares a cursor for a join query to retrieve crew details, timesheet, position, and crew position information.
      - Uses a continue handler for the "not found" exception.
      - Loops through the cursor, calculates salary based on hours worked and hourly rate, and generates a salary statement.
      - Closes the cursor and ends the stored procedure.
      - Resets the delimiter to `;`.
  2. **Test Script:** Provides a script to test the `payCheck` stored procedure for multiple crew members.

Feel free to explore this cruise ship database project!

## Schema Evolution:

![Screen Shot 2023-12-20 at 4 08 11 PM](https://github.com/aluisrodriguezr/Intro-to-Databases/assets/96503213/3befd6b5-65a2-401a-811f-2e86a01e993a)

![Screen Shot 2023-12-20 at 4 06 15 PM](https://github.com/aluisrodriguezr/Intro-to-Databases/assets/96503213/3e85f825-8e1d-489a-b053-714d1f56f426)
