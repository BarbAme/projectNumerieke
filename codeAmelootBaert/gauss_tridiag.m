function [x, L_sub, U_hoofd, U_super, y] = gauss_tridiag(A_sub, A_hoofd, A_super, b)

%n = dimensie van de vierkante matrix A = dimensie b
n = length(A_hoofd);

%eerste element U_hoofd
U_hoofd(1) = A_hoofd(1);
%eerste element y
y(1) = b(1);

%voorwaartse substitutie om L_sub, U_hoofd en y berekenen (en U_super te overschrijven)
for k = 2:n
    %subdiagonaal van L
    L_sub(k-1) = A_sub(k-1)/U_hoofd(k-1);
    
    %hoofddiagonaal van U
    U_hoofd(k) = A_hoofd(k)-(L_sub(k-1)*A_super(k-1));
    
    %y
    y(k) = b(k) - (L_sub(k-1)*y(k-1));
    
    %superdiagonaal van U = superdiagonaal van A
    U_super(k-1) = A_super(k-1);
end

%laatste element x
x(n) = y(n)/U_hoofd(n);

%achterwaartse substitutie om x te berekenen
for k =n-1:-1:1
    x(k) = (y(k) - A_super(k)*x(k+1))/U_hoofd(k);
end
end
