function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1
  a = 1 / (val2 -val1);
  b = - val1 / (val2 - val1);
  % rezultatele obtinute pentru a si b in urma conditiei ca
  % u(x) sa fie continua
  
  % analizam cele 3 cazuri
    if x < val1 
      y = 0;
    elseif x >= val1 && x <= val2
      y = a.*x + b;
    elseif x > val2
      y = 1;
     endif 
     
 endfunction
