<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 14px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table bgcolor="#E5E5E5" class="style1">
        <tr>
            <td class="style2">
                <div id="news" style="background-color: #E5E5E5">

      <div class="block">

        
          <table class="style1">
              <tr>
                  <td colspan="2" class="style3" align="center">&nbsp;<h1 style="color: #2E5A5A">Search</h1></td>
              </tr>
              <tr>
                  <td class="style4">
                      <asp:TextBox ID="txtSearch" runat="server" Width="135px" 
                          placeholder=" Search With Title" ForeColor="#666666"></asp:TextBox>
                  </td>
                  <td>
                      <asp:ImageButton ID="imgbtnSearch" runat="server" Width="25px" 
                          ImageUrl="~/images/Search.png" 
                          ToolTip="Click here to search videos with title or keyword" />
                  </td>
              </tr>
              <tr>
              <td colspan="2" align="center">
               <asp:Label ID="lblErrorSearch" runat="server" ForeColor="#FF3300" 
              Text="Input search element." Visible="False"></asp:Label>
              </td>
              </tr>
          </table>
<h1 align="center" style="color: #2E5A5A">
          Latest news
        </h1>
        <p align="left">
            <asp:Label ID="lblMessage1" runat="server"></asp:Label>
 </p>
 
         <p align="left">
             <asp:Label ID="lblMessage2" runat="server"></asp:Label>
 </p>
          <p align="left">
              <asp:LinkButton ID="lbtnMore" runat="server" 
                  PostBackUrl="~/AdministratorMessage.aspx" Font-Italic="True" 
                  ToolTip="Click here to show more messages">More</asp:LinkButton>
          </p>
          <p>
              &nbsp;</p>

        <div class="bottom" style="background-color: #C0C0C0">&nbsp;</div>

      </div>
</div>&nbsp;</td>
            <td align="center" valign="top">
                <h1><asp:Label ID="lblTopMessage" 
                                        runat="server" Text="Recent Videos of" ForeColor="#2E5A5A"></asp:Label>&nbsp;
                                    <asp:DropDownList ID="ddlCategory" runat="server" Font-Bold="True" 
                                        Height="26px">
                                        <asp:ListItem>All Categories</asp:ListItem>
                                        <asp:ListItem>Cartoon</asp:ListItem>
                                        <asp:ListItem>Comedy</asp:ListItem>
                                        <asp:ListItem>Entertainment</asp:ListItem>
                                        <asp:ListItem>Movie</asp:ListItem>
                                        <asp:ListItem>Natural Geography</asp:ListItem>
                                        <asp:ListItem>News</asp:ListItem>
                                        <asp:ListItem>Other</asp:ListItem>
                                        <asp:ListItem>Religion</asp:ListItem>
                                        <asp:ListItem>Sport</asp:ListItem>
                                        <asp:ListItem>Study</asp:ListItem>
                                        <asp:ListItem>Technology</asp:ListItem>
                                        <asp:ListItem>Tv Show</asp:ListItem>
                                        <asp:ListItem>Video of Album</asp:ListItem>
                                        <asp:ListItem>Video of Movie</asp:ListItem>
                                        <asp:ListItem>Youga</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:Button ID="Button1" runat="server" Text="Click To Sure" BackColor="#CCCCCC" 
                                        ForeColor="#2E5A5A" Font-Bold="False" Font-Italic="False" Font-Size="Medium" 
                                        Height="25px" Width="135px" Font-Names="Constantia" 
                        ToolTip="Click here to sure about selected category" /></h1>
                <asp:GridView ID="gvVideo" runat="server" AutoGenerateColumns="False" ShowHeader="False" 
                                    PageSize="3" AllowPaging="True" AllowSorting="True" 
                                    onPageIndexChanging="OnPageIndexChangingV" 
                                    BorderColor="#336666" BorderStyle="Double" 
                    BorderWidth="3px" CellPadding="4" 
                                    GridLines="Horizontal">
                                 <Columns>
                                       <asp:TemplateField SortExpression="VideoID">
                                          <ItemTemplate>
                                      
                                           <asp:LinkButton ID="lnkbtn2" runat="server" style=" text-decoration:none; " CommandArgument='<%# Bind("VideoID") %>' CommandName="View"  OnCommand="gvVideo_RowCommand" Font-Italic="True" ToolTip="Click here to View details and other options of this video">
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
                                    <PagerStyle BackColor="#336666" ForeColor="#CCCCCC" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#E7EBEC" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                    <SortedAscendingHeaderStyle BackColor="#487575" />
                                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                    <SortedDescendingHeaderStyle BackColor="#275353" />
                                </asp:GridView>&nbsp;</tr>
        </table>
</asp:Content>

