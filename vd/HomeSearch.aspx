<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="HomeSearch.aspx.vb" Inherits="HomeSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 192px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1" bgcolor="#E5E5E5">
        <tr>
            <td>
             <asp:Panel ID="Panel3" runat="server" BackColor="#E5E5E5">
                    <table class="style1" bgcolor="#E5E5E5">
                        <tr>
                            <td align="center" bgcolor="#E5E5E5">
                                <asp:Label ID="lblMessage" runat="server" ForeColor="#336666" 
                                    Font-Names="Constantia"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#E5E5E5">
                                <asp:GridView ID="gvSearch" runat="server" AutoGenerateColumns="False" ShowHeader="False" 
                                    PageSize="3" AllowPaging="True" AllowSorting="True" 
                                    onPageIndexChanging="OnPageIndexChanging" BackColor="White" 
                                    BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" 
                                    GridLines="Horizontal">

                                    <Columns>
                                       <asp:TemplateField SortExpression="VideoID">
                                          <ItemTemplate>
                                      
                                           <asp:LinkButton ID="lnkbtn" runat="server" Font-Italic="True" style=" text-decoration:none; " CommandArgument='<%# Bind("VideoID") %>' CommandName="View"  OnCommand="gvSearch_RowCommand">
                                              <table>
                                               <tr>
                                                <td>
                                                 <asp:ImageMap runat="server" ImageUrl='<%# Eval("ThumbPath") %>'  width="120px"></asp:ImageMap>
                                                </td>
                                                <td style=" vertical-align: top; "> 
                                                 <asp:Label ID="Label6" runat="server"  Text='<%# Bind("Title") %>' ></asp:Label><br />
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
                                    <PagerStyle BackColor="#336666" ForeColor="#CCCCCC" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#E7EBEC" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                    <SortedAscendingHeaderStyle BackColor="#487575" />
                                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                    <SortedDescendingHeaderStyle BackColor="#275353" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#E5E5E5">
                                <asp:Label ID="lblErrorMessage" runat="server" Visible="False"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                </td>
        </tr>
    </table>
</asp:Content>

