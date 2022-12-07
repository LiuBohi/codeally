#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo "$($PSQL "TRUNCATE TABLE teams, games")"
echo "$($PSQL "ALTER SEQUENCE teams_team_id_seq RESTART WITH 1")"
echo "$($PSQL "ALTER SEQUENCE games_game_id_seq RESTART WITH 1")"
cat games.csv | while IFS=',' read YEAR ROUND ONE OTHER ONE_SCORE OTHER_SCORE
do
  if [[ $YEAR  != 'year' ]]
  then
    ONE_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$ONE' ")"
    if [[ -z $ONE_ID ]]
    then
      INSERT_RESULT="$($PSQL "INSERT INTO teams(name) VALUES ('$ONE')")"
      ONE_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$ONE' ")"
    fi
    OTHER_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$OTHER' ")"
    if [[ -z $OTHER_ID ]]
    then
      
      INSERT_RESULT="$($PSQL "INSERT INTO teams(name) VALUES ('$OTHER')")"
      OTHER_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$OTHER' ")"
    fi
    if [[ $ONE_SCORE > $OTHER_SCORE  ]]
    then
      WINNER_ID=$ONE_ID
      WINNER_GOALS=$ONE_SCORE
      OPPONENT_ID=$OTHER_ID
      OPPONENT_GOALS=$OTHER_SCORE
    else
      WINNER_ID=$OTHER_ID
      WENNER_GOALS=$OTHER_SCORE
      OPPONENT_ID=$ONE_ID
      OPPONENT_GOALS=$ONE_SCORE
    fi
    echo $ONE:$ONE_ID $OTHER:$OTHER_ID Winner_goals:$WINNER_GOALS Oppoent_goals:$OPPONENT_GOALS

    INSERT_RESULT="$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ('$YEAR', '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")"
  fi
done
