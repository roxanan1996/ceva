function [R] = Algebraic(nume, d)

	% "extragerea" valorilor din fisier
	[N, A, K ] = citire_fis (nume);

	% unitate = coloana de N 1-uri
	unitate = ones (N, 1);

	% I = matricea identitate cu N elem
	I = eye (N);

	% nume sugestiv
	K_inversat = zeros (N);

	% K_inversat are elemntele 0 cu exceptia celor de pe diagonala care sunt 1/K(i,i)
	K_inversat (K != 0) = 1./K (K != 0);

	% matricea M este (k_inversat*A) transpusa
	M = A' * K_inversat';

	% inversa matricei I-d*M prin algortimul GramSchmidt
	inversa = GramSchmidt (I - d * M);

	% calcularea vectorului R
	ceva = (1 - d)/N;
	R = inversa * ceva * unitate;

endfunction