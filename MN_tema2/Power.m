function [R] = Power (nume, d, eps)

	% citire fin fisier% 
	[N,	A, K] = citire_fis (nume);

	% sugestiv
	K_inversat = zeros (N);

	% K_inversat inversa lui K
	K_inversat (K != 0) = 1./K (K != 0);
	
	% M = matricea K_inversat * A transpusa
	M = A' * K_inversat';

	% E = matrice plina de 1-uri
	E = ones (N, N);

	% Matrice care are valoarea predominanta 1 si vectorul propriu R
	Matrice = d * M + (1 - d)/N * E;

	% y = coloana de 1-uri si repr initializarea vectorului propriu
	y = ones (N, 1);	

	% gasirea vectorului R cu metoda puterii directe
	[R] = PutereDir (Matrice, y, 1000, eps); 

endfunction
