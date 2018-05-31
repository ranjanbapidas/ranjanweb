<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Admin.aspx.vb" Inherits="admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style3
        {
            width: 159px;
        }
        .style5
        {
        }
        .style9
        {
            width: 228px;
            height: 32px;
        }
        .style10
        {
            width: 159px;
            height: 32px;
        }
        .style11
        {
            height: 32px;
        }
        .style19
        {
        }
        .style22
        {
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td align="center">
                <asp:Panel ID="panelLogIn" runat="server" align="center" BackColor="#E5E5E5">
                    <table class="style1">
                        <tr>
                            <td align="right" class="style9">
                                <asp:Label ID="lblEmail" runat="server" Text="Email ID"></asp:Label>
                            </td>
                            <td class="style10">
                                <asp:TextBox ID="txtEmail" runat="server" PlaceHolder="   Enter Email" 
                                    Height="23px"></asp:TextBox>
                            </td>
                            <td align="left" class="style11">
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                                    ControlToValidate="txtEmail" ErrorMessage="Enter Email" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style9">
                                <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                            </td>
                            <td class="style10">
                                <asp:TextBox ID="txtPassword" runat="server" placeholder="   Enter Password" 
                                    Height="23px" TextMode="Password"></asp:TextBox>
                            </td>
                            <td align="left" class="style11">
                                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                                    ControlToValidate="txtEmail" ErrorMessage="Enter Password" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style5">
                                &nbsp;</td>
                            <td align="center" class="style3">
                                <asp:Button ID="btnLogIn" runat="server" Height="32px" Text="LogIn" 
                                    font-size="medium" font-weight="bold"
                                    Width="81px" ToolTip="click here to log in to administrator account" />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center" class="style5" colspan="3">
                                <asp:Label ID="lblMessage" runat="server" ForeColor="#FF3300"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <asp:Panel runat="server" ID="panelAll" Visible="False" BackColor="#E5E5E5">
  <div id="menu1">
                    <asp:LinkButton ID="lbtnShowMessage" runat="server" CausesValidation="False" 
                        Font-Italic="True">Provide message</asp:LinkButton>
                    <asp:LinkButton ID="lbtnShowReportedVideo" runat="server" 
                        CausesValidation="False" Font-Italic="True">Reported videos</asp:LinkButton>
                    <asp:LinkButton ID="lbtnBlockVideo" runat="server" CausesValidation="False" 
                        Font-Italic="True">Blocked videos</asp:LinkButton>
  </div>
  <div id="menu2">
                    <asp:LinkButton ID="lbtnReVdUploaders" runat="server" CausesValidation="False" 
                        Font-Italic="True">Reported Video Uploaders</asp:LinkButton>
                    <asp:LinkButton ID="lbtnBlockedUsers" runat="server" 
                        CausesValidation="False" Font-Italic="True">Blocked Users</asp:LinkButton>
                        <asp:LinkButton ID="lbtnLogOut" runat="server" 
                        CausesValidation="False" Font-Italic="True">Admin LogOut</asp:LinkButton>
  </div>
        <table class="style1">
            <tr>
            <td align="center" colspan="3">
               <h1 style="color: #336666"> Welcome&nbsp; Administrator</h1></td>
        </tr>
            <tr>
            <td >
                <asp:Panel runat="server" ID="panelProvideMessage">

                    <table class="style1">
                         <tr>
            <td align="right" valign="middle" class="style14">
                <asp:Label ID="lblProvideMessage" runat="server" Font-Size="Medium" 
                    Text="Provide Message"></asp:Label>
            </td>
            <td align="center" class="style13" valign="middle">
                <asp:TextBox ID="txtProvideMessage" runat="server" Height="63px" 
                    placeHolder="Write messages for this site" TextMode="MultiLine" Width="213px"></asp:TextBox>
            </td>
            <td align="left" valign="middle">
                <asp:RequiredFieldValidator ID="rfvProvideMessage" runat="server" 
                    ControlToValidate="txtProvideMessage" ErrorMessage="Enter Message" 
                    ForeColor="#FF3300"></asp:RequiredFieldValidator>
                <br />
            </td>
        </tr>
        <tr>
            <td align="center">
                &nbsp;</td>
            <td align="center">
                <asp:Button ID="btnSubmit" runat="server" Font-Size="Medium" Height="29px" 
                    Text="Submit" Width="115px" 
                    ToolTip="Click here to submit your message and to show in home page" />
            </td>
            <td align="center">
                &nbsp;</td>
        </tr>
                    </table>

                </asp:Panel>
            </td>
            </tr>
          <tr>
          <td colspan="3">
              <asp:Panel runat="server" ID="panelReportGridView" Visible="False">

                  <table class="style1">
                           <tr>
                <td align="center" colspan="3">
                   <h1> 
                       <asp:Label ID="lblReportMessage" runat="server" ForeColor="#336666"></asp:Label>
                    </h1></td>
            </tr>
            <tr>
                <td align="center" colspan="3">
                    <asp:GridView ID="gvReportedVideo" runat="server" AutoGenerateColumns="False" ShowHeader="False" 
                                    PageSize="3" AllowPaging="True" AllowSorting="True" 
                        onPageIndexChanging="OnPageIndexChanging" BackColor="White" 
                        BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" 
                        GridLines="Horizontal" >

                                    <Columns>
                                       <asp:TemplateField SortExpression="VideoID">
                                          <ItemTemplate>
                                      
                                           <asp:LinkButton ID="lnkbtn" runat="server" style=" text-decoration:none; " Font-Italic="True" CommandArgument='<%# Bind("VideoID") %>' CommandName="View"  OnCommand="gvReportedVideo_RowCommand" CausesValidation="False" ToolTip="Click here to show options for this video">
                                              <table>
                                               <tr>
                                                <td>
                                                 <asp:ImageMap ID="ImageMap1" runat="server" ImageUrl='<%# Eval("ThumbPath") %>'  width="120px"></asp:ImageMap>
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
          </td>
          </tr> 
            <tr>
            <td colspan="3" align="center"">
                <asp:Panel runat="server" id="panelBlockedVideo" Visible="False">

                    <table class="style1">
                        <tr>
                            <td align="center" class="style22">
                                <h1>
                                    <asp:Label ID="lblBlockMessage" runat="server" ForeColor="#336666"></asp:Label>
                                </h1>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" class="style22">
                                <asp:GridView ID="gvBlockedVideo" runat="server" AllowPaging="True" 
                                    AllowSorting="True" AutoGenerateColumns="False" 
                                    onPageIndexChanging="OnPageIndexChangingB" PageSize="3" ShowHeader="False" 
                                    BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
                                    CellPadding="4" GridLines="Horizontal">
                                    <Columns>
                                        <asp:TemplateField SortExpression="VideoID">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkbtn0" runat="server" CausesValidation="False" 
                                                    CommandArgument='<%# Bind("VideoID") %>' CommandName="View" Font-Italic="True" ToolTip="Click here to show options for this video"
                                                    OnCommand="gvBlockedVideo_RowCommand" style="text-decoration: none;">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:ImageMap ID="ImageMap2" runat="server" ImageUrl='<%# Eval("ThumbPath") %>' 
                                                                width="120px">
                                                            </asp:ImageMap>
                                                        </td>
                                                        <td style="vertical-align: top;">
                                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                                                            <br />
                                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("Category") %>'></asp:Label>
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
                </asp:Panel>
            </td>
            </tr>
            <tr>
                                            <td align="center" class="style22">
                                            <asp:Panel ID="panelPlayer" runat="server" Width="580px" Height="350px" 
                                                    Visible="False">
    <embed type="application/x-vlc-plugin" pluginspage="http://www.videolan.org" autoplay="yes" runat="server" ID="Video" height="324" width="575"/>
        <object classid="clsid:9BE31822-FDAD-461B-AD51-BE1D1C159921" codebase="http://download.videolan.org/pub/last/win32/axvlc.cab"></object>
    </asp:Panel></td>
                                        </tr>
            <tr>
                            <td align="right" class="style19">
                                <asp:Panel ID="panelReportMenu" runat="server" Visible="False">
                                    <table class="style1">
                                        
                                        <tr>
                                            <td align="center" class="style22">
                                                <asp:Label ID="lblTitle" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" class="style22">
                                                <asp:Label ID="lblUploadedBy" runat="server" Text="Uploaded By : "></asp:Label>
                                                <asp:LinkButton runat="server" ID="lbtnUploadedBy" CausesValidation="False" 
                                                    Font-Italic="True" ToolTip="click here to go to his profile"></asp:LinkButton>
                                                <asp:Label ID="lblReportedNumber" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" class="style22">
                                                <asp:Button ID="btnViewVideo" runat="server" CausesValidation="False" 
                                                    Font-Size="Medium" Height="29px" Text="View video" Width="114px" 
                                                    ToolTip="Click here to play the video for first time" />
                                                <asp:Button ID="btnBlock" runat="server" CausesValidation="False" 
                                                    Font-Bold="False" Font-Size="Medium" Height="29px" Text="Block video" 
                                                    Width="114px" ToolTip="Click here to block the video" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" class="style22">
                                                <asp:Label ID="lblError" runat="server" Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" class="style22">
                                                <asp:GridView ID="gvReportedUser" runat="server" AllowPaging="True" 
                                                    AllowSorting="True" AutoGenerateColumns="False" 
                                                    onPageIndexChanging="OnPageIndexChangingV" PageSize="3" BackColor="White" 
                                                    BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                                                    ForeColor="Black" GridLines="Vertical">
                                                    <AlternatingRowStyle BackColor="White" />
                                                    <Columns>
                                                        <asp:BoundField DataField="Name" HeaderText="Name" />
                                                        <asp:BoundField DataField="Cause" HeaderText="Cause" />
                                                        <asp:TemplateField HeaderText="RDate">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl13" runat="server" 
                                                                    Text='<%# Bind("Rdate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <FooterStyle BackColor="#CCCC99" />
                                                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Center" />
                                                    <RowStyle BackColor="#E7EBEC" />
                                                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                                    <SortedAscendingHeaderStyle BackColor="#848384" />
                                                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                                    <SortedDescendingHeaderStyle BackColor="#575357" />
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                </td>
            </tr>
             <tr>
                            <td colspan="3">
                                <asp:Panel ID="panelBlockMenu" runat="server" Visible="False">
                                    <table class="style1">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lblTitle0" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lblError0" runat="server" Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <asp:Button ID="btnPlayVideo" runat="server" CausesValidation="False" 
                                                    Font-Size="Medium" Height="29px" Text="Play Video" 
                                                    ToolTip="Click here to play the video for first time" />
                                                <asp:Button ID="btnUnblock" runat="server" CausesValidation="False" 
                                                    Font-Size="Medium" Height="29px" Text="Unblock Video" 
                                                    ToolTip="Click here to unblock the video" />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                        <td colspan="3">
                            <asp:Panel runat="server" id="panelUploadRe" Visible="False">

                                <table class="style1">
                                    <tr>
                                        <td align="center">
                                            <h1><asp:Label ID="lblReportedUser" runat="server" ForeColor="#336666"></asp:Label></h1>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                                ShowHeader="False" BackColor="White" BorderColor="#336666" 
                                                BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
                                            <columns>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                            <asp:LinkButton ID="lbtnReptUser" runat="server" Font-Italic="True" Text='<%# Bind("Name") %>' CausesValidation="false" CommandArgument='<%# Bind("Email") %>' CommandName="View" ToolTip="Click here to show options for this user"
                                                    OnCommand="gvReportedUser_RowCommand"></asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                            </columns>
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
                                    <tr>
                                        <td align="center">
                                            <asp:Label ID="lblUploaderName" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <asp:Label ID="lblUserMessage" runat="server" Visible="False"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <asp:Button ID="btnProfile" runat="server" CausesValidation="False" 
                                                Text=" View Profile" Visible="False" 
                                                ToolTip="Click here to view his/her profile" />
                                            <asp:Button ID="btnUnblockUser" runat="server" CausesValidation="False" 
                                                Text="Unblock User" Visible="False" 
                                                ToolTip="Click here to unblock the user" />
                                            <asp:Button ID="btnBlockUser" runat="server" CausesValidation="False" 
                                                Text="Block User" Visible="False" ToolTip="Click here to block the user" />
                                        </td>
                                    </tr>
                                </table>

                            </asp:Panel>
                        </td></tr>

        </table>
    
    </asp:Panel>
</asp:Content>

