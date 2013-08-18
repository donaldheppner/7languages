don_reverse([], []).
don_reverse([Head|Tail], Result) :- don_reverse(Tail, Reversed), append(Reversed, [Head], Result).