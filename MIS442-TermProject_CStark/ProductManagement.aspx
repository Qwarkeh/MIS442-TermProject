<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductManagement.aspx.cs" Inherits="MIS442_TermProject_CStark.ProductManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainPlaceHolder" runat="server">

    <asp:GridView ID="grdProducts" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="ProductID" DataSourceID="SqlDataSource1"
        BorderColor="Blue" BorderWidth="1px" CellPadding="4"
        ForeColor="#333333" GridLines="None" Width="740px"
        OnRowDeleted="grdProducts_RowDeleted" OnRowUpdated="grdProducts_RowUpdated">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" CausesValidation="false"/>

            <asp:BoundField DataField="ProductID" HeaderText="ProductID" ReadOnly="True" SortExpression="ProductID" />
            <asp:BoundField DataField="Brand" HeaderText="Brand" SortExpression="Brand" />
            <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
            <asp:BoundField DataField="Size" HeaderText="Size" SortExpression="Size" />
            <asp:BoundField DataField="ImageFile" HeaderText="ImageFile" SortExpression="ImageFile" />
            <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
            <asp:BoundField DataField="OnHand" HeaderText="OnHand" SortExpression="OnHand" />
        </Columns>

        <FooterStyle BackColor="#99ccff" Font-Bold="true" ForeColor="White" />
        <RowStyle BackColor="#EFF3FB" Font-Size="Small" />
        <EditRowStyle BackColor="CornflowerBlue" ForeColor="Black" Font-Size="Small" Font-Bold="true" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="true" ForeColor="#333333" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="Blue" Font-Bold="True" Font-Names="Arial" Font-Size="Small" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" Font-Size="Small" />
    </asp:GridView>

     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 

        OldValuesParameterFormatString="original_{0}"

        SelectCommand="Select [ProductID], [Brand], [Brand], [Model], [Gender], [Size], [ImageFile], [UnitPrice], [OnHand]
                       FROM [Products]
                       ORDER BY [ProductID]"

        DeleteCommand="DELETE FROM [Products] WHERE [ProductID] = @original_ProductID"

        InsertCommand="INSERT INTO [Products] ([ProductID], [Brand], [Model], [Gender], [Size], [ImageFile], [UnitPrice], [OnHand]) 
                       VALUES (@ProductID, @Brand, @Model, @Gender, @Size, @ImageFile, @UnitPrice, @OnHand)"

        UpdateCommand="UPDATE [Products] 
                       SET [Brand] = @Brand, [Model] = @Model, [Gender] = @Gender, [Size] = @Size, [ImageFile] = @ImageFile, [UnitPrice] = @UnitPrice, 
                                     [OnHand] = @OnHand
                       WHERE [ProductID] = @original_ProductID 
                             AND [Brand] = @original_Brand
                             AND [Model] = @original_Model
                             AND [Gender] = @original_Gender
                             AND [Size] = @original_Size
                             AND [ImageFile] = @original_ImageFile
                             AND [UnitPrice] = @original_UnitPrice
                             AND [OnHand] = @original_OnHand">

        <DeleteParameters>
            <asp:Parameter Name="original_ProductID" Type="String" />
            <asp:Parameter Name="original_Brand" Type="String"/>
            <asp:Parameter Name="original_Model" Type="string"/>
            <asp:Parameter Name="original_Gender" Type="string"/>
            <asp:Parameter Name="original_Size" Type="string"/>
            <asp:Parameter Name="original_ImageFile" Type="string"/>
            <asp:Parameter Name="original_UnitPrice" Type="decimal"/>
            <asp:Parameter Name="original_OnHand" Type="int32"/>
        </DeleteParameters>

        <InsertParameters>
            <asp:Parameter Name="ProductID" Type="String" />
            <asp:Parameter Name="Brand" Type="String"/>
            <asp:Parameter Name="Model" Type="string"/>
            <asp:Parameter Name="Gender" Type="string"/>
            <asp:Parameter Name="Size" Type="string"/>
            <asp:Parameter Name="ImageFile" Type="string"/>
            <asp:Parameter Name="UnitPrice" Type="decimal"/>
            <asp:Parameter Name="OnHand" Type="int32"/>
        </InsertParameters>

        <UpdateParameters>
            <asp:Parameter Name="Brand" Type="String"/>
            <asp:Parameter Name="Model" Type="String"/>
            <asp:Parameter Name="Gender" Type="String"/>
            <asp:Parameter Name="Size" Type="String"/>
            <asp:Parameter Name="ImageFile" Type="String"/>
            <asp:Parameter Name="UnitPrice" Type="decimal"/>
            <asp:Parameter Name="OnHand" Type="int32"/>

            <asp:Parameter Name="original_ProductID" Type="String" />
            <asp:Parameter Name="original_Brand" Type="String"/>
            <asp:Parameter Name="original_Model" Type="string"/>
            <asp:Parameter Name="original_Gender" Type="string"/>
            <asp:Parameter Name="original_Size" Type="string"/>
            <asp:Parameter Name="original_ImageFile" Type="string"/>
            <asp:Parameter Name="original_UnitPrice" Type="decimal"/>
            <asp:Parameter Name="original_OnHand" Type="int32"/>
        </UpdateParameters>
     </asp:SqlDataSource>

    <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Please correct the following errors:"
        ValidationGroup="Edit" Width="275px" ForeColor="Red"/>

    <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" EnableViewState="false"></asp:Label>

    <br />
    <span class="style4">To add a new product, enter the product information and click Add Product.</span> 
    <br />
    <br />

    <table ="width:100%;">
        <tr>
            <td class="style1">Product ID:</td>
            <td class="style1">
                <asp:TextBox ID="txtProductID" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtProductID" Display="Dynamic" ErrorMessage="Product ID is a required field." ForeColor="Red" ValidationGroup="Add"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td class="style1">Brand:</td>
            <td class="style1">
                <asp:TextBox ID="txtBrand" runat="server" Width="232px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtBrand" Display="Dynamic" ErrorMessage="Brand is a required field." ForeColor="Red" ValidationGroup="Add"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">Model:</td>
            <td class="style1">
                <asp:TextBox ID="txtModel" runat="server" Width="232px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtModel" Display="Dynamic" ErrorMessage="Model is a required field." ForeColor="Red" ValidationGroup="Add"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">Gender:</td>
            <td class="style1">
                <asp:TextBox ID="txtGender" runat="server" Width="232px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtGender" Display="Dynamic" ErrorMessage="Gender is a required field." ForeColor="Red" ValidationGroup="Add"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">Size:</td>
            <td class="style1">
                <asp:TextBox ID="txtSize" runat="server" Width="232px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtSize" Display="Dynamic" ErrorMessage="Size is a required field." ForeColor="Red" ValidationGroup="Add"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">Image File:</td>
            <td class="style1">
                <asp:TextBox ID="txtImageFile" runat="server" Width="232px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtImageFile" Display="Dynamic" ErrorMessage="Image File is a required field." ForeColor="Red" ValidationGroup="Add"></asp:RequiredFieldValidator>                
            </td>
        </tr>


        <tr>
            <td class="style1">Unit Price:</td>
            <td class="style1">
                <asp:TextBox ID="txtUnitPrice" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtUnitPrice" Display="Dynamic" ErrorMessage="Unit Price must be a decimal value." ForeColor="Red" Type="Double" Operator="DataTypeCheck" ValidationGroup="Add"></asp:CompareValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtUnitPrice" Display="Dynamic" ErrorMessage="Unit Price is a required field." ForeColor="Red" ValidationGroup="Add"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">On Hand:</td>
            <td class="style1">
                <asp:TextBox ID="txtOnHand" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txtOnHand" Display="Dynamic" ErrorMessage="On Hand must be a integer value." ForeColor="Red" Type="integer" Operator="DataTypeCheck" ValidationGroup="Add"></asp:CompareValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtUnitPrice" Display="Dynamic" ErrorMessage="On Hand is a required field." ForeColor="Red" ValidationGroup="Add"></asp:RequiredFieldValidator>
            </td>
        </tr>
  
    </table>

    <br />
        <asp:Button ID="btnAddProduct" runat="server" OnClick="btnAddProduct_Click" Text="Add Product" ValidationGroup="Add" />
     <br />
</asp:Content>
