function [result] = evalBspline(index,k,t,x)
    i = index;
    if (k == 0)
        if ((t(i) <= x )&&(x<t(i+1)))
            result = 1;
        else
            result = 0;
        end
    else   
        %eerste term
        first = ((x-t(i))/(t(i+k)-t(i))*evalBspline(index,k-1,t,x));
        
        %tweede term

        second = ((t(i+k+1)-x)/(t(i+k+1)-t(i+1)))*evalBspline(index+1,k-1,t,x);
        % N i,k(x)
        result = first+second;
    end
   
end