function value = lerp( v, x )

	% n este lungimea vectorului v si totodata cel mai mare element 
	n = length( v );

	% daca x depaseste intervalul:
	if x < 1 || x > n
		value = 0;
		break;
	end	

	% aflu primul contor care depaseste valoarea lui x
	contor = floor( x ) + 1;
	% daca x este 1 atunci valoarea lui este v( 1 ), daca nu pot sa aflu pe x intre punctele contor -1 si contor
	if x == 1 
		value = v(1);
		break;
	endif	
	if x == n
		value = v(n);	
	else

		% Aplic  interpolarea cu polinomul Lagrange de gradul 1 pentru x1 contor = -1 si x2 = contor	
		% contor - (contor - 1) = 1;
		value = v( contor - 1 )	* ( contor - x ) + v( contor ) * ( x - contor + 1 ); 
	endif	
endfunction		
