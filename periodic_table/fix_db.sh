#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t -c"
ONE=$($PSQL "ALTER TABLE properties RENAME weight TO atomic_mass")
TWO=$($PSQL "ALTER TABLE properties RENAME melting_point TO melting_point_celsius")
THREE=$($PSQL "ALTER TABLE properties RENAME boiling_point TO boiling_point_celsius")
FOUR=$($PSQL "ALTER TABLE properties ALTER COLUMN melting_point_celsius SET NOT NULL")
FOUR=$($PSQL "ALTER TABLE properties ALTER COLUMN boiling_point_celsius SET NOT NULL")

FIVE=$($PSQL "ALTER TABLE elements ADD CONSTRAINT symbol_unique UNIQUE(symbol)")
FIVE=$($PSQL "ALTER TABLE elements ADD CONSTRAINT name_unique UNIQUE(name)")
SIX=$($PSQL "ALTER TABLE elements ALTER COLUMN symbol SET NOT NULL")
SIX=$($PSQL "ALTER TABLE elements ALTER COLUMN name SET NOT NULL")

SEVEN=$($PSQL "ALTER TABLE properties ADD FOREIGN KEY(atomic_number) REFERENCES elements(atomic_number) ON DELETE CASCADE")

EIGHT=$($PSQL "CREATE TABLE types()")
NINE=$($PSQL "ALTER TABLE types ADD COLUMN type_id SERIAL PRIMARY KEY")
TEN=$($PSQL "ALTER TABLE types ADD COLUMN type VARCHAR(40) NOT NULL")
# ELEVEN=$($PSQL "INSERT INTO types(type) VALUES('metal'),('metalloid'),('nonmetal')")

TWELVE=$($PSQL "ALTER TABLE properties ADD COLUMN type_id INT REFERENCES types(type_id)")
TWELVE=$($PSQL "UPDATE properties SET type_id=types.type_id FROM types WHERE properties.type = types.type")
TWELVE=$($PSQL "ALTER TABLE properties ALTER COLUMN type_id SET NOT NULL")

THIRTEEN=$($PSQL "UPDATE elements SET symbol = INITCAP(symbol)")
FOURTEEN=$($PSQL "ALTER TABLE properties ALTER COLUMN atomic_mass TYPE DECIMAL")
FOURTEEN=$($PSQL "UPDATE properties SET atomic_mass=trim(trailing '00' FROM atomic_mass::TEXT)::DECIMAL")

FIVETEEN=$($PSQL "INSERT INTO elements VALUES(9, 'F', 'Fluorine'),(10, 'Ne', 'Neon')")
FIVETEEN=$($PSQL "INSERT INTO properties VALUES(9, 18.998, -220, -188.1, 3),(10, 20.18, -248.6, -246.1, 3)")

SIXTEEN=$($PSQL "DELETE FROM elements WHERE atomic_number=1000")
SIXTEEN=$($PSQL "DELETE FROM properties WHERE atomic_number=1000")
SIXTEEN=$($PSQL "ALTER TABLE properties DROP COLUMN type")

