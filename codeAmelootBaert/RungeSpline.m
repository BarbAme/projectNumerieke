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
        z = linspace(-1,1,1000);
        s = deBoor(t,c,z);
        rz = r(z);
        
        %max interpolatiefout
        Emax(n-4) = max(abs(s-rz));

    end
%grafiek plotten


xx = linspace(5,30,26);
yy = Emax;
plot2_4 = plot(xx,yy);
title('Plot opdracht 2.4');
xlabel('n') % x-axis label
ylabel('E\_max') % y-axis label
saveas(plot2_4,'plot2_4','png')

end
