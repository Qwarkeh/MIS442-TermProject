<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerDisplay.aspx.cs" Inherits="MIS442_TermProject_CStark.CustomerDisplay" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="mainPlaceHolder" runat="server">
<style type="text/css">
        .auto-style1 {
            width: 229px;
        }
        .auto-style2 {
            width: 71px;
        }
        .auto-style3 {
            width: 175px;
        }
    </style>



<h2>Customer Display</h2>

 <div class="row"><%-- row 1 --%>
                <div class="col-sm-8"><%-- customer drop down and info column --%>
                    <div class="form-group">
                        <label class="col-sm-12">Please select a Customer:</label>
                            <asp:DropDownList ID="ddlCustomers" runat="server" AutoPostBack="True" 
                                DataSourceID="SqlDataSource1" DataTextField="Name" 
                                DataValueField="CustomerID" CssClass="form-control">
                            </asp:DropDownList>
                        <div class="col-sm-6">

                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CustomerID], [Name], [Address], [City], [State], [Zipcode], [PhoneNumber], [Email] FROM [Customers] ORDER BY [Name]"></asp:SqlDataSource>


        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Address:</td>
                <td class="auto-style3">
                    <asp:Label ID="lblAddress" runat="server" Text="Street Address"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    <asp:Label ID="lblCityStateZip" runat="server" Text="City, State Zipcode"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Phone:</td>
                <td class="auto-style3">
                    <asp:Label ID="lblPhoneNumber" runat="server" Text="Phone Number"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Email:</td>
                <td class="auto-style3">
                    <asp:Label ID="lblEmail" runat="server" Text="Email@address.com"></asp:Label>
                </td>
            </tr>
        </table>

               </div>
                </div>
            </div><%-- end of row 1 --%>
        </div>
        <asp:Button ID="btnAddToContactList" runat="server" Text="Add To Contact List" OnClick="btnAddToContactList_Click" />&nbsp;
        <asp:Button ID="btnDisplayContactList" runat="server" Text="Display Contact List" PostBackUrl="~/ContactDisplay.aspx" />

        <br />
        <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>

</asp:Content>