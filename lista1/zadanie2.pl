% Eliza Zawisza, 
% 244967
% Facts

on(2, 1).
on(3, 1).
on(4, 2).
on(5, 3).

% Rules 
above(Block1, Block2) :- on(Block1, Block2).
above(Block1, Block2) :- on(Block1, Z), above(Z, Block2).