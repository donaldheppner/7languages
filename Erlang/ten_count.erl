% Day 1 Second Exercise
-module(ten_count).
-export([count/1]).
-export([count/0]).

count(10) -> io:format("At 10!~n");
count(N) -> io:format("~w~n", [N]), count(N + 1).
count() -> count(1).

% sample usage
% count().