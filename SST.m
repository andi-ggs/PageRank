function x = SST(A, b)
% Rezolvarea sistemului superior triunghiular pentru aflarea 
% inversei matricei R din functia PR_Inv.m

  [n,n] = size(A);
  x = zeros(n,1);
   for i = n:-1:1 
    x(i) = (b(i)-A(i,i+1:n) * x(i+1:n))/A(i,i);
   endfor
endfunction
