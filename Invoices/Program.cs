using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Invoices
{
    class Program
    {
        static void Main(string[] args)
        {
            List<object> products = new List<object>();

            string query = @"
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

";

            using (SqlConnection connection = new SqlConnection("Data Source = (LocalDB)\\MSSQLLocalDB; AttachDbFilename = \"C:\\Users\\TJB\\Documents\\workspaceW\\Invoices\\Invoices\\Invoices\\Invoices.mdf\"; Integrated Security = True"))
            using (SqlCommand cmd = new SqlCommand(query, connection))
            {
                connection.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    // Check is the reader has any rows at all before starting to read.
                    if (reader.HasRows)
                    {
                        // Read advances to the next row.
                        while (reader.Read())
                        {
                            Console.WriteLine("{0}, {1}, {2}, {3}, {4}, {5}, {6}, {7}, {8}, {9}",
                                reader[0], reader[1], reader[2], reader[3], reader[4], reader[5], reader[6], reader[7], reader[8], reader[9]);
                        }

                    }
                }
            }
        }
    }
}