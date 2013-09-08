-module(number_names).

-export([spell_out/1]).

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
	    spell_tens(Number)
    end;
spell_out(Number) when Number < 1000 ->
    case Number rem 100 == 0 of
	true ->
	    spell_out(Number div 100) ++ " hundred";
	false ->
	    spell_hundreds(Number)
    end.

spell_tens(Number) ->
    TenLimits = [{20,30},{30,40},{40,50},{50,60},
		 {60,70},{70,80},{80,90},{90,100}],
    LowerLimit = get_lower_limit(Number, TenLimits),
    spell_out(LowerLimit) ++ " " ++ spell_out(Number-LowerLimit).

spell_hundreds(Number) ->
    HundredLimits = [{100,200},{200,300},{300,400},{400,500},{500,600},
		     {600,700},{700,800},{800,900},{900,1000}],
    LowerLimit = get_lower_limit(Number, HundredLimits),
    spell_out(LowerLimit) ++ " and " ++ spell_out(Number-LowerLimit).

get_lower_limit(Number, Limits) ->
    F = fun(X) -> 
		lists:filter(fun({Lower,Upper}) -> X>Lower andalso 
						       X<Upper end,
			     Limits)
	end,
    [{LowerLimit, _}] = F(Number),
    LowerLimit.
					  
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

