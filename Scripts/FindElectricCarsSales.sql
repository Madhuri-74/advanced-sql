select SalesID
from Sales s
join inventory i on s.inventoryId=i.inventoryId
where i.modelId in (
select modelId from model where EngineType='Electric'
)