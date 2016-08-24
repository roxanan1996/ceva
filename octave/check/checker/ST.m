function [Q,R] = ST (A)
[n,n] = size(A);
In = eye(n);
H = In;
for p = 1 : n-1
  H(p) = In - 2 * 
endfunction
