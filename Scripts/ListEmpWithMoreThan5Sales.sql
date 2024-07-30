select e.EmployeeID,e.FirstName,e.LastName,count(*) as NoOfCarsSold
from employee e 
join Sales s on e.employeeID=s.employeeID
where STRFTIME('%Y',solddate)='2023'
group by e.employeeID
having count(distinct salesID) > 5