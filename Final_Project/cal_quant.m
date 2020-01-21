% 可买入、卖出量
function amount = cal_quant(symbol,signal)
account = IBMatlab('action','account_data');
data=IBMatlab('action','query','symbol',symbol);
cash= account.TotalCashBalance.value;
portfolioData = IBMatlab('action','portfolio','type','positions');
if (signal==1)
    price = data.askPrice;
    amount = fix(cash/price);
elseif(signal==-1)
    price = data.bidPrice;
    if isempty(portfolioData) %如果账户是空，那么position是0
        position = 0;
    else
        symbols = {portfolioData.localSymbol};%如果账户持仓不为空，那么返回position
        idx = strcmpi(symbol, symbols);
        position = portfolioData(idx).position;
        if isempty(position)
            position = 0;
        end
    end
    amount = fix(position/price);
else
    amount = 0;
end
end