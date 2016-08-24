function [w] = learn (x, t)
[lin,col] = size(x);
x = x';
y = ones(1,lin);
x1 = [x;y];
x1 = x1';
x0 = zeros(lin,1);
A = x1'*x1;
b = x1'*t;
%L = cholesky(A);
%k = SIT(L,b);
%w = SST(L',k);
w = GaussSeidel(A,b,x0,0.001,1000);
endfunction
