using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class CustomerList
{
    //internal list of items and the constructor that instantiates it
    private List<Customer> customers;

    public CustomerList()
    {
        customers = new List<Customer>();
    }

    //counts the customers in the CustomerList()
    public int Count
    {
        get
        {
            return customers.Count;
        }
    }

    //gets the customer based on the index value in the list
    public Customer this[int index]
    {
        get
        {
            return customers[index];
        }
        set
        {
            customers[index] = value;
        }
    }

    public Customer this[string name]
    {
        get
        {
            foreach (Customer c in customers)
            {
                if (c.Name == name)
                    return c;
            }
            return null;
        }
    }
    
    //static method to get the customer object from the session state
    public static CustomerList GetCustomers()
    {
        CustomerList customers = (CustomerList)HttpContext.Current.Session["Customers"];
        if (customers == null)
        {
            HttpContext.Current.Session.Add("Customers", new CustomerList());
        }
        return (CustomerList)HttpContext.Current.Session["Customers"];
    }
    
    //Add items to internal list
    public void AddItem (Customer customer)
    {
        customers.Add(customer);
    }

    //removes customer from the list at the selected index
    public void RemoveAt(int index)
    {
        customers.RemoveAt(index);
    }

    //clear the entire list of customers
    public void Clear()
    {
        customers.Clear();
    }
}