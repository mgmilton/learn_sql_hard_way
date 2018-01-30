SELECT * FROM person;
SELECT name, age FROM pet;
SELECT name, age FROM pet WHERE dead = 0;
SELECT * FROM person WHERE first_name != 'Zed';
SELECT * FROM pet WHERE age > 10;
SELECT * FROM person WHERE age < 27;
SELECT * FROM pet WHERE age < 10 AND name = "Roscoe";
SELECT * FROM pet WHERE age <= 4 AND id < 3 OR dead = 1;
