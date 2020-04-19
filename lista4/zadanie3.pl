% dzielenie planszy tylko ma duze i srednie kwadraty
zapalki(Z, (duze(D), srednie(S))) :-
	zapalki(Z, (duze(D), srednie(S), male(0))).

% dzielenie planszy tylko na duze i male kwadraty
zapalki(Z, (duze(D), male(M))) :-
	zapalki(Z, (duze(D), srednie(0), male(M))).

% dzielenie planszy na średnie i małe kwadraty
zapalki(Z, (srednie(S), male(M))) :-
	zapalki(Z, (duze(0), srednie(S), male(M))).


zapalki(Z, (duze(IloscDuzych), srednie(IloscSrednich), male(IloscMalych))) :-
  utworz_duzy(Duze, IloscDuzych),
	utworz_srednie(S, IloscSrednich),
  utworz_male(M, IloscMalych),
	suma(Plansza, [Duze, S, M]),
	sort(Plansza, US),
	sprawdz_duze(US, IloscDuzych),
	sprawdz_srednie(US, IloscSrednich),
	sprawdz_male(US, IloscMalych),
	between(0, 24, Z),
	DL is 24-Z,
	length(Plansza, DL),
	drukuj_rozwiazanie(Plansza).

utworz_duzy(Duzy, 0) :-
	Duzy = [].
utworz_duzy(Duzy, 1) :-
	duze_kwadraty(Duzy).

utworz_srednie(Srednie, 0) :-
	Srednie = [].
utworz_srednie(Srednie, N) :-
	srednie_kwadraty(ListaSrednich),
	podzbior(L, ListaSrednich),
	length(L, N),
	suma(Srednie, L).



utworz_male(Male, 0) :-
	Male = [].
utworz_male(Male, N) :-
	male_kwadraty(ListaMalych),
	podzbior(L, ListaMalych),
	length(L, N),
	suma(Male, L).



sprawdz_duze(CalaLista, 1) :-
	duze_kwadraty(WspolrzedneDuzy),
	podzbior(WspolrzedneDuzy, CalaLista).
sprawdz_duze(CalaLista, 0) :-
	duze_kwadraty(WspolrzedneDuzy),
	\+ podzbior(WspolrzedneDuzy, CalaLista).


sprawdz_srednie(CalaLista, Ilosc) :-
	srednie_kwadraty(WspolrzedneSrednie),
	sprawdz(CalaLista, WspolrzedneSrednie, 0, Ilosc).



sprawdz_male(CalaLista, Ilosc) :-
	male_kwadraty(WspolrzedneMale),
	sprawdz(CalaLista, WspolrzedneMale, 0, Ilosc).



sprawdz(_, [], N, N).
sprawdz(U, [H|T], C, N) :-
	podzbior(H, U),
	C1 is C+1,
	sprawdz(U, T, C1, N).
sprawdz(U, [H|T], C, N) :-
	\+ podzbior(H, U),
	sprawdz(U, T, C, N).


podzbior([], []).
podzbior([E|NT], [E|T]):-
	podzbior(NT, T).
podzbior(NT, [_|T]):-
	podzbior(NT, T).


suma(U, [H]) :-
	U = H.
suma(U, [H|T]) :-
	suma(U1, T),
	union(H, U1, U).


% 1 duzy kwadrat

duze_kwadraty([1, 2, 3, 4, 7, 11, 14, 18, 21, 22, 23, 24]).

% 4 średnie kwadraty
srednie_kwadraty(
  [[1, 2, 4, 6, 11, 13, 15, 16], 
  [2, 3, 5, 7, 12, 14, 16, 17], 
  [8, 9, 11, 13, 18, 20, 22, 23], 
  [9, 10, 12, 14, 19, 21, 23, 24]]).

% 9 małych kwadratow
male_kwadraty(
  [[1, 4, 5, 8], 
  [2, 5, 6, 9], 
  [3, 6, 7, 10], 
  [8, 11, 12, 15], 
  [9, 12, 13, 16], 
  [10, 13, 14, 17], 
  [15, 18, 19, 22], 
  [16, 19, 20, 23], 
  [17, 20, 21, 24]]).


drukuj_rozwiazanie(Zapalki) :-
    drukuj_poziomo([1,2,3], Zapalki),
    dukuj_pionowo([4,5,6,7], Zapalki),
    drukuj_poziomo([8,9,10], Zapalki),
    dukuj_pionowo([11,12,13,14], Zapalki),
    drukuj_poziomo([15,16,17], Zapalki),
    dukuj_pionowo([18,19,20,21], Zapalki),
    drukuj_poziomo([22,23,24], Zapalki).

drukuj_poziomo([], _) :- write('+'), nl.
drukuj_poziomo([N|T], Zapalki) :-
    (member(N, Zapalki) 
        -> write('+---')
        ; write('+   ')),
    drukuj_poziomo(T, Zapalki).

dukuj_pionowo([], _) :- nl.
dukuj_pionowo([N|T], Zapalki) :-
    (member(N, Zapalki)
        -> write('|   ')
        ; write('    ')),
    dukuj_pionowo(T, Zapalki).