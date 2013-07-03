-module(number_names).

-export([spell_out/1]).

spell_out(0) ->
    "zero";
spell_out(1) ->
    "one";
spell_out(2) ->
    "two".


