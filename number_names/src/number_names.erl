-module(number_names).
-export([spell_out/1]).
-define(BASE_TEN, 10).

spell_out(Number) ->
    NumberNameFun = get_number_fun(Number),
    NumberName = NumberNameFun(Number),
    string:strip(NumberName).

get_number_fun(Number) ->
    proplists:get_value(is_irregular(Number), number_name_funs()).
			 
is_irregular(Number) ->
    none =/= proplists:lookup(Number, irregular_number_names()).

number_name_funs() ->
    [{false, fun get_regular_number_name/1},
     {true, fun get_irregular_number_name/1}
    ].

get_regular_number_name(Number) ->
    {Tens, Ones} = parse_base_ten(Number),
    get_tens_name(Tens) ++ get_ones_name(Ones).

parse_base_ten(Number) ->
    {get_tens_place(Number), get_ones_place(Number)}.
  
get_tens_place(Number) ->  
    Number div ?BASE_TEN.

get_ones_place(Number) ->
    Number rem ?BASE_TEN.

get_tens_name(Number) ->
    proplists:get_value(Number, tens_names()).

get_ones_name(Number) ->
    proplists:get_value(Number, ones_names()).

get_irregular_number_name(Number) ->	
    proplists:get_value(Number, irregular_number_names()).

irregular_number_names() ->
    [{0, "zero"},
     {11, "eleven"},
     {12, "twelve"},
     {13, "thirteen"},
     {14, "fourteen"},
     {15, "fifteen"},
     {16, "sixteen"},
     {17, "seventeen"},
     {18, "eighteen"},
     {19, "nineteen"}
    ].
   
ones_names() ->
    [{0, ""},
     {1, "one"},
     {2, "two"},
     {3, "three"},
     {4, "four"},
     {5, "five"},
     {6, "six"},
     {7, "seven"},
     {8, "eight"},
     {9, "nine"}
    ].
    
tens_names() ->
    [{0, ""},
     {1, "ten "},
     {2, "twenty "},
     {3, "thirty "},
     {4, "forty "},
     {5, "fifty "},
     {6, "sixty "},
     {7, "seventy "},
     {8, "eighty "},
     {9, "ninety "}
    ].
    
