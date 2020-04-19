wyrażenie(Lista, Wartosc, Wyrazenie) :-
	wyrażenie(Lista, Wyrazenie),
	Wartosc is Wyrazenie.
wyrażenie([Liczba], Liczba).
 

wyrażenie(L, X) :-
	append(L1, L2, L),
	\+ length(L1, 0),
	\+ length(L2, 0),
	wyrażenie(L1, OP1),
	wyrażenie(L2, OP2),
	dzialanie(X, OP1, OP2).



dzialanie(Wyrazenie, X, Y) :-
	Wyrazenie = X + Y.
dzialanie(Wyrazenie, X, Y) :-
	Wyrazenie = X - Y.
dzialanie(Wyrazenie, X, Y) :-
	Wyrazenie = X * Y.
dzialanie(Wyrazenie, X, Y) :-
	Y =\= 0,
	Wyrazenie = X / Y.
