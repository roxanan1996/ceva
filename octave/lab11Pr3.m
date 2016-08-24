function rez = lab11Pr3(func, a, b, N, method)
	step = (b-a)/N;
	xi = (a:step:b);
	fxi = func(xi);
	rez = method(fxi, a, b);
endfunction