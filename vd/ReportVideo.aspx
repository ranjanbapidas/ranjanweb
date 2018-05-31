<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ReportVideo.aspx.vb" Inherits="ReportVideo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 26px;
        }
        .style3
        {
            height: 26px;
            width: 170px;
        }
        .style4
        {
            height: 26px;
            width: 244px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1" bgcolor="#E5E5E5">
        <tr>
            <td align="center" colspan="3">
                <h1>
                    <asp:Label ID="lblheading" runat="server" Text="Why do you want to report ?"></asp:Label>
                </h1></td>
        </tr>
        <tr>
            <td align="right" class="style3">
                &nbsp;</td>
            <td align="center" class="style4">
                <asp:TextBox ID="txtCause" runat="server" Height="47px" TextMode="MultiLine" 
                    placeholder="   Give the reason"></asp:TextBox>
            </td>
            <td align="left" class="style2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtCause" ErrorMessage="Provide reason" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" Height="31px" 
                    ToolTip="Click here to submit your report to administrator" Width="92px" />
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <asp:Label ID="lblmessage" runat="server" ForeColor="Green" 
                    Text="We will give value to your report after checking ." Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

