-module(number_names).

-export([spell_out/1]).

spell_out(Number) ->
    string:strip(get_number_name(Number)).    

get_number_name(Number) ->
    case is_irregular(Number) of 
	true ->
	    get_irregular_name(Number);
	false ->
	    {Tens, Ones} = parse_base_ten(Number),
	    get_tens_name(Tens) ++ get_ones_name(Ones)
    end.

is_irregular(Number) ->
    none =/= proplists:lookup(Number, irregular_number_names()).

get_irregular_name(Number) ->
    proplists:get_value(Number, irregular_number_names()).

get_tens_name(Number) ->
    proplists:get_value(Number, tens_names()).

get_ones_name(Number) ->
    proplists:get_value(Number, ones_names()).

parse_base_ten(Number) ->
    {get_tens_place(Number), get_ones_place(Number)}.
  
get_tens_place(Number) ->  
    Number div 10.

get_ones_place(Number) ->
    Number rem 10.

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
     {4, "forty "}
    ].
    
