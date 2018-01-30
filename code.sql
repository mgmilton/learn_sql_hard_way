DROP TABLE IF EXISTS person;
DROP TABLE IF EXISTS pet;
DROP TABLE IF EXISTS person_pet;

CREATE TABLE person (
    id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    age INTEGER
);

CREATE TABLE pet (
    id INTEGER PRIMARY KEY,
    name TEXT,
    breed TEXT,
    age INTEGER,
    dead INTEGER
);

CREATE TABLE person_pet (
    person_id INTEGER,
    pet_id INTEGER
);
INSERT INTO person (id, first_name, last_name, age) VALUES (0, 'Zed', 'Shaw', 37);
INSERT INTO pet (id, name, breed, age, dead) VALUES (0, 'Fluffy', 'Unicorn', 1000, 0);
INSERT INTO pet VALUES (1, 'Gigantor', 'Robot', 1, 1);
INSERT INTO person VALUES (1, 'Matt', 'Milton', 27);
INSERT INTO person VALUES (2, 'Kurt', 'Godel', 33);
INSERT INTO pet VALUES (2, 'Roscoe', 'Australian Shepperd', 4, 0);
INSERT INTO pet VALUES (3, 'Bertrand', 'Philosopher', 97, 0);
INSERT INTO person_pet (person_id, pet_id) VALUES (0, 0);
INSERT INTO person_pet VALUES (0, 1);
INSERT INTO person_pet VALUES (1, 2);
INSERT INTO person_pet VALUES (2, 3);
/* make sure there's dead pets */
SELECT name, age FROM pet WHERE dead = 1;

/* delete the dead robot pet */
DELETE FROM pet WHERE dead = 1;

/*make sure the robot is gone */
SELECT * FROM pet;

/* let's ressurect the robot */
INSERT INTO pet VALUES (1, 'Gigantor', 'Robot', 1, 0);


/* the robot LIVES! */
SELECT * FROM pet;

/*Adds body measurements */
ALTER TABLE person ADD COLUMN height INTEGER;
ALTER TABLE person ADD COLUMN weight INTEGER;
