-- 1. Change to use the database cruise --
use cruise;

-- 2. Alter table crew to switch columns firstName and lastName --
ALTER TABLE crew
RENAME COLUMN firstName TO temp;

ALTER TABLE crew
RENAME COLUMN lastName TO firstName;

ALTER TABLE crew
RENAME COLUMN temp TO lastName;

-- 3. Create a table named cityState with the following attributes, data types, and constraints: --
CREATE TABLE cityState (
city varchar(90) NOT NULL,
state char(2) NOT NULL,
zipCode char(5) NOT NULL UNIQUE,
PRIMARY KEY (zipCode)
);

-- 4. Insert into table cityState columns city, state and zipCode distinct values from columns city, state and zipCode from table crew --
insert into cityState (city, state, zipCode)
select distinct city, state, zipCode from crew;

-- 5. Insert into table cityState columns city, state and zipCode distinct values from columns city, state and zipCode from table passenger --
insert into cityState (city, state, zipCode)
select distinct city, state, zipCode from passenger;

-- 6. Alter table crew so that column zipCode is a foreign key to table cityState, column zipCode --
ALTER TABLE crew
ADD FOREIGN KEY (zipCode) REFERENCES cityState (zipCode);

-- 7. Alter table crew to drop column city and state --
ALTER TABLE crew 
DROP COLUMN city;

ALTER TABLE crew
DROP COLUMN state;

-- 8. Alter table passenger so that column zipCode is a foreign key to table cityState, column zipCode --
ALTER TABLE passenger 
ADD FOREIGN KEY (zipCode) REFERENCES cityState (zipCode);

-- 9. Alter table passenger to drop column city and state
ALTER TABLE passenger 
DROP COLUMN city;

ALTER TABLE passenger 
DROP COLUMN state;
