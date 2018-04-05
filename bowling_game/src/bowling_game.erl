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

to_hit(Ball) ->
    try list_to_integer([Ball]) of
        Hit ->
            Hit
    catch
        _:_ ->
            Ball
    end.

calculate([], Score) ->
    Score;
calculate([_, $/, Next | Balls], Score) ->
    calculate([Next | Balls], Score+10+Next);
calculate([$- | Balls], Score) ->
    calculate(Balls, Score);
calculate([Ball | Balls], Score) ->
    calculate(Balls, Score+Ball).
