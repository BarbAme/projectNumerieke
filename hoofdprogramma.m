%%
%Opdracht 1.3
[x, L_sub, U_hoofd, U_super, y] = gauss_tridiag(A_sub, A_hoofd, A_super, b);

%%
%Vraag 1.3.2
A_sub = [12;9;65];
A_hoofd = [5;36;2;11];
A_super = [15;17;31];
b = [4;5;6;7];
[x, L_sub, U_hoofd, U_super, y] = gauss_tridiag(A_sub, A_hoofd, A_super, b);

%%
%Opdracht 2.1
[result] = evalBspline(index,k,t,x);

%%
%Opdracht 2.2
[result] = evalDerivativeBspline(index,k,t,x,m);

%%
%Opdracht 2.3
[c] = spline_coeff(x,f);

%%
%Opdracht 2.4
RungeSpline();

%%
%Opdracht 2.5
RungeVelterm();

