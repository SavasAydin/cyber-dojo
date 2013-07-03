-module(number_names_tests).

-include_lib("eunit/include/eunit.hrl").


spell_out_number_zero_test() ->
    ?assertEqual("zero", number_names:spell_out(0)).

spell_out_number_one_test() ->
    ?assertEqual("one", number_names:spell_out(1)).

spell_out_number_two_test() ->
    ?assertEqual("two", number_names:spell_out(2)).


