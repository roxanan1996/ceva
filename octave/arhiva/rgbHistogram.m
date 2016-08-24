function [rez] = rgbHistogram(path, count_bins)
  rez = zeros(1, 3*count_bins);

  %citire matrice tridimensionala
  A=imread(path);

  %dimensiune matrice
  [j,k,m]=size(A);

  %initilizarea vectorilor cu 0 pt R, G, B
  R= zeros(1,count_bins);
  G = zeros(1,count_bins);
  B = zeros(1, count_bins);

  %"parcurgerea celor 3 matrice si calcularea numarului de elemente in intervalul dat pt fiecare i=0:count_bins-1"        
  for i = 0 : count_bins - 1
    k=(A(:,:,1) >= i*256/count_bins & A(:,:,1) < (i*256/count_bins + 256/count_bins));
    R(i+1)=length(A(k));           
    k=(A(:,:,2) >= i*256/count_bins & A(:,:,2) <(i+1)*256/count_bins);
    G(i+1)=length(A(k));
    k= (A(:,:,3) >= i*256/count_bins & A(:,:,3) <(i+1)*256/count_bins); 
    B(i+1)=length(A(k));         
  endfor

  %concatenarea celor 3 vectori R, G, B   
  rez = [R G B];
endfunction