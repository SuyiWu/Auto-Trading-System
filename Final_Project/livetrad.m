% 自动交易主程序
% amount means how many shares you wish to buy in each BUY action
function livetrad(symbol,amount)
handles = guihandles();
data=hist(symbol);
now = datetime('now');
ystd = datetime(datetime('yesterday').Year,datetime('yesterday').Month,...
    datetime('yesterday').Day,16,0,0);
tody = datetime(datetime('today').Year,datetime('today').Month,...
    datetime('today').Day,16,0,0);
dateformat = 'YYYYMMDD hh:mm:ss';
balance = [];
time=[];
balance(1)=ptf_return;
time(1)=datenum(now);
retn=0;
while (now.Hour<16 && ((now.Hour==9 && now.Minute>=30)||now.Hour>=10))
     % get current ask & bid quotes
     data_crnt = IBMatlab('action','query', 'symbol',symbol); 
     data_crnt_ask = data_crnt.askPrice;
     data_crnt_bid = data_crnt.bidPrice;
     data_crnt_mid = (data_crnt_bid+data_crnt_ask)/2;
     data_crnt_date = datenum(datetime('now'));
     data_new = [data_crnt_mid,data_crnt_date];
     data=vertcat(data,data_new);
     % auto-trading
     signal = get_signal(data);
     quant = cal_quant(symbol,signal);
     disp(quant)
     if (signal == 1)
         quant=min(amount,quant);
         orderId = IBMatlab('action','BUY','Symbol',symbol,'Quantity',quant,...
                            'Type','MKT');
     elseif(signal == -1)
         quant=min(amount,quant);
         orderId = IBMatlab('action','SELL','Symbol',symbol,'Quantity',quant,...
                            'Type','MKT');
     end
balance(end+1) = ptf_return;
time(end+1) = data_crnt_date;

%figure

subplot(2,1,1)
x_stock=datetime(datestr(data(:,2),'HH:MM:SS'));
plot(x_stock,data(:,1))
title(['Stock Price'])
subplot(2,1,2)
x=datetime(datestr(time,'HH:MM:SS'));
plot(x,balance);
title(['Account Balance'])
%hold on

retn=string((balance(end)/balance(1)-1)*100+"%");
disp(retn)

pause(60);
end
end