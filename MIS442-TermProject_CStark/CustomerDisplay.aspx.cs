using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data; //enables DataView

namespace MIS442_TermProject_CStark
{
    public partial class CustomerDisplay : System.Web.UI.Page
    {
        private Customer selectedCustomer;
        protected void Page_Load(object sender, EventArgs e)
        {
            //bind dropdown on first load; get and show customer data on every load
            if (!IsPostBack) ddlCustomers.DataBind();
            selectedCustomer = this.GetSelectedCustomer();

            DisplayCustomer();
        }

        private Customer GetSelectedCustomer()
        {
            DataView customersTable = (DataView)
                SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            customersTable.RowFilter =
                "CustomerID = '" + ddlCustomers.SelectedValue + "'";
            DataRowView row = customersTable[0];

            //create new customer object and load it with data from the row
            Customer c = new Customer();
            c.CustomerID = row["CustomerID"].ToString();
            c.Name = row["Name"].ToString();
            c.Address = row["Address"].ToString();
            c.State = row["State"].ToString();
            c.City = row["City"].ToString();
            c.Zipcode = row["Zipcode"].ToString();
            c.PhoneNumber = row["PhoneNumber"].ToString();
            c.Email = row["Email"].ToString();
            return c;
        }
        
        private void DisplayCustomer()
        {
            lblAddress.Text = selectedCustomer.Address;
            lblCityStateZip.Text = selectedCustomer.City + ", " + selectedCustomer.State + " " + selectedCustomer.Zipcode;
            lblPhoneNumber.Text = selectedCustomer.PhoneNumber;
            lblEmail.Text = selectedCustomer.Email;
        }

        protected void btnAddToContactList_Click(object sender, EventArgs e)
        {
            CustomerList contacts = CustomerList.GetCustomers();
            Customer customer = contacts[selectedCustomer.Name];
            if (customer == null)
            {
                contacts.AddItem(selectedCustomer);
                Response.Redirect("~/ContactDisplay.aspx");
            }
            else
            {
                lblErrorMessage.Text = "This customer is already in the contact list.";
            }
        }
    }
}