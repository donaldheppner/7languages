don_min(One, Two, Result) :- One @=< Two, Result is One.
don_min(One, Two, Result) :- One @> Two, Result is Two.

don_min(Candidate, [], Candidate).
don_min(Candidate, [Head|Tail], Result) :- don_min(Candidate, Head, Can2), don_min(Can2, Tail, Result).
don_min([First,Second|Tail], Result) :- don_min(First, Second, Candidate), don_min(Candidate, Tail, Result).

don_min2([Head|[]], Head).
don_min2([Head|Tail], TailMin) :- don_min2(Tail, TailMin), TailMin @=< Head.
don_min2([Head|Tail], Head) :- don_min2(Tail, TailMin), TailMin @> Head.