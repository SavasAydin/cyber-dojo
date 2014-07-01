-module(bowling).

-export([score/1,
	 parse_line/1,
	 calculate_points/1]).

score(Line) ->
    Parsed = parse_line(Line),
    Points = calculate_points(Parsed),
    lists:sum(Points).
    
parse_line(Line) ->
    Tokens = string:tokens(Line,"|"),
    lists:map(fun parse_frame/1,Tokens).

parse_frame(Frame) ->
    lists:map(fun translate_ball/1, Frame).

translate_ball($-) ->
    miss;
translate_ball($X) ->
    strike;
translate_ball($/) ->
    spare;
translate_ball(X) ->
    list_to_integer([X]).
	  
calculate_points([]) ->
    [];
calculate_points([[_,spare],Next|Frames]) when Frames /= [] ->
    NextBall = get_next_ball([Next|Frames]),
    [get_points([spare|NextBall]) | calculate_points([Next|Frames])];
calculate_points([[_,spare],Bonus])  ->
    [get_points([spare]) | calculate_points([Bonus])];
calculate_points([[strike],Next|Frames]) when Frames /= [] ->
    NextTwo = get_next_two_balls([Next|Frames]),
    [get_points([strike|NextTwo])  | calculate_points([Next|Frames])];
calculate_points([[strike],Bonus])  ->
    [get_points([strike]) | calculate_points([Bonus])];
calculate_points([Frame|Frames]) ->
    [get_points(Frame) | calculate_points(Frames)].

get_points(Frame) ->
    Points = [get_point(X) || X<-Frame],
    lists:sum(Points).

get_point(miss) ->
    0;
get_point(strike) ->
    10;
get_point(spare) ->
    10;
get_point(X) ->
    X.

get_next_two_balls([[strike]|Frames]) ->
    [strike | get_next_ball(Frames)];
get_next_two_balls([[_,spare]|_]) ->
    [spare];
get_next_two_balls([[A,B]|_]) ->
    [A,B].

get_next_ball([[A]|_]) ->
    [A];
get_next_ball([[A,_]|_]) ->
    [A].
