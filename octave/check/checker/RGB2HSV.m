function RGB2HSV
A=imread(path);
        R = A(:,:,1)/255;
        G = A(:,:,2)/255;
        B = A(:,:,3)/255;
        k = max(R,G);
        Cmax = max(k,B);
        k = min(R,G);
        Cmin = min (k,B);
        delta = Cmax - Cmin;
        k = (delta = = 0);
        H(k) = 0;
        k = (Cmax == R)
        H(k) = 60*mod((G(k) - B(k))/delta(k), 6);
        k = (Cmax == G);
         H(k) = 60*((B(k) - R(k))/delta(k) + 2);
         k = (Cmax == B);
          H(k) = 60*((R(k) - G(k))/delta(k) + 4);         
        H = H/360;
        k = (Cmax == 0);
        S(k) = 0;
        k = (Cmax != 0);
        S(k) = delta(k)/Cmax(k);
        V = Cmax;
endfunction