<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="UserVerification.aspx.vb" Inherits="Verification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
            margin-bottom: 6px;
        }
        .style2
        {
            width: 208px;
        }
        .style3
        {
            width: 162px;
        }
        .style4
        {
            height: 49px;
        }
        .style5
        {
            width: 162px;
            height: 49px;
        }
        .style6
        {
            height: 49px;
        }
        .style7
        {
            width: 100%;
        }
        .style8
        {
            height: 39px;
        }
        .style9
        {
            width: 174px;
            height: 39px;
        }
        .style10
        {
            height: 42px;
        }
        .style11
        {
            width: 174px;
            height: 42px;
        }
        .style12
        {
            height: 42px;
        }
        .style13
        {
            height: 39px;
        }
        .style14
        {
            height: 36px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1" bgcolor="#E5E5E5">
        <tr>
            <td>
                <asp:Panel ID="panelEmail" runat="server">
                    <table class="style1">
                        <tr>
                            <td class="style4" align="center" colspan="3" 
                                style="font-size: x-large; font-family: Constantia; color: #2E5A5A;">
                                Give unique email id and verify it...</td>
                        </tr>
                        <tr>
                            <td align="right" class="style4">
                                Enter Email ID :</td>
                            <td align="center" class="style5">
                                <asp:TextBox ID="txtEmail" runat="server" Height="25px" Width="184px"></asp:TextBox>
                            </td>
                            <td align="left" class="style6">
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                                    ControlToValidate="txtEmail" ErrorMessage=" Enter Email" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                    ControlToValidate="txtEmail" ErrorMessage=" Enter Email Correctly" 
                                    ForeColor="#FF3300" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                &nbsp;</td>
                            <td align="center" class="style3">
                                <asp:Button ID="btnSend" runat="server" Height="34px" 
                                    Text="Send Verification Code" 
                                    ToolTip="Click here to get verification code" />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center" class="style14" colspan="3">
                                <asp:Label ID="lblMessage" runat="server" ForeColor="#FF3300"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="panelVerification" runat="server" Visible="False">
                    <table class="style7">
                        <tr>
                            <td align="center" class="style10" colspan="3">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right" class="style10">
                                Enter Verification Code:</td>
                            <td align="center" class="style11">
                                <asp:TextBox ID="txtVcode" runat="server" Height="25px" Width="184px"></asp:TextBox>
                            </td>
                            <td align="left" class="style12">
                                <asp:RequiredFieldValidator ID="rfvVcode" runat="server" 
                                    ControlToValidate="txtVcode" ErrorMessage=" Enter Verifation Code" 
                                    ForeColor="#FF3300"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style8">
                            </td>
                            <td align="center" class="style9">
                                <asp:Button ID="btnSubmit" runat="server" Height="34px" Text="Submit" 
                                    Width="103px" ToolTip="Click here to Submit your verification code" />
                            </td>
                            <td class="style13">
                            </td>
                        </tr>
                        <tr>
                            <td align="center" class="style8" colspan="3">
                                <asp:Label ID="lblVmessage" runat="server" ForeColor="#FF3300"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>

