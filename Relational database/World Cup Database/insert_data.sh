#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

print(){
  echo "Inserted into teams, $1"
}


get_team_id(){
  local team="$1"
  #get team id
  team_id=$($PSQL "SELECT team_id FROM teams WHERE name='$team'")

  #if not found
  if [[ -z $team_id ]]
  then
    # insert team
    INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$team')")
    # get new team_id
    team_id=$($PSQL "SELECT team_id FROM teams WHERE name='$team'")
  fi
  echo $team_id
}

echo $($PSQL "TRUNCATE table teams,games")

cat games.csv | while IFS=',' read  year round winner opponent winner_goals opponent_goals
do
  if [[ $year != "year" ]]
  then
    winner_id=$(get_team_id "$winner")
    opponent_id=$(get_team_id "$opponent")
    INSERT_GAMES_RESULT=$($PSQL "INSERT INTO games (year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($year,'$round', $winner_id,$opponent_id,$winner_goals,$opponent_goals)")
   
    if [[ $INSERT_GAMES_RESULT == "INSERT 0 1" ]]
    then
      print "Inserted into games, $year,'$round', $winner,$opponent,$winner_goals, $opponent_goals"
    fi

  fi


done
