

don_check_order([]).
don_check_order([Head]).
don_check_order([First,Second|Tail]) :- First @< Second, check_order([Second|Tail]).

don_sort(List, Result) :- permutation(List, Result), don_check_order(Result).