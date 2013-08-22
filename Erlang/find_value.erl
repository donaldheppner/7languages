-module(find_value).
-export([find_value/2]).

find_value(_, []) -> false;
find_value(Key, [{HeadKey,HeadValue}|Tail]) ->
  if
    Key == HeadKey -> HeadValue;
    true -> find_value(Key, Tail)
  end.

% sample usage
% find_value(ruby, [{erlang, "a functional language"}, {ruby, "an OO language"}]).