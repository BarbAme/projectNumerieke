function RungeVeelterm()
Emax = zeros(26,1); %lijst met maximale interpolatiefouten

for n =5:30        
    %Runge functie
    r = @(x) 1./(1+ 25*x.^2);

    %n equidistante punten
    x = linspace(-1,1,n);

    %functiewaarden
    f = r(x);

    %vector met waarden waarin de veelterm geevalueerd moet worden
    z = linspace(-1,1,1000);

    y = evalueer_lagrange(x,f,z);
    rz = r(z);
        
    %max interpolatiefout
    Emax(n-4) = max(abs(y-rz));

 end
%grafiek plotten
xx = linspace(5,30,26);
yy = Emax;
plot(xx,yy);
end