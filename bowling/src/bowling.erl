-module(bowling).

-export([score/1]).
	
score(Line) ->	
    Frames = get_frames(Line),
    Concatenated = concatenate(Frames),
    Balls = get_balls(Concatenated),
    Scores = calculate(Balls),
    lists:sum(Scores).

get_frames(Line) ->
    string:tokens(Line,"|").

concatenate([]) ->
    "";
concatenate([Frame|T]) ->
    Frame ++ concatenate(T).

get_balls([]) ->
    [];
get_balls([$X|T]) ->
    [{strike,10}|get_balls(T)];
get_balls([F,$/|T]) ->
    [{list_to_integer([F]),spare}|get_balls(T)];
get_balls([Ball|T]) ->
    [list_to_integer([Ball])|get_balls(T)].

calculate([{strike,_}|T]) ->
    [10 + next_two_balls(T) | calculate(T)];
calculate([{_,spare}|T]) ->
    [10 + next_ball(T) | calculate(T)];
calculate(A) ->
    A.

next_two_balls([{strike,10},S|_]) ->
    10+S;    
next_two_balls([{_,spare}|_]) ->
    10;
next_two_balls([F,S|_]) ->
    F+S.

next_ball([{strike,_}|_]) ->
    10;
next_ball([{F,spare}|_]) ->
    F;
next_ball([F|_])->
    F.
