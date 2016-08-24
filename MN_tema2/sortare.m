function [indici, R2] = sortare(R2, N, eps) 

	% indici = nodurile de ! la N consecutive
	indici = [1 : N];

	% Bubble-sort
	for i = 1 : N
		for j = 1 : N - 1
			if R2(j) < R2(j+1) && R2(j+1) - R2(j) > eps;

				% interschimbare valori din R2
				aux = R2(j);
				R2(j) = R2(j+1);
				R2(j+1) = aux;

				% interschimbare noduri din vectorul indici
				ceva = indici(j);
				indici(j) = indici(j+1);
				indici(j+1) = ceva;
			endif	 
		endfor
	endfor

endfunction