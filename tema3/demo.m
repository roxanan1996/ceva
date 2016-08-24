function demo

	% pentru bird
	% rotire fata de orizontala
	T = [ -1 0; 0 1 ];
	matrice = inverse_mapping( 'flapping_bird.png', T );
	imwrite(mat2gray(matrice),'bird_orizontala.png');

	% Scalare cu 0.4
	T = [ 0.4 0; 0 0.4 ];
	matrice = inverse_mapping( 'flapping_bird.png', T );
	imwrite(mat2gray(matrice),'bird_0.4.png')

	% Rotirre la 45
	T = [ cos( 45 ), -sin( 45 ); sin( 45 ), cos( 45 ) ];
	matrice = inverse_mapping( 'flapping_bird.png', T );
	imwrite(mat2gray(matrice),'bird_45.png')

	% pentru duck
	% rotire fata de orizontala
	T = [ -1 0; 0 -1 ];
	matrice = inverse_mapping( 'flapping_duck.png', T );
	imwrite(mat2gray(matrice),'duck_orizontala.png')

	% Scalare cu 0.4
	T = [ 0.4 0; 0 0.4 ];
	matrice = inverse_mapping( 'flapping_duck.png', T );
	imwrite(mat2gray(matrice),'duck_0.4.png');

	% Rotirre la 45
	T = [ cos( 45 ), -sin( 45 ); sin( 45 ), cos( 45 ) ];
	matrice = inverse_mapping( 'flapping_duck.png', T );
	imwrite(mat2gray(matrice),'duck_45.png');

endfunction	