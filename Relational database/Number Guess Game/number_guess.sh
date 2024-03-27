#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"


echo "Enter your username:"
read USERNAME

ADD_USER(){
    INSERT_USER=$($PSQL "insert into users(name) values ('$USERNAME')")
}

ADD_GAME(){
    USER_ID=$($PSQL "select user_id from users where name='$USERNAME'")
    ADD_GAME=$($PSQL "insert into games(user_id,attempts) values ($USER_ID,$number_of_guesses)")
}

GAME(){
    NUMBER=$(($RANDOM%1000 + 1 ))
    number_of_guesses=0
    echo "Guess the secret number between 1 and 1000:"
    
    while [[ $GUESS -ne $NUMBER ]]
    do
        read GUESS
        if [[ ! $GUESS =~ ^[0-9]+$ ]]
        then
            echo "That is not an integer, guess again:"
            continue
        elif ((  $GUESS < $NUMBER ))
        then
            echo "It's higher than that, guess again:"
            
        elif ((  $GUESS > $NUMBER ))
        then
            echo "It's lower than that, guess again:"
            
        fi
        # execute only if integer guess
        ((number_of_guesses++))
    done
    
    ADD_GAME
    echo -e "\nYou guessed it in $number_of_guesses tries. The secret number was $NUMBER. Nice job!"
    
    
}


check_user=$($PSQL "select * from users where name='$USERNAME'")

if [[ -z $check_user ]]
then
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
    ADD_USER
    
else
    USER_ID=$($PSQL "select user_id from users where name='$USERNAME'")
    games_played=$($PSQL "select count(*) from games where user_id=$USER_ID")
    best_game=$($PSQL "select min(attempts) from games where user_id=$USER_ID")
    echo -e "\nWelcome back, $USERNAME! You have played $games_played games, and your best game took $best_game guesses."
    
fi


GAME