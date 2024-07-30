select employeeID,min(salesamount) as least_expensive,
max(salesamount) as most_expensive
from sales
where STRFTIME('%Y',solddate)='2023'
group by employeeID

