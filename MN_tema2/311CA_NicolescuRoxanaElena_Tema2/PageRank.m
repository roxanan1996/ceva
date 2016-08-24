function [R1, R2, R3] = PageRank(nume, d, eps)

	% citire din fisier
	[N, A, K, val1, val2] = citire_fis (nume);

	% concatenarea numelui fisierului de iesire
	fullname = [nume '.out'];

	% deschidere fisier de output
	fid1 = fopen (fullname,'w');

	% afisare in fisier
	fprintf (fid1, '%d\n\n', N);

	% R1 = vectorul de pageRank obtinut cu prima functie
	R1 = Iterative (nume, d, eps);

	% afisare R1
	fprintf (fid1,'%d\n',R1);
	fprintf (fid1,'\n');

	% R2 = vectorul de pageRank din a doua functie
	R2 = Algebraic (nume, d);

	% afisare R2
	fprintf (fid1,'%d\n',R2);
	fprintf (fid1,'\n');

	% R3 = vectorul din a treia functie
	R3 = Power (nume, d, eps);

	% afisare R3
	fprintf (fid1,'%d\n',R3);
	fprintf (fid1,'\n');

	% sortarea vectorului R2 si sortarea vectorului care contine indicii nodurilor de la 1 la N
	[indici, R2] = sortare (R2, N, eps);

	% afisare in fisier a nodurilor si a valorilor de u(R)
	contor = 1;
	while contor < N + 1
		fprintf (fid1,'%d ',contor);
		fprintf (fid1,'%d ',indici(contor));
		
		% gasirea apartenentei
		y = Apartenenta (R2(contor), val1, val2);
		fprintf (fid1,'%d\n',y);
		contor = contor + 1;
	end

	% inchidere fisier de output
	fclose (fid1);
endfunction;