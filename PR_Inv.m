function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Se va inlocui aceasta linie cu descrierea algoritmului de inversare
  [n,n]=size(A);
  % Q = eye(n);
  R = zeros(n);
  Q = zeros(n);
  for i = 1 : n
    R(i,i) = norm(A(1:n,i));
    for k = 1 : n
    Q(k,i) = A(k,i) / R(i,i);
    endfor
    for j = i + 1 : n
      R(i,j) = Q(1:n,i)' * A(1:n,j);
     for k = 1 : n
      A(k,j)= A(k,j) - Q(k,i) * R(i,j);
      endfor
    endfor
  endfor
  A = Q*R;
  % Din relatia de mai sus rezulta ca A^(-1) = Q^(-1)*R^(-1),
  % adica B = A^(-1) = R^(-1)*Q';
  % Pentru a putea calcula inversa unei matrice, in prima faza
  % verificam daca matricea este inversabila. 
  if abs(det(A)) < 0.0001 
    disp('Matricea nu e inversabila');
  endif 
    R1 = eye(n ,n);
    for i=1:n
      % Se rezolva SST pentru calculul inversei matricei R
      b = Q' *R1(1:n, i);
      B(1:n,i) = SST(R, b);
    endfor
endfunction  
