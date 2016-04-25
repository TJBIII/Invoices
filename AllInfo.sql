SELECT
	p.IdProduct,
	p.Description,
	p.Name as ProductName,
	p.Price,
	p.IdProductType,
	pt.Name as ProductTypeName,
	op.IdOrder,
	co.OrderNumber,
	co.dateCreated,
	co.shipping,
	c.FirstName + ' ' + c.LastName as FullName,
	po.Name,
	po.AccountNumber
FROM Product p
INNER JOIN ProductType pt
ON p.IdProductType = pt.IdProductType
INNER JOIN OrderProducts op
ON op.IdProduct = p.IdProduct
INNER JOIN CustomerOrder co
ON co.IdOrder = op.IdOrder
INNER JOIN Customer c
ON c.IdCustomer = co.IdCustomer
INNER JOIN PaymentOption po
ON po.IdCustomer = c.IdCustomer
ORDER BY p.Price ASC
