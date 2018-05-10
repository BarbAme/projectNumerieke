function [y] = evalueer_lagrange(x,f,z)
%ALGORITME 4.1 p 101 in boek
%   Interpolerende veelterm volgens Lagrange

n = length(x);
n2 = length(z);
y = zeros(1,n2);
for b = 1:n2
    for i = 1:n
        t = f(i);
        for j = 1:n
            if (i ~= j)
                t = t*(z(b)-x(j))/(x(i) - x(j));
            end
        end
        y(b) = y(b)+t;
    end
end