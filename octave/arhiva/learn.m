function [w] = learn (x, t)

	%dimensiune matrice x
	[lin,col] = size(x);

	% punerea unei coloane de "1-uri la matricea x"
	x = x';
	y = ones(1,lin);
	x1 = [x;y];
	x1 = x1';

	% initializare vectorul de solutii cu 0 pt metoda iterativa
	x0 = zeros(lin,1);

	% rezolvarea sistemului A * w = b cu metoda iterativa GaussSeidel
	A = x1'*x1;
	b = x1'*t;
	w = GaussSeidel(A,b,x0,0.001,1000);
endfunction
