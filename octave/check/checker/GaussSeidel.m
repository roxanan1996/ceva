function [x] = GaussSeidel(A, b, x0, tol, maxiter)
	[m n] = size(A);
	x = x0;
	succes = 0;
	
	while maxiter > 0 
		maxiter--;
		xp = zeros(1, n);
		
		for i = 1 : m
			suma1 = 0;
			suma2 = 0;
			for j = 1 : i - 1
				suma1 += A(i, j)*xp(j);
			endfor
			for j = i + 1 : n
				suma1 += A(i, j)*x(j);
			endfor
			xp(i) = (b(i)-suma1-suma2)/A(i, i);
		endfor
		if norm(xp-x, 2) < tol
			succes = 1;
			break;
		endif
    x = xp;
	endwhile
endfunction


