select e.firstName,e.lastname,e.title,m.firstName as Manager_FirstName,m.lastName as Manager_LastName
from employee e
left join employee m on e.managerID=m.employeeID