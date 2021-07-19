using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Incident
{
    // From Invoices table
    public int InvoiceNumber { get; set; }
    public int CustomerID { get; set; }
    public DateTime OrderDate { get; set; }
    public double TotalPrice { get; set; }
    public string CardNumber { get; set; }

    //from Products table
    public int ProductID { get; set; }
    public string Brand { get; set; }
    public string Model { get; set; }
    public string Gender { get; set; }
    public string Size { get; set; }

    public string CustomerIncidentDisplay()
    {
        return "Order information for Invoice " + InvoiceNumber + "on " + OrderDate;
    }
}