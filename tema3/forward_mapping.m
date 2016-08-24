function [ matrice ] = forward_mapping( img_in, T )

    % functia primeste ca parametru imaginea

    % aflu matricea imaginii
    matrice_initiala = imread( img_in );

    % dimensiunea matricei
    [ n, m ] = size( matrice_initiala );

    % calculez indicii noii matrice, si aflu minimul pe linie si minimul pe coloana
    min_linie = 0;
    min_col = 0;
    for i = 1 : n
        for j = 1 : m
            v = round( T * [ i; j ] );
            min_linie = min( v( 1 ), min_linie );
            min_col = min( v( 2 ), min_col ); 
        end
    end 

    % la fiecare indice nou obtinut, "scalez", scazand min_linie respectiv min_col si adunand 1
    % adun 1 ca sa nu existe indice = 0   
    for i = 1 : n
        for j = 1 : m
            v = round( T * [ i; j ] );
            linie = v( 1 ) - min_linie + 1;
            col = v( 2 ) - min_col + 1;

            % matrice = matricea imaginii finale care are pe noile pozitii valoarea matricei initiale invechile pozitii
            matrice( linie, col ) = matrice_initiala( i, j ); 
        end    
    end
endfunction
