/* simple query to get a related table */
SELECT * FROM person, person_pet, pet
    where person.id = person_pet.person_id and pet.id = person_pet.pet_id;

/* add a basic count column and append the GROUP BY */
SELECT person.first_name, pet.breed, pet.dead, count(dead)
    from person, person_pet, pet
    where person.id = person_pet.person_id and pet.id = person_pet.pet_id
    group by pet.breed, pet.dead;


/* drop the person.first_name since that's not summarized */
SELECT pet.breed, pet.dead, count(dead)
    FROM person, person_pet, pet
    WHERE person.id = person_pet.person_id AND pet.id = person_pet.pet_id
    GROUP BY pet.breed, pet.dead;


/* Compare the counts to without the person_pet relation */
SELECT breed, dead, count(dead)
  FROM pet
  GROUP BY breed, dead;
