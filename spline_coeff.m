function [c] = spline_coeff(x,f)
   n = length(x);
   m = n+2; %dimensie matrix
   A = zeros(m,m);
   B = zeros(m,1);
   t = set_t(x);

   %MATRIX A
   %matrix A, rij 1, kolom 1,2,3
   for j = 1:3
       index= -4+j;
       A(1,j) = evalDerivativeBspline(index+3,3,t,x(0+1),2);
   end
   %matrix A, rij 2 tem voorlaatste
   for i = 2:n+1
       for j = i:i+2 % de 3 in te vullen kolommen
           index = -4+j;
           
           A(i,j-1) = evalBspline(index+2,3,t,x(i-1));
       end
   end
   %matrix A, laatste rij 
   for j = n+1:n+3
       index = -4+j;
       A(n+2,j-1) = evalDerivativeBspline(index+2,3,t,x(n),2);
   end
   
  % MATRIX B
   %eerste en laatste rij moeten 0 blijven
   %matrix B, rij 2 tem voorlaatste
   for i = 2:n+1
       B(i) = f(i-1);
   end
   
  % STELSEL OPLOSSEN
   c = A\B;

end
