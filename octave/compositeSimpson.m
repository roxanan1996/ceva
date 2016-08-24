function F = compositeSimpson(fx, a, b)
	N = length(fx)-1;
	h = (b-a)/N;
	F = (h/3)*(fx(1) + fx(N+1) + 4*sum(fx(2:2:N)) +	2*sum(fx(3:2:N-1)));
endfunction