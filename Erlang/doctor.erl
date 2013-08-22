-module(doctor).
-export([loop/0]).

loop() ->
  process_flag(trap_exit, true), % allows this process to receive exit messages from other processes
  receive
    new ->
	  io:format("Creating and monitor process.~n"),
	  register(revolver, spawn_link(fun roulette:loop/0)),
	  loop();
	{'EXIT', From, Reason} ->
	  io:format("The shooter ~p died with reason ~p.", [From, Reason]),
	  io:format(" Restarting.~n"),
	  self() ! new,
	  loop()
end.

% sample usage, first start the doctor then play with the revolver; depends on roulette.erl
% Doc = spawn(fun doctor:loop/0).
% Doc ! new.
% revolver ! 1.
  