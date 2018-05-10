function [result] = evalDerivativeBspline(index,k,t,x,m);
i = index + 1;
    if (k<=1)
        
        %eerste term
        first = (k)/(t(i+k)-t(i)).*evalDerivativeBspline_klad(index,k-1,t,x,m-1);
        
        %tweede term
        second = (k)/(t(i+k+1)-t(i+1))*evalDerivativeBspline_klad(index+1,k-1,t,x,m-1);
        
        result = first - second;
    else %k = 0
        %eerste term
        first = (k)/(t(i+k)-t(i)).*evalBspline(index,k-1,t,x);
        
        %tweede term
        second = (k)/(t(i+k+1)-t(i+1))*evalBspline(index+1,k-1,t,x);
        
        result = first - second;
    end
end