function [ value ] = bilerp( img, row, col )

   % img este matrice

   % calculez dim matricei
   [ n, m ] = size( img );
    
    % daca coordonatele sunt in afara intervalului, returnez 0
   if row < 1 || row > n || col < 1 || col > m
   		value = 0;
   		break;
   end		

   % aflu punctele y1 si y2 intre care se afla col

   % daca col este 1 atunci facem o interpolare liniara pe coloana 1 
   if col == 1	
      R2 = lerp( img( :, col ) , row );
      value = R2;
      break;
   end
   if col == m
      value = lerp( img( :, col ), row );
   else        
      % atlfel, fac o interpolare liniara pe coloana y1, una pe coloana y2
      y1 = floor( col );
      y2 = y1 + 1;
   	R2 = lerp( img( :, y2 ), row );
   	R1 = lerp( img( :, y1 ), row );

      % la final interpolez liniar pentru a afla valoarea intre R1 si R2
    	rap1 = ( col - y2 ) / ( y1 - y2 );
      rap2 = ( col - y1) / ( y2 - y1 );
      value = R1 * rap1 + R2 * rap2;
   end 
endfunction
