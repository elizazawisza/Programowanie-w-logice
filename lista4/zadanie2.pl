rybki(Kto) :- agadka_rybki(Domy), member( [_, _, Kto, rybki, _, _], Domy), !.

agadka_rybki(Domy) :-
  % DOM [numer_domu, kolor_domu, kto_w_nim_mieszka, zwierze_hodowane, co_sie_pije, co_sie_pali]
  Domy = [[1, _, _, _, _, _], [2, _, _, _, _, _], [3, _, _, _, _, _], [4, _, _, _, _, _], [5, _, _, _, _, _]], 

  % Norweg zamieszkuje pierwszy dom
  member([1, _, norweg, _, _, _], Domy),

  % Anglik mieszka w czerwonym domu.
  member([_, czerwony, anglik, _, _, _], Domy), 

  % Zielony dom znajduje się bezpośrednio po lewej stronie domu białego.
  member([X1, zielony, _, _, _, _], Domy), 
	member([Y1, bialy, _, _, _, _], Domy), 
  X1 is Y1-1, 

  % Duńczyk pija herbatkę.
  member([_, _, dunczyk, _, herbata, _], Domy), 

  % Palacz papierosów light mieszka obok hodowcy kotów.
	member([X2, _, _, _, _, light], Domy), 
	member([Y2, _, _, koty, _, _], Domy), 
  (X2 is Y2-1 ; X2 is Y2+1), 
  
  % Mieszkaniec żółtego domu pali cygara.
  member([_, zolty, _, _, _, cygara], Domy),

  % Niemiec pali fajkę.
  member([_, _, niemiec, _, _, fajka], Domy), 

  % Mieszkaniec środkowego domu pija mleko.
  member([3, _, _, _, mleko, _], Domy),  
  
  % Palacz papierosów light ma sąsiada, który pija wodę.
  member([X3, _, _, _, _, light], Domy), 
	member([Y3, _, _, _, woda, _], Domy), 
  (X3 is Y3+1 ; X3 is Y3-1), 
  
  % Palacz papierosów bez filtra hoduje ptaki.
  member([_, _, _, ptaki, _, bezfiltra], Domy), 

  % Szwed hoduje psy.
  member([_, _, szwed, psy, _, _], Domy),

  % Norweg mieszka obok niebieskiego domu.
	member([X4, _, norweg, _, _, _], Domy), 
	member([Y4, niebieski, _, _, _, _], Domy),
	(X4 is Y4+1 ; X4 is Y4-1), 

	% Hodowca koni mieszka obok żółtego domu.
	member([X5, _, _, konie, _, _], Domy), 
	member([Y5, zolty, _, _, _, _], Domy), 
	(X5 is Y5+1 ; X5 is Y5-1),

  % Palacz mentolowych pija piwo.
  member([_, _, _, _, piwo, mentolowe], Domy),

  % W zielonym domu pija się kawę.
	member([_, zielony, _, _, kawa, _], Domy).
