% ÂòÈë¡¢Âô³öĞÅºÅ
function signal = get_signal(data)
MACD = movmean(data(:,1),12)-movmean(data(:,1),26);
    if (MACD(end)<0 && MACD(end-1)<MACD(end))
        signal = 1;
    elseif (MACD(end)>0 && MACD(end-1)>MACD(end))
        signal = -1;
    else
        signal = 0;
    end
end