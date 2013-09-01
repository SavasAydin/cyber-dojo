-module(tennis).

-export([score/2
	]).
    
score(F,S) ->
    GameState = get_game_state(F,S),
    print_score_based_game_state(F,S,GameState).

print_score_based_game_state(F,S,GameState) ->
    case GameState of 
	"other" ->
	    {get_point_name(F), get_point_name(S)};
	"deuce" ->
	    GameState;
	_ ->
	    {GameState, who_is_in_the_lead(F,S)}
    end.

get_game_state(F,S) ->
    Funs = get_state_funs(),
    [{_,GameState}] = lists:filter(fun({Fun, _}) -> Fun(F,S) == true end, Funs),
    GameState.

get_state_funs() ->
    WinFun = fun(X,Y) -> (X>=4 orelse Y>=4) andalso abs(X-Y)>1 end,
    AdvantageFun = fun(X,Y) -> (X>=3 andalso Y>=3) andalso abs(X-Y)==1 end,
    DeuceFun = fun(X,Y) -> (X>=3 andalso Y>=3) andalso abs(X-Y)==0 end,
    OtherwiseFun = fun(X,Y) -> (X+Y<6 andalso abs(X-Y)<3) orelse (X+Y)<4 end,
    [{WinFun, "win"}, 
     {AdvantageFun, "advantage"}, 
     {DeuceFun, "deuce"}, 
     {OtherwiseFun, "other"}
    ].

get_point_name(Number) ->
    lists:nth(Number+1, ["love", "fifteen", "thirty", "forty"]).

who_is_in_the_lead(A,B) when A>B->
    "first_player";
who_is_in_the_lead(_,_) ->
    "second_player".
