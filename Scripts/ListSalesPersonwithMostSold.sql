select e.firstName,e.lastName,m.model ,count(m.modelId) as NumberSold,
rank() over (partition by s.employeeId order by count(m.modelId) desc) as rank_assigned
from sales s
join employee e on s.employeeId=e.employeeId
join inventory i on s.inventoryId=i.inventoryId
join model m on i.modelId=m.modelId
group by e.firstName,e.lastName,m.modelId
