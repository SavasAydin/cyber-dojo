-module(number_names).

-export([spell_out/1]).

-define(WHITESPACE, " ").
-define(AND, " and ").

spell_out(0) ->
    "zero";
spell_out(Number) when Number < 10  ->
    lists:nth(Number,first_nine_natural_number_names());
spell_out(Number) when Number > 10 andalso
		       Number < 20 ->
    lists:nth(Number rem 10,irregular_number_names());
spell_out(Number) when Number < 100 ->
    case Number rem 10 == 0 of
	true ->
	    lists:nth(Number div 10, tens());
	false ->
	    LowerLimit = get_lower_ten_limit(Number),
	    spell_out(LowerLimit) ++ " " ++ spell_out(Number-LowerLimit)
    end;
spell_out(Number) when Number < 1000 ->
    case Number rem 100 == 0 of
	true ->
	    spell_out(Number div 100) ++ " hundred";
	false ->
	    LowerHundred = get_lower_hundred_limit(Number),
	    spell_out(LowerHundred) ++ " and " ++ spell_out(Number-LowerHundred) 
    end;
spell_out(Number) ->
    case Number rem 1000 == 0 of
	true ->
	    spell_out(Number div 1000) ++ " thousand";
	false ->
	    LowerThousand = get_lower_thousand_limit(Number),
	    spell_out(LowerThousand) ++ " " ++ spell_out(Number-LowerThousand) 
    end.

get_lower_ten_limit(Number) ->
    (Number div 10) * 10.

get_lower_hundred_limit(Number) ->
    (Number div 100) * 100.

get_lower_thousand_limit(Number) ->
    (Number div 1000) * 1000.

first_nine_natural_number_names() ->
    ["one","two","three","four","five","six","seven","eight","nine"].

tens() ->    
    ["ten","twenty","thirty","forty","fifty","sixty","seventy","eighty","ninety"].

irregular_number_names() ->
    ["eleven",
     "twelve",
     "thirteen",
     "fourteen",
     "fifteen",
     "sixteen",
     "seventeen",
     "eighteen",
     "nineteen"
    ].

