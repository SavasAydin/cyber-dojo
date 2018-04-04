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
