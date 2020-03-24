create_list(N, L) :-
	findall(Num, between(1, N, Num), L).

permute([], []).
permute([X|Rest], L) :-
    permute(Rest, L1),
    select(X, L, L1).

merge_list([],L,L ).
merge_list([H|T],L,[H|M]):-
    merge_list(T,L,M).

lista(N,X):-
	create_list(N,L1),
	permute(L1, L2),
	merge_list(L1,L2,X).