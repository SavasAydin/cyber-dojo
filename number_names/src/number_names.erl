-module(number_names).

-export([spell_out/1]).



spell_out(Number) ->
    get_number_name(Number).

get_number_name(Number) ->
    proplists:get_value(Number, number_names()).

number_names() ->
    [{0, "zero"},
     {1, "one"},
     {2, "two"}
    ].

