% 获取仓位及账面价值情况
function balance = ptf_return(~)
portfolioData = IBMatlab('action','portfolio');
account = IBMatlab('action','account_data');
cash= account.TotalCashBalance.value;
value=[];
stockMktValue=0;
for i = 1:length(portfolioData)
value(i)=portfolioData(i).marketValue;
stockMktValue=stockMktValue+value(i);
end
balance = cash + stockMktValue;
end