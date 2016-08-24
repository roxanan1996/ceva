function [ matrice ] = transform_image( img_in, k )
 
    % calculez stack-ul de matrice care sunt in numar de [k] + 1;
    stack = image_stack( img_in, floor(k) + 1 );

    % aflu dimensiunea stack-ului
    [ n , m , l ] = size( stack );

    % daca k depaseste intervalul, 
    if k < 1 || k > l
        matrice = zeros( n, m );
    end

    % aflu primul numar intreg care depaseste k;
    contor = floor(k) + 1;

    % aflu noua matrice
    for i = 1 : n
        for j = 1: m            
            if k == 1
                value = stack( i, j, k );
            else    
                if k == l
                    value = stack( i, j, k)
                else
                    val1 = stack( i, j, contor - 1 );
                    val2 = stack( i, j, contor );
                    y1 = contor - 1;
                    y2 = contor;
                    rap1 = ( k - y2 ) / ( y1 - y2 );
                    rap2 = ( k - y1) / ( y2 - y1 );
                  value = val1 * rap1 + val2 * rap2;
                end
            end    
            matrice(i,j) = value;
        end
    end            
end
