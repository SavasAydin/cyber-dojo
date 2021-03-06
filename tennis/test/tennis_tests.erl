-module(tennis_tests).

-include_lib("eunit/include/eunit.hrl").

score_players_when_game_starts_test() ->
    ?assertEqual({"love", "love"}, tennis:score(0,0)).

score_when_first_player_scores_one_test() ->
    ?assertEqual({"fifteen", "love"}, tennis:score(1,0)).

score_when_first_player_scores_two_test() ->
    ?assertEqual({"thirty", "love"}, tennis:score(2,0)).

score_when_first_player_scores_three_test() ->
    ?assertEqual({"forty", "love"}, tennis:score(3,0)).

score_when_first_player_scores_one_and_second_player_scores_three_test() ->
    ?assertEqual({"fifteen", "forty"}, tennis:score(1,3)).

score_when_both_players_score_one_test() ->
    ?assertEqual({"fifteen", "fifteen"}, tennis:score(1,1)).

score_when_first_player_score_one_and_second_player_scores_two_test() ->
    ?assertEqual({"fifteen", "thirty"}, tennis:score(1,2)).

score_when_both_players_score_two_test() ->
    ?assertEqual({"thirty", "thirty"}, tennis:score(2,2)).

score_when_first_player_score_three_and_second_player_scores_two_test() ->
    ?assertEqual({"forty", "thirty"}, tennis:score(3,2)).

score_when_both_players_score_three_test() ->
    ?assertEqual("deuce", tennis:score(3,3)).

score_when_both_players_score_four_test() ->
    ?assertEqual("deuce", tennis:score(4,4)).

score_when_first_player_score_three_and_second_player_scores_four_test() ->
    ?assertEqual({"advantage", "second_player"}, tennis:score(3,4)).

score_when_first_player_score_four_and_second_player_scores_three_test() ->
    ?assertEqual({"advantage", "first_player"}, tennis:score(4,3)).

score_when_first_player_score_five_and_second_player_scores_five_test() ->
    ?assertEqual("deuce", tennis:score(5,5)).

score_when_first_player_score_four_and_second_player_scores_zero_test() ->
    ?assertEqual({"win", "first_player"}, tennis:score(4,0)).

score_when_first_player_score_one_and_second_player_scores_four_test() ->
    ?assertEqual({"win", "second_player"}, tennis:score(1,4)).

score_when_first_player_score_four_and_second_player_scores_two_test() ->
    ?assertEqual({"win", "first_player"}, tennis:score(4,2)).

score_when_first_player_score_four_and_second_player_scores_six_test() ->
    ?assertEqual({"win", "second_player"}, tennis:score(4,6)).
