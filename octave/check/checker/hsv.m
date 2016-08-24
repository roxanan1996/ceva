function [H, S, V] = hsv(path, count_bins)
rez = zeros(1, 3*count_bins);
A=imread(path);
[lin,col,ceva] = size(A);
H = zeros(lin,col);
S = zeros(lin,col);
V = zeros(lin,col);
I = ones(lin,col);
       R = A(:,:,1)./(255.*I);
        G =A(:,:,2)./(255.*I);
        B =A(:,:,3)./(255.*I);
        k = max(R,G);
        Cmax = max(k,B);
        k = min(R,G);
        Cmin = min (k,B);
        delta = Cmax - Cmin;
        k = (delta == 0);
        H(k) = 0;
        k = (Cmax == R);
        H(k) = 60.*I(k).*((G(k) - B(k))./delta(k) + 6.*I(k));
        k = (Cmax == G);
         H(k) = 60.*I(k).*((B(k) - R(k))./delta(k) + 2.*I(k));
         k = (Cmax == B);
          H(k) = 60.*I(k).*((R(k) - G(k))./delta(k) + 4.*I(k));         
        H = H./(360.*I);
        k = (Cmax == 0);
        S(k) = 0;
        k = (Cmax != 0);
        S(k) = delta(k)./Cmax(k);
        V = Cmax;
        x1= zeros(1,count_bins);
        x2 = zeros(1,count_bins);
        x3 = zeros(1, count_bins);
         for i = 0 : count_bins - 1
                  a = ( H >= i*256/count_bins & H <(i+1)*256/count_bins & H >=0 & H <=360);
                  x1(i+1)=length(H(a));           
                 b = (S >= i*256/count_bins & S <(i+1)*256/count_bins & S >=0 & S <=100);
                 x2(i+1)=length(S(b));
                c= (V >= i*256/count_bins & V <(i+1)*256/count_bins & V >=0 & V <=100);
                  x3(i+1)=length(V(c));
          
          endfor
  
endfunction