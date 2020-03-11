% Eliza Zawisza, 
% 244967

le(1, 1).
le(1, 2).
le(1, 3).
le(1, 4).
le(1, 5).

le(2, 2).
le(2, 3).
le(2, 5).

le(3, 3).
le(3, 5).

le(4, 4).
le(4, 5).

le(5, 5).

le(6, 6).

maksymalny(X) :- le(X, X), \+ (le(X, Y), X \= Y).
największy(X) :- le(X, X), \+ (le(Y, Y), \+ le(Y, X)).
minimalny(X) :- le(X, X), \+ (le(Y, X), X \= Y).
najmniejszy(X) :- le(X, X), \+ (le(Y, Y), \+ le(X, Y)).
