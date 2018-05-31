<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AdministratorMessage.aspx.vb" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1" bgcolor="#E5E5E5">
        <tr>
            <td align="center">
                <h1>The Administrator Messages</h1></td>
        </tr>
        <tr>
            <td align="center">
                <asp:GridView ID="gvMessage" runat="server" AutoGenerateColumns="False" ShowHeader="False" 
                                    PageSize="3" AllowPaging="True" AllowSorting="True" onPageIndexChanging="OnPageIndexChangingV">
                   <Columns>
                    <asp:TemplateField SortExpression="VideoID">
                        <ItemTemplate>
                        <table class="style1">
                           <tr><td align="left"><ul><li style="  font-size:120%;"><asp:Label ID="lbl12" runat="server"  Text='<%# Bind("Message") %>' ></asp:Label></li></ul></td>
                           <td style=" vertical-align: bottom;" align="right"><asp:Label ID="lbl13" runat="server"  Text='<%# Bind("MsgDate","{0:dd/MM/yyyy}") %>' ></asp:Label></td></tr>
                       </table>
                        </ItemTemplate>

                    </asp:TemplateField>
                   </Columns>
                </asp:GridView>
            </td>
        </tr>
        </table>
</asp:Content>

