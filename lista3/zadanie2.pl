max_sum(L, X) :-
  max_sum(L, 0, 0, X).

max_sum([H|T], Obecny, Najlepszy, Suma) :-
  Nowy_obecny is max(Obecny + H, 0),
  Nowy_najlepszy is max(Nowy_obecny, Najlepszy),
  max_sum(T, Nowy_obecny, Nowy_najlepszy, Suma).

max_sum([], _, Najlepszy, Najlepszy).
