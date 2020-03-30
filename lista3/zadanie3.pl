even_permutation([],[]).

even_permutation([X|Xs], Ys) :-
    even_permutation(Xs, Z),
    insert_odd(X, Z, Ys).
even_permutation([X|Xs], Ys) :-
    odd_permutation(Xs, Z),
    insert_even(X, Z, Ys).


odd_permutation([X|Xs], Ys) :-
    odd_permutation(Xs, Z),
    insert_odd(X, Z, Ys).
odd_permutation([X|Xs], Ys) :-
    even_permutation(Xs, Z),
    insert_even(X, Z, Ys).



insert_odd(X, L, [X|L]).
insert_odd(X, [H1,H2|L1], [H1,H2|L2]) :-
	insert_odd(X, L1, L2).


insert_even(X, [H|L], [H,X|L]).
insert_even(X, [H1,H2|L1], [H1,H2|L2]) :-
	insert_even(X, L1, L2).