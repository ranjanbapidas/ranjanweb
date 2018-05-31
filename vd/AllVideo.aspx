<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AllVideo.aspx.vb" Inherits="AllVideo" %>

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
            <td align="center"><h1 style="color: #336666">Select the status : 
                <asp:DropDownList ID="ddlFilture" runat="server" AutoPostBack="True">
                    <asp:ListItem>All</asp:ListItem>
                    <asp:ListItem>Public</asp:ListItem>
                    <asp:ListItem>Private</asp:ListItem>
                </asp:DropDownList>
               </h1>
            </td>
        </tr>
        <tr>
            <td align="center"><h3>
                <asp:Label ID="lblTopMessage" runat="server" ForeColor="#336666" 
                    Font-Names="Constantia" Font-Size="X-Large"></asp:Label>
                </h3>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:GridView ID="gvDetails" runat="server" AutoGenerateColumns="False" ShowHeader="False" 
                                    PageSize="3" AllowPaging="True" AllowSorting="True" 
                    onPageIndexChanging="OnPageIndexChanging" BackColor="White" 
                    BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" 
                    GridLines="Horizontal">
                                 <Columns>
                                       <asp:TemplateField SortExpression="VideoID">
                                          <ItemTemplate>
                                      
                                           <asp:LinkButton ID="lnkbtn2" runat="server" Font-Italic="True" style=" text-decoration:none; " CommandArgument='<%# Bind("VideoID") %>' CommandName="View"  OnCommand="gvDetails_RowCommand">
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
                                </asp:GridView>&nbsp;</td>
        </tr>
        <tr>
            <td align="center">
                <asp:Label ID="lblTotal" runat="server" ForeColor="#006699" Visible="False" font-weight="bold" font-size="medium"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:LinkButton ID="lbtnBack" runat="server" font-size="Large" 
                    BorderStyle="None" ForeColor="#52748E" Height="25px" 
                    PostBackUrl="~/Profile.aspx" Width="230px" Font-Italic="True">Back to previous page</asp:LinkButton>
                <br />
            <asp:Label ID="LblErr" runat="server" Visible="False" ForeColor="#FF3300"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

