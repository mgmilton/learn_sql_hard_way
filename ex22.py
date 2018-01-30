import sqlite3
conn = sqlite3.connect('thw.db')

cursor = conn.cursor()

cursor.execute("""
select * from person, person_pet, pet 
    where person.id = person_pet.person_id and pet.id = person_pet.pet_id;
""")

for row in cursor:
    print row

conn.close()

