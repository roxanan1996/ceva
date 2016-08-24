function [N, A, K, val1, val2] = citire_fis(nume)

	% deschidere fisier
	fid = fopen (nume, 'r');

	% extragere N de pe prima linie
	N = fscanf (fid, '%d', 1);

	% initilizare matrice de adiacenta si matricea link-urilor
	A = zeros (N);
	K = zeros (N);

	% calcularea valorilor din A si K; parcurgerea urmatoarelor N linii din fisier
	contor = 1;
	while contor < N + 1

		% i = indicele nodului
		i = fscanf (fid, '%d', 1);

		% nr = numarul de vecini
		nr = fscanf (fid, '%d', 1);

		% parcurgerea vecinilor si completarea matricei A	
		for k = 1 : nr
			j = fscanf (fid,'%d',1);

			% daca s-a gasit un vecin == i atunci numarul de vecini scade cu o unitate
			if i == j
				nr = nr - 1;
			endif

			if i != j
				A(i,j) = 1;
			endif

			K(i,i) = nr;
		endfor
		contor = contor + 1;
	end

	% parcurgerea ultimelor 2 linii si gasirea val1 si val2
	ceva = fgetl (fid);
	ceva1 = fgetl (fid);
	ceva2 = fgetl (fid);

	% cast de la string a valorilor val1 si val2
	val1 = str2num (ceva1);
	val2= str2num (ceva2);

	% inchidere fisier
	fclose (fid);

endfunction