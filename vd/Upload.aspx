<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Upload.aspx.vb" Inherits="upl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style1
    {
        width: 100%;
    }
    .style2
    {
        }
    .style3
    {
            width: 217px;
            height: 63px;
        }
        .style10
        {
            width: 217px;
            height: 40px;
        }
        .style11
        {
            height: 40px;
        }
        .style12
        {
            height: 37px;
        }
        .style13
        {
            width: 226px;
            height: 40px;
        }
        .style14
        {
            width: 226px;
            height: 63px;
        }
        .style15
        {
            height: 63px;
        }
        .style16
        {
            width: 226px;
            height: 35px;
        }
        .style17
        {
            width: 217px;
            height: 35px;
        }
        .style18
        {
            height: 35px;
        }
        .style19
        {
            width: 226px;
            height: 39px;
        }
        .style20
        {
            width: 217px;
            height: 39px;
        }
        .style21
        {
            height: 39px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="style1" bgcolor="#E5E5E5">
    <tr>
        <td class="style2" colspan="3">
               <h1 align="center">Upload Your Video</h1></td>
    </tr>
    <tr>
        <td class="style19" align="right">
               Enter video Title:&nbsp;&nbsp;</td>
        <td class="style20">
            <asp:TextBox ID="txtTitle" runat="server" Width="215px"></asp:TextBox>
        </td>
        <td class="style21">
            <asp:RequiredFieldValidator ID="rvalTitle" runat="server" 
                ControlToValidate="txtTitle" ErrorMessage="Enter Title" 
                ForeColor="#FF3300"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style16" align="right">
                Select the Video:&nbsp;&nbsp;</td>
        <td class="style17">
            <asp:FileUpload ID="fu1" runat="server" Width="215px" />
        </td>
        <td class="style18">
            <asp:RequiredFieldValidator ID="rvalUpload" runat="server" 
                ControlToValidate="fu1" ErrorMessage="Select Video" ForeColor="#FF3300"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style14" align="right">
               Select Category:&nbsp;&nbsp;</td>
        <td class="style3">
            <asp:DropDownList ID="ddlCategory" runat="server" 
                DataTextField="Category" DataValueField="Category" 
                DataSourceID="SqlDataSource1" Width="215px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                SelectCommand="SELECT [Category] FROM [CategoryNames] WHERE ([Category] NOT LIKE '%' + @Category + '%') ORDER BY [Category]">
                <SelectParameters>
                    <asp:Parameter DefaultValue="All Categories" Name="Category" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
        <td class="style15">
            <asp:CompareValidator ID="cmpVal" runat="server" 
                ControlToValidate="ddlCategory" ErrorMessage="Select Category" 
                Operator="NotEqual" ValueToCompare="&lt;&lt; Select &gt;&gt;" 
                ForeColor="#FF3300"></asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td class="style13" align="right">
                About the video:&nbsp;&nbsp;</td>
        <td class="style10">
            <asp:TextBox ID="txtAbout" runat="server" Height="62px" TextMode="MultiLine" 
                Width="215px"></asp:TextBox>
        </td>
        <td class="style11">
        </td>
    </tr>
    <tr>
        <td class="style13" align="right">
            Select Status : &nbsp;</td>
        <td class="style10" align="left">
            <asp:DropDownList ID="ddlStatus" runat="server" Width="215px">
                <asp:ListItem>Select</asp:ListItem>
                <asp:ListItem>Public</asp:ListItem>
                <asp:ListItem>Private</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td class="style11">
            <asp:CompareValidator ID="cvalStatus" runat="server" 
                ControlToValidate="ddlStatus" ErrorMessage="Select Status" ForeColor="#FF3300" 
                Operator="NotEqual" ValueToCompare="Select"></asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td class="style13" align="right">
            </td>
        <td class="style10" align="center">
            <asp:Button ID="btnUpload" runat="server" Text="Upload" Width="65px" 
                Height="26px" ToolTip="Click here to upload The video" />
        </td>
        <td class="style11">
            </td>
    </tr>
    <tr>
        <td class="style12" align="center" colspan="3">
            <asp:Label ID="lblMessage" runat="server" ForeColor="#FF3300" Visible="False"></asp:Label>
        </td>
    </tr>
    </table>
</asp:Content>

