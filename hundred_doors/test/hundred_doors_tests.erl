-module(hundred_doors_tests).

-include_lib("eunit/include/eunit.hrl").

create_hundred_doors_test() ->
    HundredOpenDoors = hundred_doors:create_hundred_doors(open),
    HundredClosedDoors = hundred_doors:create_hundred_doors(closed),
    ?assertEqual({100, 100}, {length(HundredOpenDoors), length(HundredClosedDoors)}).

create_hundred_open_doors_test() ->
    HundredOpenDoors = hundred_doors:create_hundred_doors(open),
    DoorNumberToTest = 11,
    ?assertEqual(open, hundred_doors:get_door_status(DoorNumberToTest, HundredOpenDoors)).

create_hundred_closed_doors_test() ->
    HundredOpenDoors = hundred_doors:create_hundred_doors(closed),
    DoorNumberToTest = 100,
    ?assertEqual(closed, hundred_doors:get_door_status(DoorNumberToTest, HundredOpenDoors)).

close_all_doors_test() ->
    FourOpenDoors = four_open_doors(),
    ExpectedClosedDoors = four_closed_doors(),
    ?assertEqual(ExpectedClosedDoors, hundred_doors:close_all_doors(FourOpenDoors)).

open_all_doors_test() ->
    FourClosedDoors = four_closed_doors(),
    ExpectedOpenDoors = four_open_doors(),
    ?assertEqual(ExpectedOpenDoors, hundred_doors:open_all_doors(FourClosedDoors)).

change_status_of_each_door_test() ->
    Modulo = 1,
    Doors = [{1, open}, {2, closed}, {3, open}, {4, closed}],
    ChangeStatusOfEachDoor = [{1, closed}, {2, open}, {3, closed}, {4, open}],
    ?assertEqual(ChangeStatusOfEachDoor, hundred_doors:change_every_nth_door(Doors, Modulo)).

change_status_of_every_second_door_test() ->
    Modulo = 2,
    FourClosedDoors = four_closed_doors(),
    OpenEverySecondDoor = [{1, closed}, {2, open}, {3, closed}, {4, open}],
    ?assertEqual(OpenEverySecondDoor, hundred_doors:change_every_nth_door(FourClosedDoors, Modulo)).

change_status_of_every_third_door_test() ->
    Modulo = 3,
    FourClosedDoors = four_closed_doors(),
    OpenEveryThirdDoor = [{1, closed}, {2, closed}, {3, open}, {4, closed}],
    ?assertEqual(OpenEveryThirdDoor, hundred_doors:change_every_nth_door(FourClosedDoors, Modulo)).

change_status_of_every_forth_door_test() ->
    Modulo = 4,
    FourClosedDoors = four_open_doors(),
    CloseEveryForthDoor = [{1, open}, {2, open}, {3, open}, {4, closed}],
    ?assertEqual(CloseEveryForthDoor, hundred_doors:change_every_nth_door(FourClosedDoors, Modulo)).

change_status_of_every_fortieth_door_test() ->
    Modulo = 40,
    HundredClosedDoors = hundred_doors:create_hundred_doors(closed),
    OpenEveryFortiethDoor = hundred_doors:change_every_nth_door(HundredClosedDoors, Modulo),
    DoorNumberToTest = 80,
    ?assertEqual(open, hundred_doors:get_door_status(DoorNumberToTest, OpenEveryFortiethDoor)).

four_closed_doors() ->
    [{1, closed}, {2, closed}, {3, closed}, {4, closed}].
    
four_open_doors() ->
    [{1, open}, {2, open}, {3, open}, {4, open}].
   
