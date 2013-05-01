-module(hundred_doors).

-export([create_hundred_doors/1,
	 change_every_nth_door/2
	]).

-define(REMAINDER, 0).

create_hundred_doors(DoorStatus) ->
    [{DoorNumber, DoorStatus} || DoorNumber <- lists:seq(1,100)].
				 
change_every_nth_door(Doors, Nth) ->
    lists:map(fun(Door) ->
		      change_status_if_door_is_nth(Door, Nth)
	      end,
	      Doors).

change_status_if_door_is_nth(Door, Nth) ->
    {DoorNumber, _}  = Door,
    case DoorNumber rem Nth == ?REMAINDER of
	true ->
	    change_door_status(Door);
	false ->
	    Door
    end.

change_door_status({DoorNumber, open})->
    {DoorNumber, closed};
change_door_status({DoorNumber, closed}) ->
    {DoorNumber, open}.


