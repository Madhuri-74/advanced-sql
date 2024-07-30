SELECT STRFTIME('%Y',soldDate) as soldYear,
       STRFTIME('%m',soldDate) as soldMonth,
      count(i.modelId) as Sold_CurrentMonth,
      lag(count(i.modelId),1,0) over ( order by STRFTIME('%Y',soldDate), STRFTIME('%m',soldDate) asc) as Sold_PrevMonth
 from sales s
 join inventory i on s.inventoryId=i.inventoryId
 join model m on i.modelId=m.modelId
 group by STRFTIME('%Y',soldDate), STRFTIME('%m',soldDate) 
 order by soldDate asc
