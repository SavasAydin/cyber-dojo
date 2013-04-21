-module(anagrams). 

-export([generate_anagram/1]).

generate_anagram([]) ->
    [[]];
generate_anagram(Input) ->
    [[X | Tail] || X <- Input,
		   Tail <- generate_anagram(lists:subtract(Input, [X]))].


		  
