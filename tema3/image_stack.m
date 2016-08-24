function stack = image_stack( img, num_levels )
    

    % matrix este matricea imaginii, matricea initiala
    matrix = imread(img);

    %pe prima pozitie in stiva punem matricea initiala
    stack(:,:,1) = matrix;

    % formam matricea care ne ajuta sa forma matricele de pe pozitiile urmatoare
    K = 1 / 9 * ones( 3, 3 );

    % recursiv, aflam celelalte matrice folosind functia conv2 
    for i = 2 : num_levels
        stack( :, :, i ) = conv2( stack( :, :, i - 1 ) , K, 'same' );
    end
endfunction
