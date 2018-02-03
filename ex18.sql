/* select the average age of every person */
SELECT avg(age) FROM person;

/* select the average age of every pet */
SELECT avg(age) FROM pet;

/* select the average age of every breed by dead or alive */
SELECT breed, dead, avg(age) FROM pet GROUP BY breed, dead;

SELECT sum(age) FROM person;

SELECT sum(age) FROM pet;

SELECT breed, sum(dead), sum(age) FROM pet WHERE dead = 1 GROUP BY BREED, DEAD;

SELECT min(age), max(age) FROM person;

SELECT min(age), max(age) FROM pet;

SELECT breed, dead, min(age), max(age) FROM pet
    WHERE age > 0
    GROUP BY breed, dead;

SELECT first_name, last_name, min(dob), max(age) FROM person
  WHERE age > 0
  GROUP BY first_name, age;
