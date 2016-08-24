function [R] = Iterative(nume, d, eps)

	% citire din fisier
	[N, A, K] = citire_fis(nume);

	% sugestiv
	K_inversat = zeros (N);

	% unitate = coloana de 1-uri
	unitate = ones (N, 1);

	% K_inversat are 0-uri mai putin pe diagonala principala
	K_inversat (K != 0) = 1./K (K != 0);

	% matricea M = (K_inversat * A) inversata
	M = A' * K_inversat';

	% initializare vectorul  de pageRank-uri
	R = 1/N  * unitate;

	% calcularea iterativa a solutiei 
	Rp = zeros (N, 1);


	while 1

		% formula de recurenta
		Rp = d * M * R + (1 - d)/N * unitate;

		% conditia de oprire
		if norm (Rp - R, 2) < eps	
			break;
		endif

		R = Rp;
	end	

endfunction	
