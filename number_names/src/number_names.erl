-module(number_names).

-export([spell_out/1]).

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
	    GreatestTen = get_greatest_limit(Number, 10),
	    spell_out(GreatestTen) ++ " " ++ spell_out(Number-GreatestTen)
    end;
spell_out(Number) when Number < 1000000 ->
    LowerBase = get_lower_base_of_(Number),
    case Number rem LowerBase == 0 of
	true -> 
	    spell_out(Number div LowerBase) ++ get_lower_base_name(LowerBase);
	false ->
	    GreatestLimit = get_greatest_limit(Number, LowerBase),
	    spell_out(GreatestLimit) ++ 
		get_lower_base_conjuction(LowerBase) ++ 
		spell_out(Number-GreatestLimit) 
    end.

get_lower_base_of_(Number) ->
    F = fun(X) -> lists:filter(fun({L,U}) -> X>=L andalso X<U end,
			       [{100,1000},{1000,1000000}])
	end,
    [{LowerBase,_}] = F(Number),
    LowerBase.
    
get_lower_base_name(100) ->
    " hundred";
get_lower_base_name(1000) ->
    " thousand".

get_lower_base_conjuction(100) ->
    " and ";
get_lower_base_conjuction(1000) ->
    ", ".

get_greatest_limit(Number, Base) ->
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

