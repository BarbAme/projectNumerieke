function [result] = evalBspline_klad(index,k,t,x)
    i = index +1;
    if (k == 0)
        if ((t(i) <= x )&&(x<t(i+1)))
            result = 1;
        else
            result = 0;
        end
    else   
        %eerste term
        first = ((x-t(i))/(t(i+k)-t(i)).*evalBspline_klad(index,k-1,t,x));
        
        %tweede term
        second = ((t(i+k+1)-x)/(t(i+k+1)-t(i+1))).*evalBspline_klad(index+1,k-1,t,x);
        % N i,k(x)
        result = first+second;
    end
end