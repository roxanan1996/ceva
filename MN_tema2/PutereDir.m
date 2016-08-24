function [y] = PutereDir(A, y0, maxIter, eps)

	% normalisarea vectorului y;
	y = y0/norm(y0, 1);

	% cat timp nu de pasim nr de interatii
	while maxIter > 0
		maxIter --;
		z = A * y;
		y = z/norm(z, 1);
		lambda = y' * A * y;

		% normalizarea lui y
		y = y/norm(y, 1);

		% conditia de oprire
		if norm (A * y - lambda * y, 1) < eps
			break;
		endif
	endwhile
		
endfunction