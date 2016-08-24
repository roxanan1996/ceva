function [ matrice ] = inverse_mapping( img_in, T )
   
    % extrag matricea din imagine 
    matrix = imread(img_in);

    % aflu dimensiunea 
    [ n, m ] = size( matrix );

    % Calculez noi indici din colturile stanga sus, dreapta sus, stanga jos, dreapta jos 
    v = T * [ 1; 1];
    i11 = v(1);
    j11 = v(2);
    v = T * [ 1; m ];
    i1m = v(1);
    j1m = v(2);
    v = T * [ n; 1];
    jn1= v(2);
    in1 = v(1);
    v = T * [ n; m ];
    jnm = v(2);
    inm = v(1);

    % calculez minimul si maximul dintre indicii de pe linie, la fel si pentru coloana si ii rotunjesc 
    vi = [ i11, i1m, in1, inm];
    n1 = round(min(vi));
    vj = [ j11, j1m, jn1, jnm ];
    n2 = round(max(vi));
    m1 = round(min(vj));
    m2 = round(max(vj));
    
   % Calculez inversa lui T
   inversa_T = 1 / ( T( 1, 1 ) * T( 2, 2 ) - T( 1, 2 ) * T( 2, 1 ) ) * [ T( 2, 2 ), -T( 1, 2 ); -T( 2, 1 ), T( 1, 1 )];
 
   % formez noua matrice
   for i = n1 : n2
        for j = m1 : m2
            v = inversa_T * [ i; j ];
            value = bilerp( matrix, v(1), v(2) );
            linie = i - n1 + 1;
            col = j - m1 + 1;
            matrice( linie, col ) = value;
        end
   end     
     
  endfunction
