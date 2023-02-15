#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"

read USERNAME

USER=$($PSQL "SELECT username FROM info WHERE username = '$USERNAME'")
GAMES_PLAYED=$($PSQL "SELECT games_played FROM info WHERE username = '$USERNAME'")
BEST_GAME=$($PSQL "SELECT best_game FROM info WHERE username = '$USERNAME'")

if [[ -z $USER ]]
then
  NEW_PLAYER=$($PSQL "INSERT INTO info(username) VALUES('$USERNAME')")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

NUMBER_TO_GUESS=$(( (RANDOM % 1000) + 1 ))

echo "Guess the secret number between 1 and 1000:"

read NUMBER_GUESSED

TRIES=1

while [[ $NUMBER_GUESSED -ne $NUMBER_TO_GUESS ]]
do
  if [[ $NUMBER_GUESSED =~ ^[0-9]+$ ]]
  then
    if [[ $NUMBER_GUESSED -lt $NUMBER_TO_GUESS ]]
    then
      echo "It's lower than that, guess again:"
    else
      echo "It's higher than that, guess again:"
    fi
  TRIES=$((TRIES+=1))
  else
    echo "That is not an integer, guess again:"
  fi
  read NUMBER_GUESSED
done

echo "You guessed it in $TRIES tries. The secret number was $NUMBER_TO_GUESS. Nice job!"

BEST_GAME=$($PSQL "SELECT best_game FROM info WHERE username = '$USERNAME'")
GAMES_PLAYED=$($PSQL "SELECT games_played FROM info WHERE username = '$USERNAME'")

if [[ -z $BEST_GAME ]]
then
  NEW_BEST_GAME=$(($TRIES))
  INS_BG=$($PSQL "UPDATE info SET best_game = $NEW_BEST_GAME WHERE username = '$USERNAME'")
else
  if [[ $TRIES -lt $BEST_GAME ]]
  then
    INS_BG=$($PSQL "UPDATE info SET best_game = $TRIES WHERE username = '$USERNAME'")
  fi
fi

GAMES_PLAYED=$(($GAMES_PLAYED+1))
INS_GP=$($PSQL "UPDATE info SET games_played = $GAMES_PLAYED WHERE username = '$USERNAME'")
