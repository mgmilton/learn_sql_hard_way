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
