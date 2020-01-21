% 历史回测结果
function bcktst(symbol,amount)
handles = guihandles();
cash=100000;
data = hist(symbol);
lnth = length(data);
position = zeros(1,lnth);
balance = [100000];
action = [];
MACD = movmean(data(:,1),12)-movmean(data(:,1),26);
for i = 2:length(MACD)
    if (MACD(i)<0 && MACD(i)>MACD(i-1))
        action(i)=1;
    elseif (MACD(i)>0 && MACD(i)<MACD(i-1))
        action(i)=-1;
    else
        action(i)=0;
    end   
end

for i = 2:length(action)
    if (action(i) == 1 && cash>0) 
        %如果账上有钱，则定额买入20股，如果不足20股，则买至现金为0
        amount_new = min(amount,fix(cash/data(i,1)));
        position(1,i) = position(1,i-1)+action(i) * amount_new;
        cash = cash-action(i) * amount_new * data(i,1);
    elseif (action(i) == -1 && position(1,i-1)>0)
        %如果账上持股不为0，则定额卖出20股，如果不足20股，则卖出至账面为0
        amount_new = min(amount,position(1,i-1));
        position(1,i)= position(1,i-1)+action(i) * amount_new;
        cash = cash-action(i) * amount_new * data(i,1);
    else
        position(1,i)=position(1,i-1);
    end
    balance(end+1)=cash+position(1,i)*data(i,1);    
end
time=datetime(datestr(data(:,2),'HH:MM:SS'));

%figure
ax(1)=subplot(2,1,1);
plot(time,balance);grid on;
legend('Account balance');
title(['Back Testing Results']);
ax(2)=subplot(2,1,2);
plot(time,position);grid on;
title(['Position']);
end