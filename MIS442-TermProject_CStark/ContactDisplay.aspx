<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContactDisplay.aspx.cs" Inherits="MIS442_TermProject_CStark.ContactDisplay" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="mainPlaceHolder" runat="server">
        <header style="font-size: 30px;">Contact Display</header>
        <div>           
        </div>

        <asp:ListBox ID="lstContacts" runat="server" width="1000px"></asp:ListBox>

        <p class="auto-style4">
            <asp:Button ID="Button1" runat="server" Text="Remove Contact" Width="141px" OnClick="btnRemoveContact_Click" />&nbsp;<asp:Button ID="Button2" runat="server" Text="Empty List" Width="141px" OnClick="btnEmptyList_Click" />
        </p>
        <p>
            <asp:Button ID="Button3" runat="server" Text="Select Additional Customers" PostBackUrl="~/CustomerDisplay.aspx"/>
        </p>
</asp:Content>