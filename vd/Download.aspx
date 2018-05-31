<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Download.aspx.vb" Inherits="Download" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style3
        {
            height: 46px;
        }
        .style4
        {
            height: 53px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1" bgcolor="#E5E5E5">
        <tr>
            <td align="center"><h3>
                click to
                <asp:LinkButton ID="lbtnDownload" runat="server" OnClick="DownloadFile" 
                    Font-Italic="True">download</asp:LinkButton>
&nbsp;the video in original format</h3></td>
        </tr>
        <tr>
            <td align="center" style="font-size: medium; font-weight: 600;">
               OR</td>
        </tr>
        <tr>
            <td align="center" class="style3"><h3>
                Select the video in
                <asp:DropDownList ID="ddlExtension" runat="server">
                    <asp:ListItem>.avi</asp:ListItem>
                    <asp:ListItem>.flv</asp:ListItem>
                    <asp:ListItem>.mp4</asp:ListItem>
                    <asp:ListItem>.mkv</asp:ListItem>
                    <asp:ListItem>.mp3</asp:ListItem>
                    <asp:ListItem>.mpg</asp:ListItem>
                    <asp:ListItem>.mpeg</asp:ListItem>
                    <asp:ListItem>.wav</asp:ListItem>
                    <asp:ListItem>.wmv</asp:ListItem>
                    <asp:ListItem>.vob</asp:ListItem>
                </asp:DropDownList>
                format
                <asp:Button ID="btnClickSure" runat="server" Text="ClickToSure" 
                    ToolTip="Click here to sure you want to download in this format" /></h3>
            </td>
        </tr>
        <tr>
            <td align="center" class="style4" style="color: #333399">**If download not 
                starts,Start with other format.....</td>
        </tr>
    </table>
</asp:Content>

