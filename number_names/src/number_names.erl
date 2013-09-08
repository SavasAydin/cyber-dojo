-module(number_names).

-export([spell_out/1]).

-define(WHITESPACE, " ").
-define(AND, " and ").
-define(HUNDRED, " hundred").
-define(THOUSAND, " thousand").
-define(COMMA, ", ").

spell_out(Number) when Number < 10  ->
    lists:nth(Number+1,first_nine_natural_number_names());
spell_out(Number) when Number > 10 andalso
		       Number < 20 ->
    lists:nth(Number rem 10,irregular_number_names());
spell_out(Number) when Number < 100 ->
    case Number rem 10 == 0 of
	true ->
	    lists:nth(Number div 10, tens());
	false ->
	    LowerTen = get_lower_base_limit(Number, 10),
	    spell_out(LowerTen) ++ ?WHITESPACE ++ spell_out(Number-LowerTen)
    end;
spell_out(Number) when Number < 1000 ->
    case Number rem 100 == 0 of
	true ->
	    spell_out(Number div 100) ++ ?HUNDRED;
	false ->
	    LowerHundred = get_lower_base_limit(Number, 100),
	    spell_out(LowerHundred) ++ ?AND ++ spell_out(Number-LowerHundred) 
    end;
spell_out(Number) when Number < 1000000 ->
    case Number rem 1000 == 0 of
	true ->
	    spell_out(Number div 1000) ++ ?THOUSAND;
	false ->
	    LowerThousand = get_lower_base_limit(Number, 1000),
	    spell_out(LowerThousand) ++ ?COMMA ++ spell_out(Number-LowerThousand) 
    end.

get_lower_base_limit(Number, Base) ->
    (Number div Base) * Base.

first_nine_natural_number_names() ->
    ["zero","one","two","three","four","five","six","seven","eight","nine"].

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

