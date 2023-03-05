function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
  fid = fopen(nume, 'r');
  line = fgetl(fid); % se extrage prima linie din fisier
  sz = sscanf(line, '%f', 1); % se converteste la elemente de tipul float
  A = zeros(sz); % matricea de adiancenta
  K = zeros(sz); % matricea diagonala din formula
  One = ones(sz, 1); %vectorul coloana 1
  % R = zeros(sz, 1);
    for i = 1:sz % parcurgem fisierul
      line = fgetl(fid); % avansam cu o linie
      c  = sscanf(line, '%f'); 
      % linia se converteste la un vector cu elemente de tip float
      K(i,i) = c(2);
      % pe diagonala matricei K se adauga al doilea element din vector,
      % adica numarul de vecini pentru fiecare nod
      c1 = c(1); % primul nod din fiecare linie citita
      size = numel(c); 
      % dimensiunea vectorului in care este stocat nodul si vecinii sai
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
         A(i,a) = 0; % pe diagonala principala matricea de adiacenta are doar 0-uri
        else
         A(i,a) = 1; % se creeaza matricea de adiacenta
       endif
      endfor
    endfor
    M = zeros(sz);
    M = PR_Inv(K)*A; 
    M = M'; % matricea M din formula data
    I = eye(sz);
##    B = I - d*M;
##    R1 = PR_Inv(B);
##    R(1:sz) = 1 / sz;
##    R = R';
    R =PR_Inv(I - d*M)*(((1-d)/sz)*One);
 fclose(fid);
 endfunction