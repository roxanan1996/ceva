function [w] = learn (x, t)
[lin,col] = size(x);
x = x';
y = ones(1,lin);
x1 = [x;y];
x1 = x1';
A = x1'*x1;
b = x1'*t;
x0=zeros(lin,1);
w = GaussSeidel(A,b,x0,0.0001,100);
endfunction
