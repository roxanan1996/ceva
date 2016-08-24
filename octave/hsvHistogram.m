  function [rez] = hsvHistogram(path, count_bins)
rez = zeros(1, 3*count_bins);
A=imread(path);
[lin,col,ceva] = size(A);
H = zeros(lin,col);
S = zeros(lin,col);
V = zeros(lin,col);
I = ones(lin,col);
 R = A(:,:,1);
        G =A(:,:,2);
        B =A(:,:,3);
        R = cast(R,'double');
        G = cast(G,'double');
        B = cast(B,'double');
        R = R./(255);
        G =G./(255);
        B =B./(255);
        k = max(R,G);
        Cmax = max(k,B);
        k = min(R,G);
        Cmin = min (k,B);
        delta = Cmax - Cmin;
        k = (delta == 0);
        H(k) = 0;
        k = (Cmax == R & delta != 0);
        H(k) = 60*mod((G(k) - B(k))./delta(k),6*I(k));
        k = (Cmax == G & delta != 0);
         H(k) = 60*((B(k) - R(k))./delta(k) + 2*I(k));
         k = (Cmax == B & delta !=0);
          H(k) = 60*((R(k) - G(k))./delta(k) + 4*I(k));         
        H = H./360;
        k = (Cmax == 0);
        S(k) = 0;
        k = (Cmax != 0);
        S(k) =delta(k)./Cmax(k);
        V = Cmax;
       H = 100 * H;
        S = 100 * S;
       V = 100 * V;
   x1 = zeros(1,count_bins);
        x2 = zeros(1,count_bins);
        x3 = zeros(1, count_bins);
         for i = 0 : count_bins - 1
                  a = ( H >= i*101/count_bins & H <(i+1)*101/count_bins);
                  x1(i+1)=length(H(a));           
                 b = (S >= i*101/count_bins & S <(i+1)*101/count_bins);
                 x2(i+1)=length(S(b));
                c= (V >= i*101/count_bins & V <(i+1)*101/count_bins);
                  x3(i+1)=length(V(c));
          
          endfor
          rez = [x1 x2 x3];
  
endfunction