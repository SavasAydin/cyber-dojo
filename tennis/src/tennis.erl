-module(tennis).

-export([score/2
	]).


score(FirstPlayer, SecondPlayer) when (FirstPlayer+SecondPlayer) >= 4 andalso
				      (SecondPlayer-FirstPlayer) > 1 ->
    {"win", "second_player"};
score(FirstPlayer, SecondPlayer) when (FirstPlayer+SecondPlayer) >= 4 andalso
				      (FirstPlayer-SecondPlayer) > 1 ->
    {"win", "first_player"};
score(FirstPlayer, SecondPlayer) when (FirstPlayer+SecondPlayer) >= 6 andalso
				      (FirstPlayer-SecondPlayer) == 1 ->
    {"advantage", "first_player"};
score(FirstPlayer, SecondPlayer) when (FirstPlayer+SecondPlayer) >= 6 andalso
				      (SecondPlayer-FirstPlayer) == 1 ->
    {"advantage", "second_player"};
score(FirstPlayer, SecondPlayer) when (FirstPlayer+SecondPlayer) >= 6 andalso
				      FirstPlayer == SecondPlayer ->
    "deuce";
score(FirstPlayer, SecondPlayer) ->
    {get_point_name(FirstPlayer), get_point_name(SecondPlayer)}.
    
get_point_name(Number) ->
    lists:nth(Number+1, ["love", "fifteen", "thirty", "forty"]).

is_player_leading(Player, Opponent) ->
    Player > Opponent. 
