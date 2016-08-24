function [procent] = evaluate(path,w,string1,count_bins)

	% gasirea matricei x si vectorului t
	[x,t] = preprocess(path,string1,count_bins);

	% dimesiunea matricei x
	[lin,col] = size(x);

	% adaugarea coloanei de "1-uri la matricea x"
	x = x';
	y = ones(1,lin);
	x1 = [x;y];
	x1 = x1';

	% initializarea numarului imaginilor rezultate corect cu 0
	s=0; 
	for i = 1 : lin
  	ceva = (x1(i,:))';
  	y = w * ceva;
  		if ((y >=0 && t(i) ==1) || (y < 0 && t(i) ==-1))
	    	s=s+1;
   		endif
	endfor

	% calcularea procentului
	procent = (s/lin)*100;
endfunction
