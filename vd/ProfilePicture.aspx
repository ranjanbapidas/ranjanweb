<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ProfilePicture.aspx.vb" Inherits="ProfilePicture" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <table class="style1" >
        <tr>
            <td align="center" bgcolor="#E5E5E5">
               <asp:Image ID="Image1" runat="server" Visible="False" CssClass="profileImage" />
                <br /><br />
                &nbsp;<asp:LinkButton runat="server" font-size="Medium" width="200 px" 
                    ID="lbtnBack" Font-Italic="True">Back to previous page</asp:LinkButton></td>
        </tr>
    </table>
</asp:Content>

