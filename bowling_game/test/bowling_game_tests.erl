-module(bowling_game_tests).
-include_lib("eunit/include/eunit.hrl").

five_pins_hit_on_each_frame_of_all_ten_frames_test() ->
    TenFrames = "32|32|32|32|32|32|32|32|32|32||",
    Res = bowling_game:score(TenFrames),
    ?assertEqual(50, Res).

nine_pins_hit_on_the_first_ball_of_all_ten_frames_test() ->
    TenFrames = "9-|9-|9-|9-|9-|9-|9-|9-|9-|9-||",
    Res = bowling_game:score(TenFrames),
    ?assertEqual(90, Res).

nine_pins_hit_on_the_second_ball_of_all_ten_frames_test() ->
    TenFrames = "-9|-9|-9|-9|-9|-9|-9|-9|-9|-9||",
    Res = bowling_game:score(TenFrames),
    ?assertEqual(90, Res).

five_pins_on_the_first_ball_of_nine_frames_test() ->
    TenFrames = "5/|5/|5/|5/|5/|5/|5/|5/|5/|54||",
    Res = bowling_game:score(TenFrames),
    ?assertEqual(144, Res).

ten_strikes_on_the_first_ball_of_nine_frames_test() ->
    TenFrames = "X|X|X|X|X|X|X|X|X|54||",
    Res = bowling_game:score(TenFrames),
    ?assertEqual(263, Res).

mix_of_spare_and_strike_test() ->
    TenFrames = "5/|X|5/|X|5/|-/|X|-/|X|--||",
    Res = bowling_game:score(TenFrames),
    ?assertEqual(160, Res).
