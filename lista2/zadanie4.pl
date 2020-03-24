pojedyncze_wyrazenie(X) :-
  X =.. [_].


dzielenie1(X1*Y1, /, Y1, X1). 
dzielenie2(X1*Y1, /, 1, X1*Y1).
dzielenie3(X1*Y1, /, X1, Y1).

mnozenie4(0, *, Y, 0) :-number(Y), Y =:= 0.
mnozenie3(X, *, 0, 0) :- number(X), X =:= 0.
mnozenie1(X, *, 1, X).
mnozenie2(1, *, Y, Y).

mnozenie(X, *, Y, X*Y).


dzielenie(X, /, Y, X/Y).


dodawanie(X, +, Y, X+Y).
dodawanie2(X, +, 0, X).
dodawanie3(0, +, Y, Y).

odejmowanie(X, -, Y, X-Y).
odejmowanie2(X, -, X, 0).
odejmowanie3(X, -, 0, X).


oblicz(X, F, Y, R) :-
  write("Y::::"),writeln(Y),
  write("X::::"),writeln(X),
  writeln(""),

  (   F = * ->
    writeln('Hej TO JA XD.'),
    writeln(X),
    mnozenie(X, F, Y, R),
    write(R);
    (F = / ->
      dzielenie(X, F, Y, R), !;
      dzielenie1(X, F, Y, R), !;
      dzielenie2(X, F, Y, R), !;
      dzielenie3(X, F, Y, R), !;
      writeln('jestem dzieleniem'),
      writeln(X),
      writeln(Y),
      writeln(""),
    
writeln('jestem dzieleniem');
      (F = - ->(
        odejmowanie(X, F, Y, R), !;
        odejmowanie2(X, F, Y, R), !;
        odejmowanie3(X, F, Y, R), !;
      writeln('jestem odejmowanie')
      );
        (F = + ->(
          dodawanie(X,F, Y, R), !; 
          dodawanie2(X,F, Y, R), !; 
          dodawanie3(X,F, Y, R), !; 
          writeln('jestem dodawanie')
          )
)
)
  )), 
  write("Y::::"),writeln(Y),
  write("X::::"),writeln(X),
  writeln("").


rozloz_na_czynniki(X, F, Y, R) :-
  pojedyncze_wyrazenie(X), pojedyncze_wyrazenie(Y), oblicz(X, F, Y, R), !.

rozloz_na_czynniki(X, F, Y, R) :-
  \+ pojedyncze_wyrazenie(X), pojedyncze_wyrazenie(Y), X =.. [F1, X1, Y1], rozloz_na_czynniki(X1, F1, Y1, R1), oblicz(R1, F, Y, R), !.

rozloz_na_czynniki(X, F, Y, R) :-
  pojedyncze_wyrazenie(X), \+ pojedyncze_wyrazenie(Y), Y =.. [F1, X1, Y1], rozloz_na_czynniki(X1, F1, Y1, R1), oblicz(X, F, R1, R), !.

rozloz_na_czynniki(X, F, Y, R) :-
  \+ pojedyncze_wyrazenie(X), \+ pojedyncze_wyrazenie(Y),
  X =.. [FX, XX, YX], rozloz_na_czynniki(XX, FX, YX, RX),
  Y =.. [FY, XY, YY], rozloz_na_czynniki(XY, FY, YY, RY),
  oblicz(RX, F, RY, R), !.

simplify(E, E) :- number(E).

simplify(E, R) :-
  E =.. [F, X, Y], rozloz_na_czynniki(X, F, Y, R).