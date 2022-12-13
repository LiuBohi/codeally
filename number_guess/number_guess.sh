#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
TARGET=$(( RANDOM % 1000 + 1 ))
GAMES_PLAYED=0
BEST_GAME=''
echo Enter your username:
read USER_NAME
USER_ID=$($PSQL "SELECT user_id FROM users WHERE user_name='$USER_NAME' ")
if [[ -z $USER_ID  ]]
then
  ADD_USER_RESULT=$($PSQL "INSERT INTO users(user_name) VALUES('$USER_NAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE user_name='$USER_NAME' ")
  echo -e "Welcome, $USER_NAME! It looks like this is your first time here."
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE user_id=$USER_ID")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE user_id=$USER_ID")
  echo -e "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi
GET_GUESS() {
  echo $1
  read GUESS
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    GET_GUESS "That is not an integer, guess again:"
  fi
}

GET_GUESS "Guess the secret number between 1 and 1000:"
COUNT=0
RUN() {
  (( COUNT += 1 ))
  if [[ $GUESS -gt $TARGET ]]
  then
    GET_GUESS "It's lower than that, guess again:"
    RUN
  elif [[  $GUESS -lt $TARGET ]]
  then
    GET_GUESS "It's higher than that, guess again:"
    RUN
  else
    echo -e "You guessed it in $COUNT tries. The secret number was $TARGET. Nice job!"
  fi
}
RUN
(( GAMES_PLAYED += 1))
if [[ -z $BEST_GAME ]]
then
  UPDATE_RESULT=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$COUNT WHERE user_id=$USER_ID ")
elif [[ $COUNT -lt $BEST_GAME ]]
then
  UPDATE_RESULT=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$COUNT WHERE user_id=$USER_ID ")
else
  UPDATE_RESULT=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED WHERE user_id=$USER_ID")
fi

