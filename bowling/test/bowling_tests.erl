-module(bowling_tests).

-include_lib("eunit/include/eunit.hrl").

calculate_score_of_an_ongoing_line_without_a_strike_and_spare_test() ->
    OngoingLine = "24|54|34|44|",
    Res = bowling:score(OngoingLine),
    ?assertEqual(6+9+7+8,Res).

calculate_score_of_an_ongoing_line_with_a_strike_test() ->
    OngoingLine = "X|22|45",
    Res = bowling:score(OngoingLine),
    ?assertEqual(10+2+2+4+9,Res).

calculate_score_of_an_ongoing_line_with_two_strikes_in_a_row_test() ->
    OngoingLine = "X|X|45",
    Res = bowling:score(OngoingLine),
    ?assertEqual(10+10+4+10+4+5+9,Res).

calculate_score_of_an_ongoing_line_with_a_spare_test() ->
    OngoingLine = "5/|22|45",
    Res = bowling:score(OngoingLine),
    ?assertEqual(10+2+4+9,Res).

calculate_score_of_an_ongoing_line_with_two_spares_in_a_row_test() ->
    OngoingLine = "5/|3/|45",
    Res = bowling:score(OngoingLine),
    ?assertEqual(10+3+10+4+9,Res).

calculate_score_of_an_ongoing_line_with_a_spare_and_strike_test() ->
    OngoingLine = "5/|X|45",
    Res = bowling:score(OngoingLine),
    ?assertEqual(10+10+10+4+5+9,Res).

calculate_score_of_an_ongoing_line_with_a_strike_and_spare_test() ->
    OngoingLine = "X|5/|45",
    Res = bowling:score(OngoingLine),
    ?assertEqual(10+10+10+4+9,Res).

