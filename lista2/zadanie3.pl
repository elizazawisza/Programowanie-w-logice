arc(a,b).
arc(b,a).
arc(b,c).
arc(c,d).

ścieżka(X,X, _).
ścieżka(X,Y, Z) :-
	arc(X,V),
	\+ member(V,Z),
	ścieżka(V, Y, [X|Z]).
osiągalny(X,Y) :- ścieżka(X,Y, []).