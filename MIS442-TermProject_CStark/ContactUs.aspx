<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="MIS442_TermProject_CStark.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="mainPlaceHolder" runat="server">
    <h2><%: Title %>Contact Us</h2>
    <address>
        1234 Main St<br />
        Klamath Falls, OR 97601<br />
        <br />
        <abbr title="Phone">P:</abbr>
        (123) 456-7890
    </address>

    <address>
        <strong>Email:</strong>   <a href="mailto:SoleSurvivor@solesurvivor.com">SoleSurvitor@solesurvivor.com</a><br />
    </address>
</asp:Content>
