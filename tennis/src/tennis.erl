-module(tennis).

-export([score/2
	]).

score(FirstPlayer, SecondPlayer) when FirstPlayer >= 3 andalso 
				      SecondPlayer >= 3 andalso
				      FirstPlayer > SecondPlayer ->
    "advantage";
score(FirstPlayer, SecondPlayer) when FirstPlayer >= 3 andalso 
				      SecondPlayer >= 3 andalso
				      FirstPlayer < SecondPlayer ->
    "advantage";
score(FirstPlayer, SecondPlayer) when FirstPlayer >= 3 andalso 
				      SecondPlayer >= 3 andalso
				      FirstPlayer == SecondPlayer ->
    "deuce";
score(FirstPlayer, SecondPlayer) ->
    {get_point_name(FirstPlayer), get_point_name(SecondPlayer)}.
    
get_point_name(Number) ->
    lists:nth(Number+1, ["love", "fifteen", "thirty", "forty"]).
