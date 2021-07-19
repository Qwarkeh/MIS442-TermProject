using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Customer
{
    //TODO Alter The database table to change CustomerID to a string sometime
    // Alter the table to add Shipping Information columns (turns out I know nothing about running a store)
    public string CustomerID { get; set; }
    public string Name { get; set; }
    public string Address { get; set; }
    public string State { get; set; }
    public string City { get; set; }
    public string Zipcode { get; set; }
    public string PhoneNumber{ get; set; }
    public string Email{ get; set; }
    
    public string ContactDisplay()
    {
        return Name + ": " + PhoneNumber + "; " + Email;
    }
}