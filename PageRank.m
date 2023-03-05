function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out
  
  % obtinem fisierul de iesire
  fout = sprintf('%s.out', nume);
  
  % Se calculeaza Page Rank-ul prin cele doua metode 
  R1 = Iterative(nume, d, eps);
  R2 = Algebraic(nume, d);
  % parcurgem fisierul pentru extragerea val1 si val2
  fid = fopen(nume, 'r');
  line = fgetl(fid);
  n = sscanf(line, '%f', 1);
  for i = 1:n+1
    line = fgetl(fid);
  endfor
  val1 = sscanf(line, '%f', 1);
  line = fgetl(fid);
  val2 = sscanf(line, '%f', 1);
  
  % scriem numarul N si vectorii R1 si R2 in fisierul de iesire
  
  f = fopen(fout, 'w');
  fprintf(f, '%d\n', n);
  fprintf(f, '\n');
  fprintf(f, '%.6f\n', R1);
  fprintf(f, '\n');
  fprintf(f, '%.6f\n', R2);
  fprintf(f, '\n');
  
  % sortam descrescator R2 si calculam gradul de apartenenta
  % in unsorted retinem pozitia valorilor in vectorul nesortat
  [PR2 unsorted] = sort(R2, 'descend');
  for i = 1:n
    y = Apartenenta(PR2(i), val1, val2);
    % scriem datele in fisierul de iesire, conform cerintei 3
    fprintf(f, '%d %d %.6f\n', i, unsorted(i), y);
  endfor
 fclose(fid);
 fclose(f);
 endfunction
  
  