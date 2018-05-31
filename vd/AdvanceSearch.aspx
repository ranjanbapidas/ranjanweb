<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AdvanceSearch.aspx.vb" Inherits="AdvanceSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
            margin-bottom: 0px;
        }
        .style2
        {
            height: 54px;
        }
        .style3
        {
        }
        .style4
        {
        }
        .style5
        {
            height: 43px;
        }
        .style8
        {
            width: 283px;
            height: 37px;
        }
        .style9
        {
            height: 37px;
        }
        .style10
        {
            width: 283px;
        }
        .style11
        {
            height: 37px;
            width: 43px;
        }
        .style12
        {
            height: 186px;
        }
        .style13
        {
            height: 34px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel runat="server" ID="panelAll" BackColor="#E5E5E5">    <table class="style1">
        <tr>
            <td colspan="3" class="style2">
                <h1 align="center" style="color: #336666">Search in Details</h1></td>
        </tr>
        <tr>
            <td class="style8" align="right">
                <asp:Label ID="Label1" runat="server" Text="Enter the Title"></asp:Label>
            </td>
            <td class="style9" colspan="2">
                <asp:TextBox ID="txtTitle" runat="server" ForeColor="Gray" 
                    placeholder="          Enter Title" Width="138px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style8" align="right">
                <asp:Label ID="lblStartDate" runat="server" Text="Enter Start Date"></asp:Label>
            </td>
            <td class="style11" valign="middle">
                <asp:TextBox ID="txtDateFrom" runat="server" ForeColor="Gray" 
                    placeholder="         yyyy/mm/dd" Width="138px"></asp:TextBox>
            </td>
            <td class="style9" valign="middle">
                <asp:ImageButton ID="imgbtnStartDate" runat="server" Height="25px" 
                    ImageUrl="~/images/Calendar.png" CausesValidation="False" />
            </td>
        </tr>
        <tr>
            <td class="style8" align="right">
                <asp:Label ID="lblTerminalDate" runat="server" Text="Enter Terminal Date"></asp:Label>
            </td>
            <td class="style9">
                <asp:TextBox 
                    ID="txtDateTo" runat="server" ForeColor="Gray" 
                    placeholder="         yyyy/mm/dd" Width="138px"></asp:TextBox>
            </td>
            <td class="style9">
                <asp:ImageButton ID="imgbtnTerminalDate" runat="server" Height="25px" 
                    ImageUrl="~/images/Calendar.png" 
                    CausesValidation="False" />
            </td>
        </tr>
        <tr>
            <td class="style10" align="right">
                <asp:Label ID="Label3" runat="server" Text="Select a category"></asp:Label>
            </td>
            <td class="style4" colspan="2">
                <asp:DropDownList ID="ddlCat" runat="server" DataSourceID="SqlDataSource1" 
                    DataTextField="Category" DataValueField="Category" Width="138px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    
                    SelectCommand="SELECT [Category] FROM [CategoryNames] WHERE ([Category] NOT LIKE '%' + @Category + '%') ORDER BY [Category]">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="&lt;&lt; Select &gt;&gt;" Name="Category" 
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style5" align="center" colspan="3">
                <asp:Button ID="btnSearch" runat="server" Text="Search" Height="31px" 
                    Width="84px" 
                    ToolTip="Click here to search videos with your provided data" />
                </td>
        </tr>
        <tr>
            <td class="style3" align="center" colspan="3">
                <asp:Label ID="LblMessage" runat="server" ForeColor="#FF3300" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3" align="center" colspan="3" bgcolor="#E5E5E5">
                <asp:GridView ID="gvAdvanceSearch" runat="server" AutoGenerateColumns="False" ShowHeader="False" 
                                    PageSize="3" AllowPaging="True" AllowSorting="True" 
                    onPageIndexChanging="OnPageIndexChanging" 
                    BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" 
                    GridLines="Horizontal">
                                 <Columns>
                                       <asp:TemplateField SortExpression="VideoID">
                                          <ItemTemplate>
                                      
                                           <asp:LinkButton ID="lnkbtn2" runat="server" Font-Italic="True" style=" text-decoration:none; " CommandArgument='<%# Bind("VideoID") %>' CommandName="View"  OnCommand="gvAdvanceSearch_RowCommand" ToolTip="Click here to View details and other options of this video">
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
                                </asp:GridView>
            </td>
        </tr>
 </table>
</asp:Panel>
    <asp:Panel runat="server" ID="panelCalender" Visible="False"> <table class="style1" 
            bgcolor="#E5E5E5">
        <tr>
            <td align="center" bgcolor="#E5E5E5">
               <h1 style="background-color: #E5E5E5"><asp:Label ID="lblCalDate" runat="server" 
                       Text="Select Date" ForeColor="#336666"></asp:Label></h1>
            </td>
        </tr>
        <tr>
            <td align="center" class="style12" bgcolor="#E5E5E5">
                <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" 
                    BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" 
                    Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" 
                    ShowGridLines="True" Width="220px">
                    <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                    <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                    <OtherMonthDayStyle ForeColor="#CC9966" />
                    <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                    <SelectorStyle BackColor="#FFCC66" />
                    <TitleStyle BackColor="#FFCC66" Font-Bold="True" Font-Size="9pt" 
                        ForeColor="#666666" />
                    <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                </asp:Calendar>
            </td>
        </tr>
        <tr>
            <td align="center" class="style13" bgcolor="#E5E5E5">
                <asp:Button ID="btnOk" runat="server" Text="OK" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
            </td>
        </tr>
    </table>
       
    </table>
    </asp:Panel>
</asp:Content>

