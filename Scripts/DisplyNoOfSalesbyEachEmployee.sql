with cte as(
select employeeID,STRFTIME('%Y-%m',solddate) as SoldMonth,soldDate,salesAmount
from sales
)
select cte.employeeID,firstname,lastname,SoldMonth,sum(salesAmount) as NoOfSales
from cte
join employee e on cte.employeeId=e.employeeId
where STRFTIME('%Y',soldDate)='2021'
group by cte.employeeID,firstname,lastname
order by SoldMonth

----------------------------------
--2nd Method

select e.employeeId,firstName,lastName,
      case when STRFTIME('%m',soldDate)='01' then  SalesAmount end as JanSales,
      case when STRFTIME('%m',soldDate)='02'  then SalesAmount end as FebSales,
      case when STRFTIME('%m',soldDate)='03'  then SalesAmount end as MarSales,
      case when STRFTIME('%m',soldDate)='04'  then SalesAmount end as AprSales,
      case when STRFTIME('%m',soldDate)='05'  then SalesAmount end as MaySales,
      case when STRFTIME('%m',soldDate)='06'  then SalesAmount end as JunSales,
      case when STRFTIME('%m',soldDate)='07'  then SalesAmount end as JulSales,
      case when STRFTIME('%m',soldDate)='08'  then SalesAmount end as AugSales,
      case when STRFTIME('%m',soldDate)='09'  then SalesAmount end as SepSales,
      case when STRFTIME('%m',soldDate)='10' then  SalesAmount end as OctSales,
      case when STRFTIME('%m',soldDate)='11' then  SalesAmount end as NovSales,
      case when STRFTIME('%m',soldDate)='12' then  SalesAmount end as DecSales
from employee e 
join Sales s on e.employeeId=s.employeeId
WHERE STRFTIME('%Y',soldDate)='2021'
group by e.employeeId,firstName,lastName
order by firstName,lastName asc



