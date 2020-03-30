wariancja(L, D) :-
    L\=[],
    length(L, Dlugosc),
    srednia(L, 0, Srednia, Dlugosc),
    wariancja(L, 0, Dlugosc, Srednia, D).

wariancja([], Wariancja, Dlugosc, _, D) :-
    D is Wariancja/Dlugosc.

wariancja([X|L], Wariancja, Dlugosc, Srednia, D) :-
    WariancjaX is Wariancja+Srednia*Srednia+X*X-2*Srednia*X,
    wariancja(L, WariancjaX, Dlugosc, Srednia, D).

  srednia([], Suma, Srednia, Dlugosc) :-
    Srednia is Suma/Dlugosc.

  srednia([X|L], Suma, Srednia, Dlugosc) :-
    SumaX is Suma+X,
    srednia(L, SumaX, Srednia, Dlugosc).