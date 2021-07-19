using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MIS442_TermProject_CStark
{
    public partial class ContactDisplay : System.Web.UI.Page
    {
        private CustomerList contacts;
        protected void Page_Load(object sender, EventArgs e)
        {
            contacts = CustomerList.GetCustomers();

            if (!IsPostBack)
            {
                DisplayContacts();
            }
        }

        protected void DisplayContacts()
        {
            lstContacts.Items.Clear();
            for (int i = 0; i < contacts.Count; i++)
            {
                lstContacts.Items.Add(contacts[i].ContactDisplay());
            }
        }

        protected void btnRemoveContact_Click(object sender, EventArgs e)
        {
            if (lstContacts.SelectedIndex > -1 && contacts.Count > 0)
            {
                contacts.RemoveAt(lstContacts.SelectedIndex);
                DisplayContacts();
            }
        }

        protected void btnEmptyList_Click(object sender, EventArgs e)
        {
            contacts.Clear();
            lstContacts.Items.Clear();
        }
    }
}