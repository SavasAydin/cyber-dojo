-module(number_names).

-export([spell_out/1]).

spell_out(0) ->
    "zero";
spell_out(Number) when Number > 0 andalso 
		       Number < 10  ->
    get_natural_number_name(Number);
spell_out(10) ->
    "ten";
spell_out(Number) when Number > 10 andalso
		       Number < 20 ->
    get_irregular_number_name(Number);
spell_out(20) ->
    "twenty";
spell_out(Number) when Number > 20 andalso
		       Number < 30 ->
    spell_out(20) ++ " " ++ spell_out(Number-20);
spell_out(30) ->
    "thirty";
spell_out(Number) when Number > 30 andalso
			Number < 40 ->
    spell_out(30) ++ " " ++ spell_out(Number-30).
					   
get_natural_number_name(Number) ->
    lists:nth(Number+1,first_nine_natural_number_names()).

first_nine_natural_number_names() ->
    ["zero","one","two","three","four","five","six","seven","eight","nine"].

get_irregular_number_name(Number) ->
    lists:nth(Number rem 10,irregular_number_names()).

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

