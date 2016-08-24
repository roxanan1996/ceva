function [Q, R] = Gram_Schmidt(A)

	% dimensiunea lui A
	[n, n] = size(A);

	% initializare  Q si R
	Q = zeros (n, n);
	R = zeros (n, n);
	
	% calcularea Q si R
	for i = 1 : n
			R(i,i) = norm (A(:,i),2);
			Q(:,i) = A(:,i)/R(i,i);
	
			for j = i + 1 : n
				R(i,j) = Q(:,i)'*A(:,j);
				A(:,j) = A(:,j) - Q(:,i)*R(i,j);
			endfor
	endfor

endfunction
