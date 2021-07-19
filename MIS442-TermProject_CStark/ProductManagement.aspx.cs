using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MIS442_TermProject_CStark
{
    public partial class ProductManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {

            SqlDataSource1.InsertParameters["ProductID"].DefaultValue = txtProductID.Text;
            SqlDataSource1.InsertParameters["Brand"].DefaultValue = txtBrand.Text;
            SqlDataSource1.InsertParameters["Model"].DefaultValue = txtModel.Text;
            SqlDataSource1.InsertParameters["Gender"].DefaultValue = txtGender.Text;
            SqlDataSource1.InsertParameters["Size"].DefaultValue = txtSize.Text;
            SqlDataSource1.InsertParameters["ImageFile"].DefaultValue = txtImageFile.Text;
            SqlDataSource1.InsertParameters["UnitPrice"].DefaultValue = txtUnitPrice.Text;
            SqlDataSource1.InsertParameters["OnHand"].DefaultValue = txtOnHand.Text;

            try
            {
                SqlDataSource1.Insert();

                txtProductID.Text = "";
                txtBrand.Text = "";
                txtModel.Text = "";
                txtGender.Text = "";
                txtSize.Text = "";
                txtImageFile.Text = "";
                txtUnitPrice.Text = "";
                txtOnHand.Text = "";

            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = $"A database error has occured Message: {ex.Message}";
            }
        }
        protected void grdProducts_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblErrorMessage.Text = $"A database error has occurred. Message: {e.Exception.Message}";
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblErrorMessage.Text = "You tried to delete a record. Another user may have updated this product. Please try again.";
            }
        }

        protected void grdProducts_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblErrorMessage.Text = $"A database error has occured. Message: {e.Exception.Message}";
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblErrorMessage.Text = "You tried to update a record. Another user may have updated that product. Please try again.";
            }
        }

    }
}