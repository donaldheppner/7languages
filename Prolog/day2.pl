don_min(One, Two, Result) :- One <= Two, Result is One.
don_min(One, Two, Result) :- One > Two, Result is Two.

don_min([First,Second|Tail], Result) :- don_min(First, Second, Candidate), don_min(Candidate, Tail, Result).

don_min(Candidate, [Head|Tail], Result) :- don_min(Candidate, Head, Candidate2), don_min(Candidate2, Tail, Result).
don_min(Candidate, [], Candidate).
