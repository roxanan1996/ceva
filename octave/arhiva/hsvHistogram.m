function [rez] = hsvHistogram(path, count_bins)
  rez = zeros(1, 3*count_bins);

  %citire matrice tridimensioanala
  A=imread(path);

  %dimensiune matrice
  [lin,col,ceva] = size(A);

  %initializarea celor 3 matrice H, S, V
  H = zeros(lin,col);
  S = zeros(lin,col);
  V = zeros(lin,col);

  %matrice cu elementele egale cu 1  
  I = ones(lin,col);

  %definirea matricelor R, G, B fiind "fetele" matricei A
  R= A(:,:,1);
  G =A(:,:,2);
  B =A(:,:,3);
  
  %cast la double pt elementele matricelor R, G, B
  R = cast(R,'double');
  G = cast(G,'double');
  B = cast(B,'double');

  %algoritmul rgb2hsv propus:
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

  %intializarea vectorilor de frecventa pt H, S, V
  h = zeros(1,count_bins);
  s = zeros(1,count_bins);
  v = zeros(1, count_bins);

  %parcurgere matricelor H S V si determinarea vectorilor de frecventa
  for i = 0 : count_bins - 1
    k = ( H >= i*101/count_bins & H <(i+1)*101/count_bins);
    h(i+1)=length(H(k));           
    k = (S >= i*101/count_bins & S <(i+1)*101/count_bins);
    s(i+1)=length(S(k));
    k= (V >= i*101/count_bins & V <(i+1)*101/count_bins);
    v(i+1)=length(V(k));          
  endfor

  %concatenarea vectorilor pentru H, S, V
  rez = [ h s v];
endfunction
