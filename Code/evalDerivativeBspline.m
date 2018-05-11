function [result] = evalDerivativeBspline(index,k,t,x,m);
i = index ;

    if (m == 0)
        result = evalBspline(index,k,t,x);
    else
        if (k>=1)

            %eerste term
            first = (k)/(t(i+k)-t(i))*evalDerivativeBspline(index,k-1,t,x,m-1);

            %tweede term
            second = (k)/(t(i+k+1)-t(i+1))*evalDerivativeBspline(index+1,k-1,t,x,m-1);

            result = first - second;

        else % k = 0
            if ((t(i) <= x )&&(x<t(i+1)))
                result = 1;
            else
                result = 0;
            end
        end
    end
end