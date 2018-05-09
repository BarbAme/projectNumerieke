function [x, L_sub, U_hoofd, U_super, y] = gauss_tridiag(A_sub, A_hoofd, A_super, b)

n = length(A_hoofd);

U_hoofd(1) = A_hoofd(1);

y(1) = b(1);
for k = 2:n
    L_sub(k-1) = A_sub(k-1)/U_hoofd(k-1);
    U_hoofd(k) = A_hoofd(k)-(L_sub(k-1)*A_super(k-1));
    y(k) = b(k) - (L_sub(k-1)*y(k-1));
    U_super(k-1) = A_super(k-1);
end

x(n) = y(n)/U_hoofd(n);
for k =n-1:-1:1
    x(k) = (y(k) - A_super(k)*x(k+1))/U_hoofd(k);
end

%niet nodig bij uiteindelijke versie
g=sprintf('%d ', x);
fprintf('Answer x: %s\n', g)
q=sprintf('%d ', L_sub);
fprintf('Answer L_sub: %s\n', q)
p=sprintf('%d ', U_hoofd);
fprintf('Answer U_hoofd: %s\n', p)
a=sprintf('%d ', U_super);
fprintf('Answer U_super: %s\n', a)
c=sprintf('%d ', y);
fprintf('Answer y: %s\n', c)