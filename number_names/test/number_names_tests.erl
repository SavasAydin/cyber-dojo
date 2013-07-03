-module(number_names_tests).

-include_lib("eunit/include/eunit.hrl").


spell_out_a_number_test_() ->
    
    [assert_number("zero", 0),
     assert_number("one", 1),
     assert_number("two", 2),
     assert_number("three", 3),
     assert_number("four", 4),
     assert_number("five", 5),
     assert_number("six", 6),
     assert_number("seven", 7),
     assert_number("eight", 8),
     assert_number("nine", 9),
     assert_number("ten", 10),
     assert_number("eleven", 11),
     assert_number("twelve", 12),
     assert_number("thirteen", 13),
     assert_number("fourteen", 14),
     assert_number("fifteen", 15),
     assert_number("sixteen", 16),
     assert_number("seventeen", 17),
     assert_number("eighteen", 18),
     assert_number("nineteen", 19),
     assert_number("twenty", 20),
     assert_number("twenty one", 21),
     assert_number("twenty six", 26),
     assert_number("thirty", 30),
     assert_number("thirty two", 32),
     assert_number("thirty seven", 37),
     assert_number("forty", 40)

    ].

assert_number(NumberName, Number) ->
    ?_assertEqual(NumberName, number_names:spell_out(Number)).



