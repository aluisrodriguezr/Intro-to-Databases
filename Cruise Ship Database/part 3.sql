use cruise;

-- 2. Insert into table cityState data from file cityState.sql --
INSERT INTO cityState (city, state, zipCode)
VALUES
('Vicksburg', 'MS', '39180'),
('Ballston Spa', 'NY', '12020'),
('Chillicothe', 'OH', '45601'),
('Chesterfield', 'VA', '23832'),
('Santa Cruz', 'CA', '95060'),
('Mooresville', 'NC', '28115'),
('Waldorf', 'MD', '20601'),
('Havertown', 'PA', '19083'),
('Indian Trail', 'NC', '28079'),
('Noblesville', 'IN', '46060'),
('Paterson', 'NJ', '07501'),
('Trumbull', 'CT', '06611');

-- 3. Insert into table crew data from file crew.sql --
INSERT INTO crew (firstName, lastName, address, zipCode, phone, email)
VALUES
    ('Raheem', 'Montgomery', '71 Paris Hill Rd.', '39180', '4134849795', 'rmontgomery@cruise.com'),
    ('Leo', 'Bird', '201 Eagle Dr.', '12020', '7747829407', 'lbird@cruise.com'),
    ('Oliwier', 'Barnett', '81 Cedar Swamp St.', '39180', '2764343958', 'obarnett@cruise.com'),
    ('Fern', 'Garner', '37 Gartner Court', '12020', '2256254378', 'fgarner@cruise.com'),
    ('Dawson', 'Marquez', '90 Mammoth Street', '45601', '7634882879', 'dmarquez@cruise.com'),
    ('Raja', 'Glass', '7918 Talbot Ave.', '45601', '2319969540', 'rglass@cruise.com'),
    ('Alissa', 'Ortiz', '7756 Fulton Court', '23832', '2397268929', 'aortiz@cruise.com'),
    ('Nicholas', 'Pena', '8123 Race Ave.', '95060', '7815242242', 'npena@cruise.com'),
    ('Harvey', 'West', '9 Cherry Ave', '23832', '7326232762', 'hwest@cruise.com'),
    ('Aamina', 'Dillon', '9 West Boston Lane', '95060', '2035745299', 'adillon@cruise.com'),
    ('Louis', 'Giles', '598 North Road', '28115', '2708583758', 'lgiles@cruise.com'),
    ('Krystal', 'Walters', '583 North Nichols Street', '95060', '3232591832', 'kwalters@cruise.com'),
    ('Alexa', 'Preston', '9227 North Bow Ridge Street', '28115', '4098496634', 'apreston@cruise.com'),
    ('Rebekah', 'Morgan', '9437 East 6th Street', '20601', '6073928343', 'rmorgan@cruise.com'),
    ('Ethan', 'Ali', '167 NE. Depot Dr.', '28115', '2245499884', 'eali@cruise.com'),
    ('Malik', 'Vincent', '312 Colonial Ave.', '19083', '9149573014', 'mvincent@cruise.com'),
    ('Sara', 'Barron', '9064 E. Swanson St.', '20601', '8707743244', 'sbarron@cruise.com'),
    ('Lyra', 'Murphy', '400 Nut Swamp Drive', '19083', '3527673126', 'lmurphy@cruise.com'),
    ('Awais', 'Carrillo', '225 South Manhattan Street', '28079', '6369577670', 'acarrillo@cruise.com'),
    ('Kaya', 'Hodge', '9572 William Lane', '46060', '2125271561', 'khodge@cruise.com'),
    ('Jemima', 'Miller', '9290 Indian Spring Rd.', '28079', '6206673264', 'jmiller@cruise.com'),
    ('Laila', 'Christensen', '15 Rose Avenue', '07501', '9017396978', 'lchristensen@cruise.com'),
    ('Honey', 'Warren', '7946 Leeton Ridge Street', '06611', '5858531050', 'hwarren@cruise.com'),
    ('Brodie', 'Gordon', '71 Jackson Ave.', '46060', '9016899813', 'bgordon@cruise.com'),
    ('Lauren', 'Morton', '7931 Rockaway Street', '28079', '4476721422', 'lmorton@cruise.com'),
    ('Ty', 'Bell', '921 Brook St.', '07501', '2393336881', 'tbell@cruise.com'),
    ('Floyd', 'Johns', '2 Shore Street', '06611', '4065842872', 'fjohns@cruise.com'),
    ('Mathew', 'Horton', '1 Rockland Ave.', '46060', '7195789907', 'mhorton@cruise.com'),
    ('Ernest', 'Higgins', '451 Marshall Lane', '06611', '7637651247', 'ehiggins@cruise.com'),
    ('Kamil', 'Lozano', '75 N. Golden Star Street', '07501', '7638554744', 'klozano@cruise.com');

    -- 4. nsert into table crewPosition data from file crewPosition.sql --
    INSERT INTO crewPosition (crewId, positionId)
    VALUES
    (11, 4),
    (12, 19),
    (13, 8),
    (14, 17),
    (15, 8),
    (16, 23),
    (17, 12),
    (18, 10),
    (19, 11),
    (20, 5),
    (21, 20),
    (22, 13),
    (23, 21),
    (24, 15),
    (25, 17),
    (26, 7),
    (27, 9),
    (28, 18),
    (29, 23),
    (30, 13),
    (31, 23),
    (32,23),
    (33, 7),
    (34, 19),
    (35, 10),
    (36,15),
    (37, 13),
    (38, 7),
    (39, 22),
    (40, 14);

-- 5. Write a join query to query join table crew, position and crewPosition to select the following: 
SELECT c.firstName, c.lastName, c.phone, p.description
FROM crew c
INNER JOIN crewPosition cp ON c.ID = cp.crewID
INNER JOIN position p ON cp.positionID = p.ID
ORDER BY p.description, c.lastName;
