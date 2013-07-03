-module(number_names_tests).

-include_lib("eunit/include/eunit.hrl").


spell_out_a_number_test_() ->
    
    [assert_number("zero", 0),
     assert_number("one", 1),
     assert_number("two", 2)
    ].

assert_number(NumberName, Number) ->
    ?_assertEqual(NumberName, number_names:spell_out(Number)).



