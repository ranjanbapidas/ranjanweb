<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="View.aspx.vb" Inherits="View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 25px;
        }
        .style3
        {
            height: 289px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
   <table class="style1" bgcolor="#E5E5E5">
        <tr>
            <td align="center"> 
            <asp:Label ID="lblTitle" runat="server"></asp:Label>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
    <asp:Panel ID="Panel1" runat="server" Width="580px" Height="350px" HorizontalAlign="Center">
    <embed type="application/x-vlc-plugin" pluginspage="http://www.videolan.org" autoplay="yes" runat="server" ID="Video" height="324" width="575"/>
        <object classid="clsid:9BE31822-FDAD-461B-AD51-BE1D1C159921" codebase="http://download.videolan.org/pub/last/win32/axvlc.cab"></object>
    </asp:Panel>&nbsp;<asp:Button 
                    ID="btnPlay" runat="server" Text="Play" Height="29px" Width="73px"  
                    font-size="medium" ToolTip="Click here to play the video for first time"/>
                <asp:Button 
                    ID="btnDownload" runat="server" Text="Download" Height="29px" 
                    ToolTip="Click here to download the video" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;<asp:Label ID="lblName" runat="server"></asp:Label>
                <asp:LinkButton ID="lbtnName" runat="server" PostBackUrl="~/ProfileAnyone.aspx" 
                    Font-Italic="True" ToolTip="Click here to go to his/her  profile"></asp:LinkButton>
&nbsp;<asp:Label ID="lblUploadDate" runat="server"></asp:Label>
&nbsp;<asp:Label ID="lblStatus" runat="server" Visible="False"></asp:Label>
            &nbsp;<asp:Label ID="lblFileSize" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;<asp:Label ID="lblAbout" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;<asp:Label ID="lblCategory" runat="server"></asp:Label>
&nbsp;<asp:Label ID="lblLike" runat="server"></asp:Label>&nbsp;
                <asp:Label ID="lblDislike" runat="server"></asp:Label>&nbsp;
                <asp:Label ID="lblView" runat="server"></asp:Label>
                &nbsp;
                </td>
        </tr>
        <tr>
            <td>
                &nbsp;<asp:LinkButton runat="server" onclick="lbtnLike_Click" ID="lbtnLike" 
                    Font-Italic="True" ToolTip="Click here to give a like to video">Give like</asp:LinkButton>&nbsp;
                <asp:LinkButton ID="lbtnDislike" runat="server" Font-Italic="True" 
                    ToolTip="Click here to give the dislike to the video">Give dislike</asp:LinkButton>&nbsp;
                <asp:LinkButton ID="lbtnReport" runat="server" Font-Italic="True" 
                    ToolTip="Click here to report for the video to administrator to block the video">Report Video</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="style2" valign="middle">
                &nbsp;<asp:LinkButton ID="lbtnDelete" runat="server" Visible="False" 
                    Font-Italic="True" ToolTip="Click here to delete the video">Delete Video</asp:LinkButton>
                <asp:Label ID="lblYesNo" runat="server" Text="Are you sure want to delete ?" 
                    Visible="False"></asp:Label>
&nbsp;<asp:Button ID="btnYes" runat="server" CausesValidation="False" Text="Yes" 
                    Visible="False" 
                    ToolTip="Click here to sure us you want to delete the video" />
                <asp:Button ID="btnNo" runat="server" CausesValidation="False" Text="No" 
                    Visible="False" ToolTip="Click here to cancel the deletion of video" />
                <asp:LinkButton ID="lbtnStatusChange" runat="server" Visible="False" 
                    Font-Italic="True" ToolTip="Click here to change the status of the video">Change Status</asp:LinkButton>
                <asp:Label ID="lblSelectStatus" runat="server" Text="Select Status :" 
                    Visible="False"></asp:Label>
                <asp:DropDownList ID="ddlStatus" runat="server" Visible="False">
                    <asp:ListItem>Public</asp:ListItem>
                    <asp:ListItem>Private</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="btnSave" runat="server" Text="Save" Visible="False" 
                    ToolTip="click here to save your status" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" Visible="False" 
                    ToolTip="click to cancel change status" />
            </td>
        </tr>
        <tr>
            <td class="style2" valign="middle">
                &nbsp;</td>
        </tr>
    </table>
   
</asp:Content>

