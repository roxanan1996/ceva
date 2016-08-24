function diffs = lab11Pr2(func, xi)
	N = length(xi);
	diffs = zeros(1,N);
	fxi = func(xi);
	h = xi(2) - xi(1);

	diffs(1) = DEnd(fxi(1:3), h);
	diffs(N) = DEnd(fxi(N:-1:N-2), h);

	for i = 2 : N-1
		diffs(i) = DMid([fxi(i-1), fxi(i+1)], h);
	endfor
endfunction