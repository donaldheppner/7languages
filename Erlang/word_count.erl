% Day 1 First Exercise
-module(word_count).
-export([word_count/1]).

word_count([]) -> 0;
word_count([_]) -> 1;
word_count([Char|Rest]) ->
  case ( Char == 32 ) of
    true -> word_count(Rest) + 1;
	false -> word_count(Rest)
  end.

% sample usage
% word_count("one two three").