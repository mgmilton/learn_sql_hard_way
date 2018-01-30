
ALTER TABLE person ADD COLUMN dead INTEGER;
ALTER TABLE person ADD COLUMN phone_number TEXT;
ALTER TABLE person ADD COLUMN salary FLOAT;
ALTER TABLE person ADD COLUMN dob DATETIME;
ALTER TABLE pet ADD COLUMN dob DATETIME;
ALTER TABLE person_pet ADD COLUMN purchased_on DATETIME;
ALTER TABLE pet ADD COLUMN parent INTEGER;
INSERT INTO person VALUES
  (3, "Joe","Jobes", 68, 0, 50.00, '1949-11-20 03:00:00', '555-0313');


/*Update the existing database records with the new column data using UPDATE statements. Don't forget about the purchased_on column in person_pet relation table to indicate when that person bought the pet.*/

UPDATE person SET
  dead = 0,
  phone_number = (
  CASE
      WHEN person.id = 0 THEN "555-0000"
      WHEN person.id = 1 THEN "555-0001"
      WHEN person.id = 2 THEN "555-0002"
      ELSE "missing"
  END ),
  salary = (
  CASE
    WHEN person.id <= 1 THEN 60000.00
    WHEN person.id > 1 THEN 8000.00
    ELSE 0
  END ),
  dob = '1988-01-01 03:00:00';

UPDATE pet SET parent = 0 WHERE id=0;
UPDATE pet SET parent = 1 WHERE id!=0;

UPDATE person_pet
  SET purchased_on = (
  CASE
    WHEN person_pet.person_id >= 0 AND
         person_pet.person_id <= 4 THEN '1999-02-01 05:00:00'
    WHEN person_pet.person_id = 5 OR
         person_pet.person_id = 6 THEN '2000-02-02 03:04:00'
    WHEN person_pet.person_id = 7 THEN '2015-03-31 01:01:22'
    ELSE 0
  END);

/*Add 4 more people and 5 more pets and assign their ownership and what pet's are parents. On this last part remember that you get the id of the parent, then set it in the parent column.*/

INSERT INTO person
(id, first_name, last_name, age, dead, salary, dob, phone_number)
VALUES
    (4, 'Milan', 'Kundera', 88, 0, 1000.00, '1929-04-01 04:00:01', '545-5454'),
    (5, 'Flannery', 'O''Connor', 39, 1, 0.00, '1925-03-25 05:00:01', '123-4567'),
    (7, 'Ernest', 'Hemmingway', 61, 1, 0.00, '1899-07-21 03:00:03', '333-4324'),
    (8, 'Elizabeth', 'Blackburn', 69, 0, 99999.00, '1948-11-26 01:00:00', '333-3111');

INSERT INTO pet
(id, name, breed, age, dead, parent)
VALUES
    (4, 'Rufus', 'Bull Mastif', 3, 0, 4),
    (5, 'Saul', 'Peacock', 333, 0, 5),
    (6, 'Francis', 'Cat', 49, 1, 7),
    (7, 'Telomere', 'Koala', 800, 0, 8),
    (8, 'Evelyn', 'Samoyed', 1, 0, 2);

/*Write a query that can find all the names of pets and their owners bought after 2004. Key to this is to map the person_pet based on the purchased_on column to the pet and parent.*/
SELECT pet.name, person.first_name
  FROM pet, person, person_pet
  WHERE
  person_pet.purchased_on > '2004-01-01' AND
  pet.id = person_pet.pet_id AND
  person.id = person_pet.person_id;

/*Write a query that can find the pets that are children of a given pet. Again look at the pet.parent to do this. It's actually easy so don't over think it.*/
SELECT pet.name
  FROM pet
  WHERE
  pet.parent = 0;
