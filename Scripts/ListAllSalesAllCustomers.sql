select c.CustomerID,c.firstName,s.salesID from 
customer c full outer JOIN
sales s on c.customerID=s.customerID