-module(hundred_doors).

-export([create_hundred_doors/1,
	 close_all_doors/1,
	 open_all_doors/1,
	 get_door_status/2,
	 change_every_nth_door/2
	]).

create_hundred_doors(Status) ->
    [{DoorNumber, DoorStatus} || DoorNumber <- lists:seq(1,100),
				 DoorStatus <- [Status]].

get_door_status(DoorNumber, Doors) ->
    {DoorNumber, DoorStatus} = lists:nth(DoorNumber, Doors),
    DoorStatus.

close_all_doors(Doors) ->
    lists:map(fun close_door/1, Doors).

close_door({DoorNumber, _}) ->
    {DoorNumber, closed}.

open_all_doors(Doors) ->
    lists:map(fun open_door/1, Doors).

open_door({DoorNumber, _}) ->
    {DoorNumber, open}.

change_every_nth_door(Doors, Modulo) ->
    lists:map(fun (Door) ->
		      change_door_reminder_zero_with_modulo(Door, Modulo) 
	      end,
	      Doors).

change_door_reminder_zero_with_modulo({DoorNumber, _} = Door, Modulo) ->
    case DoorNumber rem Modulo == 0 of
	true ->
	    change_door_status(Door);
	false ->
	    Door
    end.

change_door_status({DoorNumber, open})->
    {DoorNumber, closed};
change_door_status({DoorNumber, closed}) ->
    {DoorNumber, open}.


