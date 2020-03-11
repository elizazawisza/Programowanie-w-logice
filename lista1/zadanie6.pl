% Eliza Zawisza, 
% 244967



is_prime(A) :- \+ (B is integer(sqrt(A)), between(2, B, N), A mod N=:=0).
	
% Rules 
prime(LO, HI, N) :- between(LO, HI, N), is_prime(N).