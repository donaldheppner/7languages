-module(shopping).
-export([total/1]).

total(Bag) -> [{Product, Quantity * Price} || {Product, Quantity, Price} <- Bag].

% sample usage
% total([{"Bananas", 4, 0.25}, {"Apples", 2, 0.50}, {"Grapes", 1, 0.05}]).
