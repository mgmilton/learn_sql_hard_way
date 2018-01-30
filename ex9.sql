UPDATE person SET first_name = 'Hilarious Guy'
    WHERE first_name = 'Zed';

UPDATE pet SET name = 'Fancy Pants'
    WHERE id=0;

SELECT * FROM person;
SELECT * FROM pet;

UPDATE person SET first_name = 'Zed'
  WHERE person.id = 0;

INSERT INTO pet VALUES (4, "Peaches", "Terrier", 12, 1);

UPDATE pet SET dead = "DECEASED"
  WHERE pet.dead = 1;


SELECT * FROM person;
SELECT * FROM pet;
