<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Profile.aspx.vb" Inherits="Profile" %>

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
            width: 126px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1" bgcolor="#E5E5E5">
    <tr>
        <td align="center" colspan="3">
            <asp:Label ID="lblProfileName" runat="server" ForeColor="#336666" 
                font-weight="Bold" font-size="Large"></asp:Label>
        </td>
    </tr>
    <tr>
        <td align="center" colspan="3">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2" align="center" colspan="3">
            <asp:ImageButton ID="imgBtnProfile" runat="server" Height="130px" 
                CssClass="profileImage1" />
            </td>
    </tr>
    <tr>
        <td align="center" class="style3" colspan="3">
            <asp:LinkButton ID="LinkButton1" runat="server" font-size="Medium" 
                PostBackUrl="~/EditProfile.aspx" Font-Italic="True" 
                ToolTip="Click here to edit your profile's data">Edit Profile</asp:LinkButton>
        </td>
    </tr>
    <tr>
        <td align="center" class="style7" colspan="3" style="font-weight: 150">
            Email :
            <asp:Label ID="lblEmail" runat="server"></asp:Label>&nbsp;
        </td>
    </tr>
    <tr>
        <td align="right" class="style7" style="font-weight: 150">
            DOB :
            <asp:Label ID="lblDOB" runat="server"></asp:Label>
        </td>
        <td align="center" class="style8" style="font-weight: 150">Sex :
            <asp:Label ID="lblSex" runat="server"></asp:Label>
        </td>
        <td align="left" class="style3" style="font-weight: 150">City :
            <asp:Label ID="lblCity" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td align="center" class="style3" style="font-size: medium" colspan="3">
           <p style=" font-size: larger; font-weight: 200"> <asp:Label ID="lblTopMessage" 
                   runat="server" ForeColor="#336666"></asp:Label></p>
        </td>
    </tr>
    <tr>
        <td class="style6" align="center" colspan="3">
           <asp:GridView ID="gvDetails" runat="server" AutoGenerateColumns="False" ShowHeader="False" 
                                    PageSize="4" AllowPaging="True" AllowSorting="True" 
                onPageIndexChanging="OnPageIndexChanging" BackColor="#E7EBEC" 
                BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" 
                GridLines="Horizontal">
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
                                 <FooterStyle BackColor="White" ForeColor="#333333" />
                                 <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                                 <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                                 <RowStyle BackColor="#E7EBEC" ForeColor="#333333" />
                                 <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                                 <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                 <SortedAscendingHeaderStyle BackColor="#487575" />
                                 <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                 <SortedDescendingHeaderStyle BackColor="#275353" />
                                </asp:GridView> &nbsp;
            
        </td>
    </tr>
    <tr>
        <td class="style5" align="center" style="font-size: medium" colspan="3">
            <asp:LinkButton ID="lbtnVideo" runat="server" Font-Italic="True">Click here</asp:LinkButton>
            <asp:Label ID="lblBottomMessage" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style5" align="center" colspan="3">
            <asp:Label ID="LblErr" runat="server" Visible="False" ForeColor="#FF3300"></asp:Label>
        </td>
    </tr>
</table>
</asp:Content>

