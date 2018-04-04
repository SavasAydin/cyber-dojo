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
to_hits([[X, $-] | T], Acc) ->
    Hit = {list_to_integer([X]), 0},
    to_hits(T, [Hit | Acc]);
to_hits([[$-, Y] | T], Acc) ->
    Hit = {0, list_to_integer([Y])},
    to_hits(T, [Hit | Acc]);
to_hits([[X, Y] | T], Acc) ->
    Hit = {list_to_integer([X]), list_to_integer([Y])},
    to_hits(T, [Hit | Acc]).

calculate(Hits) ->
    lists:sum([ X+Y || {X, Y} <- Hits]).
