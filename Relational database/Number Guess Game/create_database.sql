drop database if exists number_guess;
create database number_guess;

\c number_guess

create table users(
  user_id serial primary key,
  name varchar(30) not null unique
);

create table games(
  game_id serial primary key,
  user_id int references users(user_id) not null,
  attempts int not null
);

-- select statements for debugging
select user_id,count(*) as number_of_games,min(attempts) best_game from games group by user_id;