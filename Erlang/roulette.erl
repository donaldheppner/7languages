-module(roulette).
-export([loop/0]).

% send a number, 1-6
loop() ->
  receive
    3 -> io:format("bang!~n"), exit({roulette, die, at, erlang:time()});
	_ -> io:format("click~n"), loop()
end.

% sample usage with registered roulette_game
% Pid = spawn(fun roulette:loop/0).
% Pid ! 1.