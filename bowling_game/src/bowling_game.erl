-module(bowling_game).
-export([score/1]).

score(Frames) ->
    Hits = parse_frames(Frames),
    calculate(Hits).

parse_frames(Frames) ->
    Tokens = string:tokens(Frames, "|"),
    to_hits(Tokens, []).

to_hits([], Res) ->
    lists:reverse(Res);
to_hits([H | T], Acc) ->
    Hit = [ convert(Ball) || Ball <- H],
    to_hits(T, [Hit | Acc]).

convert($-) ->
    0;
convert(X) ->
    list_to_integer([X]).

calculate(Hits) ->
    lists:sum([ X+Y || [X, Y] <- Hits]).
