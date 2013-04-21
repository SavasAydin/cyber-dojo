-module(anagrams_test).

-include_lib("eunit/include/eunit.hrl").


generate_anagram_list_of_empty_list_test() ->
    Input = "",
    ?assertEqual([""], anagrams:generate_anagram(Input)).

generate_anagram_list_of_one_character_test() ->
    Input = "a",
    ?assertEqual(["a"], anagrams:generate_anagram(Input)).

generate_anagram_list_of_two_character_test() ->
    Input = "ab",
    ?assertEqual(["ab", "ba"], anagrams:generate_anagram(Input)).

generate_anagram_list_of_three_character_test() ->
    Input = "abc",
    ?assertEqual(["abc", "acb", "bac", "bca", "cab", "cba"], 
		 anagrams:generate_anagram(Input)).

generate_anagram_list_of_four_character_test() ->
    Input = "biro",
    ?assertEqual(["biro", "bior", "brio", "broi", "boir", "bori",
		  "ibro", "ibor", "irbo", "irob", "iobr", "iorb",
		  "rbio", "rboi", "ribo", "riob", "robi", "roib", 
		  "obir", "obri", "oibr", "oirb", "orbi", "orib"], 
		 anagrams:generate_anagram(Input)).
