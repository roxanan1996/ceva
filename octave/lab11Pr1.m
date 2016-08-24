function diffs = lab11Pr1(func, xi)
	N = length(xi);
	diffs = zeros(1,N);
	fxi = func(xi);

	for i = 1 : N-1
		diffs(i) = D2P(fxi(i), fxi(i+1), xi(i+1)-xi(i));
	endfor

	diffs(N) = diffs(N-1);
endfunction