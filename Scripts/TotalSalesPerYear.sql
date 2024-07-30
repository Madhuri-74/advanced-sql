select STRFTIME('%Y',solddate),sum(salesamount) from sales
group by STRFTIME('%Y',solddate)