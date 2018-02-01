/* everyone who is older than 10 */
SELECT * FROM person
    WHERE dob < date('now', '-10 years') ORDER BY dob;

/* everyone born before 1970 */
SELECT * FROM person
    WHERE DOB < date('1970-01-01') ORDER BY dob;

/* all pets purchased this year */
SELECT * FROM person_pet
    WHERE purchased_on > date('now', 'start of year')
    ORDER BY purchased_on;

/* all pets purchased between 1990 and 2000 */
SELECT * FROM person_pet
    WHERE purchased_on > date('1990-01-01') and purchased_on < date('2000-01-01')
    ORDER BY purchased_on;

/* link the pets from the last query */

SELECT pet.name, pet.breed, pet.age, pet.dead, person_pet.purchased_on
    FROM pet, person_pet
    WHERE
    purchased_on > date('1990-01-01') AND
    purchased_on < date('2000-01-01') AND
    person_pet.pet_id = pet.id
    ORDER BY purchased_on, pet.age;
