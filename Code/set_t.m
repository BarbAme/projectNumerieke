function [t] = set_t(x)
   n = length(x);
   afstand = x(n)-x(n-1);
   t = zeros(1,n+6);
   
   %x kopieren naar t
   for i = 1:n
       t(i+3) = x(i);
   end
   
   %3 punten vooraan toevoegen
   for i = 3:-1:1
       t(i) = t(i+1)-afstand;
   end
    
   %3 punten achteraan toevoegen
   for i = n+4:n+6
       t(i) = t(i-1)+afstand;
   end
end