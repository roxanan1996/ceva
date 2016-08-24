function [procent] = evaluate(path,w,string1,count_bins)
[x,t] = preprocess(path,string1,count_bins);
[lin,col] = size(x);
x = x';
y = ones(1,lin);
x1 = [x;y];
x1 = x1';
s=0; 
%w = w';
for i = 1 : lin
  ceva = (x1(i,:))';
  y = w * ceva;
  if ((y >=0 && t(i) ==1) || (y < 0 && t(i) ==-1))
    s=s+1;
   endif
endfor
   procent = (s/lin)*100;
endfunction
