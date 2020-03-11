% Eliza Zawisza, 
% 244967
% Facts

above(bicycle, pencil).
above(card, bicycle).
above(camera, buterfly).
above(hourglass, camera).

left_of(pencil, hourglass).
left_of(hourglass, butterfly).
left_of(butterfly, fish).

% Rules 

right_of(Object1, Object2) :- left_of(Object2, Object1).
below(Object1, Object2) :- above(Object2, Object1).

left_recursive(Object1, Object2) :- left_of(Object1, Object2).
left_recursive(Object1, Object2) :- left_of(X, Object2), left_recursive(Object1, X).

above_recursive(Object1, Object2) :- above(Object1, Object2).
above_recursive(Object1, Object2) :- above(X, Object2), above_recursive(Object1, X).


higher(Object1, Object2) :- above(Object1, X), above(Object2, Y), higher(X, Y).
higher(Object1, Object2) :- above_recursive(Object1, Object2).
higher(Object1, Object2) :- left_recursive(Object2, X), above_recursive(Object1, X).  
higher(Object1, Object2) :- left_recursive(X, Object2), above_recursive(Object1, X).