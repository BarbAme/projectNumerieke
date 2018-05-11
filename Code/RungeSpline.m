function RungeSpline()
Emax = zeros(26,1); %lijst met maximale interpolatiefouten


    for n =5:30
        
        %Runge functie
        r = @(x) 1./(1+ 25*x.^2);
        
        %n equidistante punten
        x = linspace(-1,1,n);
        
        %functiewaarden
        f = r(x);
        
        %coëfficiënten
        c = spline_coeff(x,f);
        
        %deBoor 
        t = set_t(x);
        p = linspace(-1,1,1000);
        s = deBoor(t,c,p);
        fp = r(p);
        
        %max interpolatiefout
        Emax(n-4) = max(abs(s-fp));

    end
%grafiek plotten
xx = linspace(5,30,26);
yy = Emax;
plot(xx,yy);

end
