#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
if [[ $# -eq 0  ]]
then
  echo "Please provide an element as an argument."
elif [[ $1 =~ ^[0-9]+$ ]]
then
  ATOMIC_NUMBER=$1
  ELEMENT=$($PSQL "SELECT type, atomic_mass, melting_point_celsius, boiling_point_celsius, symbol, name FROM properties LEFT JOIN elements ON properties.atomic_number = elements.atomic_number LEFT JOIN types ON properties.type_id = types.type_id WHERE properties.atomic_number = $1")
  if [[ -z $ELEMENT ]]
  then
    echo "I could not find that element in the database."
  else
    echo -e "$ELEMENT" | while IFS="|" read TYPE MASS MELTING_POINT BOILING_PONT SYMBOL NAME
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_PONT celsius."
    done
  fi
elif [[ $1  =~ ^[A-Z][a-z]?$ ]]
then
  SYMBOL=$1
  ELEMENT=$($PSQL "SELECT properties.atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius, name FROM properties LEFT JOIN elements ON properties.atomic_number = elements.atomic_number LEFT JOIN types ON properties.type_id = types.type_id WHERE symbol = '$1' ")
  if [[ -z $ELEMENT ]]
  then
    echo "I could not find that element in the database."
  else
    echo -e "$ELEMENT" | while IFS="|" read ATOMIC_NUMBER TYPE MASS MELTING_POINT BOILING_PONT NAME
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_PONT celsius."
    done
  fi
else
  NAME=$1
  ELEMENT=$($PSQL "SELECT properties.atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius, symbol FROM properties LEFT JOIN elements ON properties.atomic_number = elements.atomic_number LEFT JOIN types ON properties.type_id = types.type_id WHERE name = '$1' ")
  if [[ -z $ELEMENT ]]
  then
    echo "I could not find that element in the database."
  else
    echo -e "$ELEMENT" | while IFS="|" read ATOMIC_NUMBER TYPE MASS MELTING_POINT BOILING_PONT SYMBOL
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_PONT celsius."
    done
  fi
fi



