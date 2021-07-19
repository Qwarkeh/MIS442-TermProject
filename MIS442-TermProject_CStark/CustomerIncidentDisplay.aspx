<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerIncidentDisplay.aspx.cs" Inherits="MIS442_TermProject_CStark.CustomerIncidentDisplay" %>


    <asp:Content ID="BodyContent" ContentPlaceHolderID="mainPlaceHolder" runat="server">
        <h2>Customer Incident Display</h2>
        <br />

        <style type="text/css">
        .auto-style1 {
            margin-bottom: 0px;
        }
        .auto-style2 {
            left: 0px;
            top: 0px;
            width: 1076px;
        }
        table, th, td{
            border: 2px solid black;
        }
        table th, table td{
            padding: 10px; /* Apply cell padding */
        }
        table tr#ROW1  {
            background-color:gray; color:white;}
        .auto-style11 {
            width: 124px;
        }
        .auto-style12 {
            width: 125px;
        }
        </style>

        <div class="container">

            <div class="form-group">
                <label id="lblInvoice" for="ddlInvoice" style="left: 0px; top: 0px; width: 14%">
                    Choose a Customer:</label>&nbsp
                        <asp:DropDownList ID="ddlCustomers" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="CustomerID" AutoPostBack="True">
                    </asp:DropDownList>
                    &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CustomerID], [Name] FROM [Customers] ORDER BY [Name]"></asp:SqlDataSource>
                <div class="auto-style2">
                    <asp:DataList ID="DataList1" runat="server" CssClass="auto-style1" DataKeyField="InvoiceNumber" DataSourceID="SqlDataSource2" Width="908px" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">

                        <ItemTemplate>
                            <table CssClass="table table-bordered table-striped table-condensed">
                                    <tr id="ROW1">
                                        <td><b>InvoiceID</b></td>
                                        <td><b>ProductID</b></td>
                                        <td><b>Name</b></td>
                                        <td><b>Email</b></td>
                                        <td><b>Date</b></td>
                                        <td><b>Brand</b></td>
                                        <td><b>Model</b></td>
                                        <td><b>Extension</b></td>
                                    </tr>
                                <tr>
                                    <td><asp:Label ID="InvoiceNumberLabel" runat="server" Text='<%# Eval("InvoiceNumber") %>'/></td>
                                    <td><asp:Label ID="ProductIDLabel" runat="server" Text='<%# Eval("ProductID") %>'/></td>
                                    <td><asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' /></td>
                                    <td><asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' /></td>
                                    <td><asp:Label ID="OrderDateLabel" runat="server" Text='<%# Eval("OrderDate") %>' /></td>
                                    <td><asp:Label ID="BrandLabel" runat="server" Text='<%# Eval("Brand") %>' /></td>
                                    <td><asp:Label ID="ModelLabel" runat="server" Text='<%# Eval("Model") %>' /></td>
                                    <td class="auto-style11"><asp:Label ID="ExtensionLabel" runat="server" Text='<%# Eval("Extension") %>' /></td>
                                </tr>
                            </table>
                        </ItemTemplate>

                    </asp:DataList>

                    <br />

                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT LineItems.InvoiceNumber, LineItems.ProductID, Customers.Name, Customers.Email, Invoices.OrderDate, Products.Brand, Products.Model, LineItems.Extension, Customers.CustomerID FROM Customers INNER JOIN Invoices ON Customers.CustomerID = Invoices.CustomerID INNER JOIN LineItems ON Invoices.InvoiceNumber = LineItems.InvoiceNumber INNER JOIN Products ON LineItems.ProductID = Products.ProductID WHERE (Customers.CustomerID = @CustomerID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlCustomers" Name="CustomerID" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
          
                </div>
            </div>

                </div>  
    </asp:Content>

    