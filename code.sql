DROP TABLE ex7.db

CREATE TABLE person (
    id INTEGER PRIMARY KEY;
    first_name TEXT,
    last_name TEXT,
    age INTEGER,
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
INSERT INTO pet VALUES (3, 'Bertrand', 'Philosopher', 97, 1);

INSERT INTO person_pet (person_id, pet_id) VALUES (0, 0);
INSERT INTO person_pet (0, 1);
INSERT INTO person_pet (1, 2);
INSERT INTO person_pet (2, 3);


SELECT * FROM person;
SELECT name, age FROM pet;
SELECT name, age FROM pet WHERE dead = 0;
SELECT * FROM person WHERE first_name != 'Zed';
SELECT * FROM pet WHERE age > 10;
SELECT * FROM person WHERE age < 27;
SELECT * FROM pet WHERE age < 10 AND name = "Roscoe";
SELECT * FROM pet WHERE age <= 4 AND id < 3 OR dead = 1;

-- /* normal join with equality */
SELECT pet.id, pet.name, pet.age, pet.dead
    FROM pet, person_pet, person
    WHERE
    pet.id = person_pet.pet_id AND
    person_pet.person_id = person.id AND
    person.first_name = 'Zed';

/* using a sub-select */
SELECT pet.id, pet.name, pet.age, pet.dead
    FROM pet
    WHERE pet.id IN
    (
      SELECT pet_id FROM person_pet, person
      WHERE person_pet.person_id = person.id
      AND person.first_name = 'Zed'
    );

SELECT pet.id, pet.name, pet.age, pet.dead
    FROM pet
    WHERE pet.id IN
    (
      SELECT pet_id FROM person_pet, person
      WHERE person_pet.person_id = person.id
      AND person.first_name = 'Matt'
    );

SELECT pet.id, pet.name, pet.age, pet.dead
  FROM pet
  WHERE pet.id IN
  (
    SELECT pet_id FROM person_pet, person
    WHERE person_pet.person_id = person.id
    AND person.first_name = "Kurt"
  );

SELECT pet.id, pet.name, pet.age, pet.dead
    FROM pet
    WHERE pet.id IN
    (
      SELECT pet_id FROM person_pet, person
      WHERE person_pet.person_id = person.id
      AND person.id = 1
    );

SELECT pet.id, pet.name, pet.age, pet.dead
  FROM pet
  WHERE pet.id IN
  (
    SELECT pet_id FROM person_pet, person
    WHERE person_pet.person_id = person.id
    AND person.id = 2
  );

/* make sure there's dead pets */
SELECT name, age FROM pet WHERE dead = 1;

/* delete the dead robot pet */
DELETE FROM pet WHERE dead = 1 AND name != "Bertrand";

/*make sure the robot is gone */
SELECT * FROM pet;

/* let's ressurect the robot */
INSERT INTO pet VALUES (1, 'Gigantor', 'Robot', 1, 0);


/* the robot LIVES! */
SELECT * FROM pet;
