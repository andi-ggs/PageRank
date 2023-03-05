function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eroarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
  
  fid = fopen(nume, 'r');
  line = fgetl(fid);
  sz = sscanf(line, '%f', 1);
  A = zeros(sz); %matricea de adiancenta
  K = zeros(sz);
  One = ones(sz, 1); %vectorul coloana 1
  R = zeros(sz,1 ); % vectorul PageRank
  R1 = zeros(sz, 1);
    for i = 1:sz 
      line = fgetl(fid);
      c  = sscanf(line, '%f');
      % c = c';
      K(i,i) = c(2);
      c1 = c(1);
      size = numel(c);
      for k = 3 : size
        if c1 == c(k) 
          % daca exista pagini care trimit spre sine, 
          % se modifica numarul de vecini din matricea K
          K(i, i) = K(i, i) - 1; 
        endif
      endfor
      for j = 1: (size - 2)
        a = c(j+2);
       if i == a
         A(i,a) = 0; 
        else
         A(i,a) = 1; % se creeaza matricea de adiacenta
       endif
      endfor
    endfor
    M = zeros(sz);
    K1 = PR_Inv(K);
    M = (K1*A)';
    R(1:sz) = 1/sz;
    while (eps <= norm(R-R1))
      R1=R;
      R = d*M*R + (((1-d)/sz).*One);
    endwhile
  fclose(fid);
 endfunction  