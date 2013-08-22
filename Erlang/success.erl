% Day 1 Third Exercise
-module(success).
-export([test/1]).

test(success) -> io:format("success!");
test({error, Message}) -> io:format("Error: ~s", [Message]).

% sample usage
% test(success).
% test(error, "Oh no!").