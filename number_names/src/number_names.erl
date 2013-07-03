-module(number_names).

-export([spell_out/1]).

spell_out(Number) ->
    NumberName = get_number_name(Number),
    string:strip(NumberName).
 
get_number_name(Number) when Number >= 21 andalso
			     Number =< 29 ->
    Remainder = Number rem 20,
    get_number_name(20) ++ get_number_name(Remainder);
get_number_name(Number) when Number >= 16 andalso 
			     Number =< 19 andalso 
			     Number =/= 18 ->
    Remainder = Number rem 10,
    get_number_name(Remainder) ++ "teen";
get_number_name(Number) ->
    proplists:get_value(Number, number_names()).

number_names() ->
    [{0, "zero"},
     {1, "one"},
     {2, "two"},
     {3, "three"},
     {4, "four"},
     {5, "five"},
     {6, "six"},
     {7, "seven"},
     {8, "eight"},
     {9, "nine"},
     {10, "ten"},
     {11, "eleven"},
     {12, "twelve"},
     {13, "thirteen"},
     {14, "fourteen"},
     {15, "fifteen"},
     {18, "eighteen"},
     {20, "twenty "},
     {30, "thirty "}
    ].

