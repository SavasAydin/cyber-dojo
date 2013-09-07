-module(number_names_tests).
-include_lib("eunit/include/eunit.hrl").

spell_out_a_number_test_() ->
    lists:map(fun assert_number/1,
	      [{"zero", 0},
	       {"one", 1},
	       {"two", 2},
	       {"three", 3},
	       {"four", 4},
	       {"five", 5},
	       {"six", 6},
	       {"seven", 7},
	       {"eight", 8},
	       {"nine", 9},
	       {"ten", 10},
	       {"eleven", 11},
	       {"twelve", 12},
	       {"thirteen", 13},
	       {"fourteen", 14},
	       {"fifteen", 15},
	       {"sixteen", 16},
	       {"seventeen", 17},
	       {"eighteen", 18},
	       {"nineteen", 19},
	       {"twenty", 20},
	       {"twenty one", 21},
	       {"twenty six", 26},
	       {"thirty", 30},
	       {"thirty two", 32},
	       {"thirty seven", 37},
	       {"forty", 40},
	       {"forty three", 43},
	       {"fifty", 50},
	       {"fifty five", 55},
	       {"sixty", 60},
	       {"seventy one", 71},
	       {"eighty eight", 88},
	       {"ninety nine", 99}
	      ]).

assert_number({NumberName, Number}) ->
    fun() ->
	    ?assertEqual(NumberName, number_names:spell_out(Number))
    end.



