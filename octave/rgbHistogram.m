function [rez] = rgbHistogram(path, count_bins)
rez = zeros(1, 3*count_bins);
A=imread(path);
[j,k,m]=size(A);
        x1= zeros(1,count_bins);
        x2 = zeros(1,count_bins);
        x3 = zeros(1, count_bins);
         for i = 0 : count_bins - 1
                  a=(A(:,:,1) >= i*256/count_bins & A(:,:,1) < (i*256/count_bins + 256/count_bins));
                  x1(i+1)=length(A(a));           
                 b=(A(:,:,2) >= i*256/count_bins & A(:,:,2) <(i+1)*256/count_bins);
                 x2(i+1)=length(A(b));
                c= (A(:,:,3) >= i*256/count_bins & A(:,:,3) <(i+1)*256/count_bins); 
                  x3(i+1)=length(A(c));
          
          endfor
   rez = [x1 x2 x3];
endfunction