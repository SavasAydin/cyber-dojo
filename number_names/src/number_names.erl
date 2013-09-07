-module(number_names).

-export([spell_out/1]).

spell_out(0) ->
    "zero";
spell_out(Number) when Number < 10  ->
    lists:nth(Number,first_nine_natural_number_names());
spell_out(Number) when Number > 10 andalso
		       Number < 20 ->
    lists:nth(Number rem 10,irregular_number_names());
spell_out(Number) when Number rem 10 == 0 ->
    lists:nth(Number div 10, tens());
spell_out(Number) when Number < 100 ->
    LowerLimit = get_lower_limit_of_(Number),
    spell_out(LowerLimit) ++ " " ++ spell_out(Number-LowerLimit).

get_lower_limit_of_(Number) ->
    Limits = [{20,30},{30,40},{40,50},{50,60},{60,70},{70,80},{80,90},{90,100}],
    F = fun(X) -> lists:filter(fun({Lower,Upper}) ->
				       X>Lower andalso X<Upper
			       end,
			       Limits)
	end,
    [{LowerLimit, _}] = F(Number),
    LowerLimit.
					  
first_nine_natural_number_names() ->
    ["one","two","three","four","five","six","seven","eight","nine"].

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

tens() ->    
    ["ten",
     "twenty",
     "thirty",
     "forty",
     "fifty",
     "sixty",
     "seventy",
     "eighty",
     "ninety"
    ].
