function B = GramSchmidt(A)

	% n = dimensiunea lui A
	[n, n] = size (A);

	% B este inversa lui A
	B = zeros (n, n);

	% descompunerea Q - matrice ortogonala si R = matrice superior triunghiulara 
	[Q, R] = Gram_Schmidt (A);

	% rezolvarea celor n sisteme de ecuatii pt gasirea inversei folosind algoritmul SST
	K = Q';
	for i = 1 : n
		B(:,i) = SST (R, Q(i,:));
	endfor

endfunction	

