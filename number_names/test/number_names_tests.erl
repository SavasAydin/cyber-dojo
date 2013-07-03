-module(number_names_tests).

-include_lib("eunit/include/eunit.hrl").


spell_out_number_zero_test() ->
    ?assertEqual("zero", number_names:spell_out(0)).

