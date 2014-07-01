-module(bowling_tests).

-include_lib("eunit/include/eunit.hrl").


nine_pins_hit_on_the_first_ball_of_all_ten_frames_test() ->
    Line = "9-|9-|9-|9-|9-|9-|9-|9-|9-|9-||",
    Res = bowling:score(Line),
    ?assertEqual(90,Res).

ten_strikes_on_all_ten_frames_with_two_bonus_strikes_test() ->
    Line = "X|X|X|X|X|X|X|X|X|X||XX",
    Res = bowling:score(Line),
    ?assertEqual(300,Res).

five_pins_on_first_ball_of_ten_frames_and_spare_on_second_ball_with_a_bonus_test() ->
    Line = "5/|5/|5/|5/|5/|5/|5/|5/|5/|5/||5",
    Res = bowling:score(Line),
    ?assertEqual(150,Res).

mix_of_spares_and_strike_test() ->    
    Line = "X|3/|-/|X|X|--|--|11|X|X||22",
    Res = bowling:score(Line),
    ?assertEqual(118,Res).    

parse_a_regular_line_test() ->
    Line = "11|11|11|11|11|11|11|11|11|11||",
    Res = bowling:parse_line(Line),
    ?assertEqual([[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]],Res).

parse_a_line_that_first_ball_of_a_frame_misses_test() ->
    Line = "-1|11|11|11|11|11|11|11|11|11||",
    Res = bowling:parse_line(Line),
    ?assertEqual([[miss,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]],Res).

parse_a_line_that_second_ball_of_a_frames_misses_test() ->
    Line = "1-|11|11|11|11|11|11|11|11|11||",
    Res = bowling:parse_line(Line),
    ?assertEqual([[1,miss],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]],Res).

parse_a_line_that_two_balls_of_a_frame_misses_test() ->
    Line = "--|11|11|11|11|11|11|11|11|11||",
    Res = bowling:parse_line(Line),
    ?assertEqual([[miss,miss],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]],Res).

parse_a_line_that_first_ball_of_a_frame_is_strike_test() ->
    Line = "X|11|11|11|11|11|11|11|11|11||",
    Res = bowling:parse_line(Line),
    ?assertEqual([[strike],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]],Res).

parse_a_line_that_second_ball_of_a_frame_is_spare_test() ->
    Line = "1/|11|11|11|11|11|11|11|11|11||",
    Res = bowling:parse_line(Line),
    ?assertEqual([[1,spare],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]],Res).

parse_a_line_that_strike_followed_by_a_miss_and_spare_test() ->
    Line = "X|-/|11|11|11|11|11|11|11|11||",
    Res = bowling:parse_line(Line),
    ?assertEqual([[strike],[miss,spare],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]],Res).

parse_a_line_with_two_bonus_balls_test() ->
    Line = "11|11|11|11|11|11|11|11|11|X||11",
    Res = bowling:parse_line(Line),
    ?assertEqual([[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[strike],[1,1]],Res).

parse_a_line_with_one_bonus_balls_test() ->
    Line = "11|11|11|11|11|11|11|11|11|1/||1",
    Res = bowling:parse_line(Line),
    ?assertEqual([[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,spare],[1]],Res).

calculate_points_for_each_frame_in_a_line_test() ->
    Frames = [[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]],
    Res = bowling:calculate_points(Frames),
    ?assertEqual([2,2,2,2,2,2,2,2,2,2],Res).

calculate_points_for_each_frame_in_a_line_that_first_ball_misses_test() ->
    Frames = [[miss,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]],
    Res = bowling:calculate_points(Frames),
    ?assertEqual([1,2,2,2,2,2,2,2,2,2],Res).

calculate_points_for_each_frame_in_a_line_that_second_ball_misses_test() ->
    Frames = [[1,miss],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]],
    Res = bowling:calculate_points(Frames),
    ?assertEqual([1,2,2,2,2,2,2,2,2,2],Res).

calculate_points_for_each_frame_in_a_line_that_two_balls_miss_test() ->
    Frames = [[miss,miss],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]],
    Res = bowling:calculate_points(Frames),
    ?assertEqual([0,2,2,2,2,2,2,2,2,2],Res).

calculate_points_for_each_frame_in_a_line_that_has_a_strike_test() ->
    Frames = [[strike],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]],
    Res = bowling:calculate_points(Frames),
    ?assertEqual([12,2,2,2,2,2,2,2,2,2],Res).

calculate_points_for_each_frame_in_a_line_that_has_a_spare_test() ->
    Frames = [[1,spare],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]],
    Res = bowling:calculate_points(Frames),
    ?assertEqual([11,2,2,2,2,2,2,2,2,2],Res).

calculate_points_for_each_frame_in_a_line_that_strike_has_followed_by_a_miss_and_spare__test() ->
    Frames = [[strike],[miss,spare],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]],
    Res = bowling:calculate_points(Frames),
    ?assertEqual([20,11,2,2,2,2,2,2,2,2],Res).

calculate_points_for_each_frame_in_a_line_that_strike_has_followed_by_a_spare__test() ->
    Frames = [[strike],[1,spare],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]],
    Res = bowling:calculate_points(Frames),
    ?assertEqual([20,11,2,2,2,2,2,2,2,2],Res).

calculate_points_for_each_frame_in_a_line_that_has_two_bonus_balls_test() ->
    Frames = [[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[strike],[1,1]],
    Res = bowling:calculate_points(Frames),
    ?assertEqual([2,2,2,2,2,2,2,2,2,10,2],Res).

calculate_points_for_each_frame_in_a_line_that_has_one_bonus_ball_test() ->
    Frames = [[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,spare],[1]],
    Res = bowling:calculate_points(Frames),
    ?assertEqual([2,2,2,2,2,2,2,2,2,10,1],Res).
