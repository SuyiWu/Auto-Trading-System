function Data(Symbol,short,long)
 handles = guihandles();
 IBdat = IBMatlab('action','history', 'symbol',Symbol, 'barSize','3 mins', 'useRTH',1 , 'DurationValue', 1, 'DurationUnits', 'D','EndDateTime', '20190503 16:00:00' ) ;
 Table = transpose(IBdat.close);
 Time = transpose(IBdat.dateTime);


 newIBdat = IBMatlab('action','history','symbol',Symbol,'barSize','3 mins','useRTH',0);
 newTable = transpose(newIBdat.close);
 Table2 = vertcat(Table,newTable);
 ma_s = movmean(Table2,short);
 ma_l = movmean(Table2,long);
 
 NewTime = transpose(newIBdat.dateTime);
 Time2 = vertcat(Time,NewTime);

 buy = [];
 sell = [];
% find out golden folk
for i = 3:length(Table2)
    if ma_s(i-1) < ma_l(i-1) && ma_s(i) >= ma_l(i)
        buy = [buy;i];
    elseif ma_s(i-1) > ma_l(i-1) &&  ma_s(i) <= ma_l(i) && ~isempty(buy) && length(buy)>length(sell)
        sell = [sell;i];
    end
end

% if we still have stock on hand, we could sell it in the end
if length(buy) > length(sell)
    sell= [sell;length(Table2)];
elseif length(buy) < length(sell)
    sell = sell(1:length(buy)-1);
end

for i = 1:length(sell)
    r(i) = ((Table2(sell(i)) - Table2(buy(i))) ./ Table2(buy(i)))+1;
end
% find out cummulated return
total_r= cumprod(r);
onemonth_return = total_r(end)
% plot return
ax(1) = subplot(2,1,1);
plot(total_r);grid on;
legend('Return');
title(['Return of MA Model']);
ax(2) = subplot(2,1,2);
y = cat(2,Table2,ma_s,ma_l);
plot(1:length(Table2),y);
title(['Closing Price']);grid on;
legend('Close','Lead','Lag');
xticklabels(Time2);

end
        

