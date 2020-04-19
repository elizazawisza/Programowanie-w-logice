pojedyncze_wyrazenie(X) :-
  X =.. [_].

additionZeroLeft(X, +, Y, Y) :-
  number(X), X =:= 0.

additionZeroRight(X, +, Y, X) :-
  number(Y), Y =:= 0.


subtraction(X, -, X, 0).


multiplicationZero(X, *, Y, 0) :-
  number(X), X =:= 0;
  number(Y), Y =:= 0.

multiplicationOneLeft(X, *, Y, Y) :-
  number(X), X =:= 1.

multiplicationZeroRight(X, *, Y, X) :-
  number(Y), Y =:= 1.


divisionOne(X, /, Y, X) :-
  Y =:= 1.

divisionProduct(X, /, Y, 1) :-
  X = Y.

divisionProduct(X, /, Y, R) :-
  \+ pojedyncze_wyrazenie(X),
  X =.. [*, XX, YX],
  (
      divisionProduct(XX, /, Y, R);
      divisionProduct(YX, /, Y, R)
  ).

oblicz(X, F, Y, R) :-
  writeln("hej poczatek"),
  write("Y::::"),writeln(Y),
  write("X::::"),writeln(X),
  write("F::::"),writeln(F),
  write("R::::"),writeln(R),
  writeln(""),

  (   F = - ->
    writeln("nooo");
write("????")
),


  (   F = * ->
    writeln('Hej TO JA XD.'),
    writeln(X),
    multiplicationZero(X, F, Y, R), !;
    multiplicationOneLeft(X, F, Y, R), !;
    multiplicationZeroRight(X, F, Y, R), !;
    write("mnoze");
    (F = / ->(
      divisionProduct(X, F, Y, R), !;
      divisionOne(X, F, Y, R), !;
%       writeln('jestem dzieleniem'),
%       writeln(X),
%       writeln(Y),
%       writeln(R),
%       writeln(""),
writeln('jestem dzieleniem')) ;
      (F = - -> 
        subtraction(X, F, Y, R), !;
      writeln('jestem odejmowanie'),
            writeln(X),
      writeln(Y),
      writeln(R),
      writeln("")
      ;
        (F = + ->(
          additionZeroLeft(X, F, Y, R), !;
    additionZeroRight(X, F, Y, R), !;
          writeln('jestem dodawanie')
          )
)
)
  )), 
  write("Y::::"),writeln(Y),
  write("X::::"),writeln(X),
write("R::::"),writeln(R),
  writeln("koniec").


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

