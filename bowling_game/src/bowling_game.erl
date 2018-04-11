-module(bowling_game).
-export([score/1]).

score(Frames) ->
    Tokens = parse_frames(Frames),
    Hits = to_hits(Tokens),
    calculate(Hits, 0).

parse_frames(Frames) ->
    lists:flatten(string:tokens(Frames, "|")).

to_hits(Tokens) ->
    [to_hit(Ball) || Ball <- Tokens].

to_hit($-) ->
    0;
to_hit($X) ->
    $X;
to_hit($/) ->
    $/;
to_hit(Ball) ->
    list_to_integer([Ball]).

calculate([], Score) ->
    Score;
calculate([$X | Balls], Score) ->
    Extra = get_next_two(Balls),
    calculate(Balls, Score+10+Extra);
calculate([_, $/ | Balls], Score) ->
    Extra = get_next(Balls),
    calculate(Balls, Score+10+Extra);
calculate([Ball | Balls], Score) ->
    calculate(Balls, Score+Ball).

get_next([H|_]) ->
    points(H).

get_next_two([_, $/ | _]) ->
    10;
get_next_two([F, S | _]) ->
    points(F) + points(S).

points($X) ->
    10;
points(X) ->
    X.
