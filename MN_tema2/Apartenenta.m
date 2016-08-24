function [y] = Apartenenta(x, val1, val2)

	% situarea lui x intre 0 si val 1
	if x >= 0 && x < val1
		y = 0;
		break;
	endif

	% situarea lui x intre val1 si val2

	% a si b sunt valorile pentru ca functia u sa fie continua pe [0,1]
	a = 1/(val2 - val1);
	b = (-val1)/(val2 - val1);

	if x >= val1 && x <= val2 
		y = a * x + b;
		break;
	endif

	% situarea lui x intre val2 si 1
	if x > val2 && x <= 1
		y = 1;
	endif

endfunction		 	