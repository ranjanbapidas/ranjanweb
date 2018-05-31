<%@ Page Language="VB" AutoEventWireup="false" CodeFile="special.aspx.vb" Inherits="special" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 183px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td class="style2">
                    Enter any command without return value</td>
                <td>
                    <asp:TextBox ID="txt" runat="server" Height="58px" Width="1061px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Button ID="btnExec" runat="server" Text="Execute" />
                </td>
                <td>
                    <asp:Button ID="btngvExec" runat="server" Text="Grid View on and execute" />
&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnlblExec" runat="server" 
                        Text="execute and display in label" />
                    <asp:Label ID="lbl" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="gv" runat="server">
                    </asp:GridView>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>

