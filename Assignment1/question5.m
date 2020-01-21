function [sum]= question5()
    function y = cal(x)
        y = (sin(x) + x) *(1/x^2);
    end
sum = 0;
k = 1;
    while cal(k)>10^(-5)
    sum = sum+cal(k);
    k = k+1;
    end
end
