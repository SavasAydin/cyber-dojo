-module(number_names).

-export([spell_out/1]).

spell_out(Number) ->
    NumberName = get_number_name(Number),    
    string:strip(NumberName).    

get_number_name(Number) ->
    case is_regular(Number) of 
	irregular ->
	    get_irregulars_name(Number);
	regular ->
	    [{Tens, Ones}] = parse_base_ten(Number),
	    get_tens_name(Tens) ++ get_ones_name(Ones)
    end.

is_regular(Number) ->
    case proplists:lookup(Number, irregular_number_names()) of
	none ->
	    regular;
	{Number, _} ->
	    irregular
    end.

parse_base_ten(Number) ->
    [{Tens, Ones} || Tens <- [Number div 10],
		     Ones <- [Number rem 10]].
    
get_irregulars_name(Number) ->
    proplists:get_value(Number, irregular_number_names()).

get_tens_name(Number) ->
    proplists:get_value(Number, tens_number_names()).

get_ones_name(Number) ->
    proplists:get_value(Number, ones_number_names()).

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
   
ones_number_names() ->
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
    
tens_number_names() ->
    [{0, ""},
     {1, "ten "},
     {2, "twenty "},
     {3, "thirty "},
     {4, "forty "}
    ].
    
