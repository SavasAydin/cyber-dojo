-module(hundred_doors_tests).

-include_lib("eunit/include/eunit.hrl").

create_hundred_doors_regardless_of_status_test() ->
    HundredDoors = hundred_doors:create_hundred_doors(undefined),
    ?assertEqual(100, length(HundredDoors)).

create_hundred_open_doors_test() ->
    HundredOpenDoors = hundred_doors:create_hundred_doors(open),
    DoorNumberToTest = 11,
    ?assertEqual({11, open}, get_door(DoorNumberToTest, HundredOpenDoors)).

create_hundred_closed_doors_test() ->
    HundredOpenDoors = hundred_doors:create_hundred_doors(closed),
    DoorNumberToTest = 100,
    ?assertEqual({100, closed}, get_door(DoorNumberToTest, HundredOpenDoors)).

change_status_of_each_door_test() ->
    Each = 1,
    FourClosedDoors = four_closed_doors(),
    FourOpenDoors = four_open_doors(),
    ?assertEqual(FourOpenDoors, 
		 hundred_doors:change_every_nth_door(FourClosedDoors, Each)).

change_status_of_every_second_door_test() ->
    Second = 2,
    FourClosedDoors = four_closed_doors(),
    EverySecondDoorIsOpen = [{1, closed}, {2, open}, {3, closed}, {4, open}],
    ?assertEqual(EverySecondDoorIsOpen, 
		 hundred_doors:change_every_nth_door(FourClosedDoors, Second)).

change_status_of_every_third_door_test() ->
    Third = 3,
    FourOpenDoors = four_open_doors(),
    EveryThirdDoorIsClosed = [{1, open}, {2, open}, {3, closed}, {4, open}],
    ?assertEqual(EveryThirdDoorIsClosed, 
		 hundred_doors:change_every_nth_door(FourOpenDoors, Third)).

change_status_of_every_fortieth_door_test() ->
    Fortieth = 40,
    HundredClosedDoors = hundred_doors:create_hundred_doors(closed),
    OpenEveryFortiethDoor = hundred_doors:change_every_nth_door(HundredClosedDoors, Fortieth),
    DoorNumberToTest = 80,
    ?assertEqual({80, open}, get_door(DoorNumberToTest, OpenEveryFortiethDoor)).

four_closed_doors() ->
    [{1, closed}, {2, closed}, {3, closed}, {4, closed}].
    
four_open_doors() ->
    [{1, open}, {2, open}, {3, open}, {4, open}].
   
get_door(DoorNumberToGet, Doors) ->
    lists:nth(DoorNumberToGet, Doors).
