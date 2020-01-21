% 获取历史价格数据
function data_hist=hist(symbol)
now = datetime('now');
ystd = datetime(datetime('yesterday').Year,datetime('yesterday').Month,...
    datetime('yesterday').Day,16,0,0);
tody = datetime(datetime('today').Year,datetime('today').Month,...
    datetime('today').Day,16,0,0);
dateformat = 'YYYYmmDD hh:MM:ss';
    if (now.Hour>=16) %过了交易时间段
        try
        IBdata = IBMatlab('action','history','symbol',symbol,'barsize',...
            '1 min','useRTH',1,'DurationValue',1,'DurationUnits',...
            'D','EndDateTime',datestr(tody,dateformat));
        Table = transpose(IBdata.close);
        Time = transpose(IBdata.dateNum);
        data_hist = [Table,Time];
        catch err
            disp(err.Message);
        end
        
    elseif (now.Hour==9 && now.Minute<30 || now.Hour<9) %没到交易时间段
        try
        IBdata = IBMatlab('action','history','symbol',symbol,'barsize',...
            '1 min','useRTH',1,'DurationValue',1,'DurationUnits',...
            'D','EndDateTime',datestr(ystd,dateformat));
        Table = transpose(IBdata.close);
        Time = transpose(IBdata.dateNum);
        data_hist = [Table,Time];
        catch err
            disp(err.Message);
        end

    else %交易时间段
        try
        IBdata_tody = IBMatlab('action','history','symbol',symbol,'barsize',...
            '1 min','useRTH',0,'DurationValue',1,'DurationUnits',...
            'D','EndDateTime',datestr(tody,dateformat));
        Table = transpose(IBdata_tody.close);
        Time = transpose(IBdata_tody.dateNum);
        data_hist = [Table,Time];
        catch err
            disp(err.Message);
        end
    end   
end