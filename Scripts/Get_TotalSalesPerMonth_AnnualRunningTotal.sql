with cte as(
select STRFTIME('%Y',soldDate) as soldYear,
       STRFTIME('%m',soldDate) as soldMonth,
       --row_number() over (partition by STRFTIME('%Y',soldDate),STRFTIME('%m',soldDate) order by SoldDate asc) as Saledate,
       sum(salesAmount) as TotalSalesperMonth

from sales
group by STRFTIME('%Y',soldDate),STRFTIME('%m',soldDate)
)
select soldYear,SoldMonth,TotalSalesperMonth,
sum(TotalSalesperMonth) over( partition by soldyear order by soldyear,soldmonth) as AnnualSales_RunningTotal
from cte
order by soldyear,soldmonth