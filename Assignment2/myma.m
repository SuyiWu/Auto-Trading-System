function ma = myma(price,n)
% price is the close price of stock
% n is the moving average window for mean average 
len = length(price);
% check for nan 
ma = nan(len,1);
% calculate the moving average for n days
for i = n:len
    ma(i) = sum(price(i-n+1:i))/n;
end

end

