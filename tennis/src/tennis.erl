-module(tennis).

-export([score/2
	]).


score(FirstPlayer, SecondPlayer) when (FirstPlayer+SecondPlayer) >= 4 andalso
				      abs(FirstPlayer-SecondPlayer) > 1 ->
    {"win", who_is_in_the_lead(FirstPlayer, SecondPlayer)};
score(FirstPlayer, SecondPlayer) when (FirstPlayer+SecondPlayer) >= 6 andalso
				      abs(FirstPlayer-SecondPlayer) == 1 ->
    {"advantage", who_is_in_the_lead(FirstPlayer, SecondPlayer)};
score(FirstPlayer, SecondPlayer) when (FirstPlayer+SecondPlayer) >= 6 andalso
				      FirstPlayer == SecondPlayer ->
    "deuce";
score(FirstPlayer, SecondPlayer) ->
    {get_point_name(FirstPlayer), get_point_name(SecondPlayer)}.
    
get_point_name(Number) ->
    lists:nth(Number+1, ["love", "fifteen", "thirty", "forty"]).

who_is_in_the_lead(A,B) when A>B->
    "first_player";
who_is_in_the_lead(_,_) ->
    "second_player".
