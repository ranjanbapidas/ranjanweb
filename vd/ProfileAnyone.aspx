<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ProfileAnyone.aspx.vb" Inherits="ProfileAnyone" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style1
    {
        width: 100%;
    }
        .style2
        {
            height: 44px;
        }
        .style3
        {
            height: 31px;
        }
        .style5
        {
        }
        .style6
        {
            height: 34px;
        }
        .style7
        {
            height: 31px;
            }
        .style8
        {
            height: 31px;
            width: 264px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1" bgcolor="#E5E5E5">
    <tr>
        <td align="center" colspan="2">
            <asp:Label ID="lblProfileName" runat="server" ForeColor="#336666" 
                font-weight="Bold" font-size="Large"></asp:Label>
        </td>
    </tr>
    <tr>
        <td align="center" colspan="2">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2" align="center" colspan="2">
            <asp:ImageButton ID="imgBtnProfile" runat="server" Height="130px" />
            </td>
    </tr>
    <tr>
        <td align="center" class="style7" colspan="2" style="font-weight: 150">
            Email :
            <asp:Label ID="lblEmail" runat="server"></asp:Label>&nbsp;
        </td>
    </tr>
    <tr>
        <td align="right" class="style8" style="font-weight: 150">Sex :
            <asp:Label ID="lblSex" runat="server"></asp:Label>
            &nbsp;
        </td>
        <td align="left" class="style3" style="font-weight: 150">&nbsp;City :
            <asp:Label ID="lblCity" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td align="center" class="style3" style="font-size: medium" colspan="2">
           <p style=" font-size: larger; font-weight: 200"> <asp:Label ID="lblTopMessage" 
                   runat="server" ForeColor="#336666"></asp:Label></p>
        </td>
    </tr>
    <tr>
        <td class="style6" align="center" colspan="2">
           <asp:GridView ID="gvDetails" runat="server" AutoGenerateColumns="False" ShowHeader="False" 
                                    PageSize="3" AllowPaging="True" AllowSorting="True" 
                onPageIndexChanging="OnPageIndexChanging" BackColor="#E7EBEC">
                                 <Columns>
                                       <asp:TemplateField SortExpression="VideoID">
                                          <ItemTemplate>
                                      
                                           <asp:LinkButton ID="lnkbtn2" runat="server" Font-Italic="True" style=" text-decoration:none; " CommandArgument='<%# Bind("VideoID") %>' CommandName="View"  OnCommand="gvDetails_RowCommand" ToolTip="Click here to View details and other options of this video">
                                              <table>
                                               <tr>
                                                <td>
                                                 <asp:ImageMap runat="server" ImageUrl='<%# Eval("ThumbPath") %>'  width="120px"></asp:ImageMap>
                                                </td>
                                                <td style=" vertical-align: top; "> 
                                                 <asp:Label ID="Label62" runat="server"  Text='<%# Bind("Title") %>' ></asp:Label><br />
                                                 <asp:Label ID="Label5" runat="server" Text='<%# Bind("Category") %>'></asp:Label>
                                                </td>
                                               </tr>
                                              </table>
                                              </asp:LinkButton>
                                          </ItemTemplate>

                                       </asp:TemplateField>
                                    </Columns>
                                </asp:GridView> &nbsp;
            
        </td>
    </tr>
    <tr>
        <td class="style5" align="center" colspan="2">
            <asp:Label ID="LblErr" runat="server" Visible="False" ForeColor="#FF3300"></asp:Label>
        </td>
    </tr>
</table>
</asp:Content>

