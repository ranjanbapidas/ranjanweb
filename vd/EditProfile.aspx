<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="EditProfile.aspx.vb" Inherits="EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
        }
        .style4
        {
        }
        .style5
        {
            width: 241px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1" bgcolor="#E5E5E5">
        <tr>
            <td align="center" colspan="2">
                <h1>Edit Your Profile's Data</h1></td>
        </tr>
        <tr>
            <td align="center" class="style4" colspan="2" height="40px" 
                style="color: #333399">
                **Change the required field only which you want to change</td>
        </tr>
        <tr>
            <td align="right" class="style5" height="40px">
                New&nbsp; Password :&nbsp;&nbsp;
                </td>
            <td align="left" class="style2" height="40px">
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style5" height="40px">
                Retype Password :
                </td>
            <td align="left" class="style2" height="40px">
                <asp:TextBox ID="txtRePassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="cvalRePassword" runat="server" 
                    ControlToCompare="txtPassword" ControlToValidate="txtRePassword" 
                    ErrorMessage="Retype the password correctly" ForeColor="#FF3300"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="style5" height="40px">
                &nbsp;Enter New Name :&nbsp;&nbsp;</td>
            <td align="left" class="style2" height="40px">
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style5" height="40px">
                &nbsp;Enter New DOB :&nbsp;&nbsp;</td>
            <td align="left" class="style2" height="40px">
                <asp:DropDownList ID="ddlYear" runat="server" ValidationGroup="sex">
                    <asp:ListItem>Year</asp:ListItem>
                    <asp:ListItem>1975</asp:ListItem>
                    <asp:ListItem>1976</asp:ListItem>
                    <asp:ListItem>1977</asp:ListItem>
                    <asp:ListItem>1978</asp:ListItem>
                    <asp:ListItem>1979</asp:ListItem>
                    <asp:ListItem>1980</asp:ListItem>
                    <asp:ListItem>1981</asp:ListItem>
                    <asp:ListItem>1982</asp:ListItem>
                    <asp:ListItem>1983</asp:ListItem>
                    <asp:ListItem>1984</asp:ListItem>
                    <asp:ListItem>1985</asp:ListItem>
                    <asp:ListItem>1986</asp:ListItem>
                    <asp:ListItem>1987</asp:ListItem>
                    <asp:ListItem>1988</asp:ListItem>
                    <asp:ListItem>1989</asp:ListItem>
                    <asp:ListItem>1990</asp:ListItem>
                    <asp:ListItem>1991</asp:ListItem>
                    <asp:ListItem>1992</asp:ListItem>
                    <asp:ListItem>1993</asp:ListItem>
                    <asp:ListItem>1994</asp:ListItem>
                    <asp:ListItem>1995</asp:ListItem>
                    <asp:ListItem>1996</asp:ListItem>
                    <asp:ListItem>1997</asp:ListItem>
                    <asp:ListItem>1998</asp:ListItem>
                    <asp:ListItem>1999</asp:ListItem>
                    <asp:ListItem>2000</asp:ListItem>
                    <asp:ListItem>2001</asp:ListItem>
                    <asp:ListItem>2002</asp:ListItem>
                    <asp:ListItem>2003</asp:ListItem>
                    <asp:ListItem>2004</asp:ListItem>
                    <asp:ListItem>2005</asp:ListItem>
                    <asp:ListItem>2006</asp:ListItem>
                    <asp:ListItem>2007</asp:ListItem>
                    <asp:ListItem>2008</asp:ListItem>
                    <asp:ListItem>2009</asp:ListItem>
                    <asp:ListItem>2010</asp:ListItem>
                    <asp:ListItem>2011</asp:ListItem>
                    <asp:ListItem>2012</asp:ListItem>
                    <asp:ListItem>2013</asp:ListItem>
                    <asp:ListItem>2014</asp:ListItem>
                    <asp:ListItem>2015</asp:ListItem>
                    <asp:ListItem>2016</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlMonth" runat="server" ValidationGroup="sex">
                    <asp:ListItem>Month</asp:ListItem>
                    <asp:ListItem>January</asp:ListItem>
                    <asp:ListItem>February</asp:ListItem>
                    <asp:ListItem>March</asp:ListItem>
                    <asp:ListItem>April</asp:ListItem>
                    <asp:ListItem>May</asp:ListItem>
                    <asp:ListItem>June</asp:ListItem>
                    <asp:ListItem>July</asp:ListItem>
                    <asp:ListItem>August</asp:ListItem>
                    <asp:ListItem>September</asp:ListItem>
                    <asp:ListItem>October</asp:ListItem>
                    <asp:ListItem>November</asp:ListItem>
                    <asp:ListItem>December</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlDay" runat="server" ValidationGroup="sex">
                    <asp:ListItem>Day</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    <asp:ListItem>13</asp:ListItem>
                    <asp:ListItem>14</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>16</asp:ListItem>
                    <asp:ListItem>17</asp:ListItem>
                    <asp:ListItem>18</asp:ListItem>
                    <asp:ListItem>19</asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                    <asp:ListItem>21</asp:ListItem>
                    <asp:ListItem>22</asp:ListItem>
                    <asp:ListItem>23</asp:ListItem>
                    <asp:ListItem>24</asp:ListItem>
                    <asp:ListItem>25</asp:ListItem>
                    <asp:ListItem>26</asp:ListItem>
                    <asp:ListItem>27</asp:ListItem>
                    <asp:ListItem>28</asp:ListItem>
                    <asp:ListItem>29</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>31</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" class="style5" height="40px">
                &nbsp;Change Your Sex:&nbsp;</td>
            <td class="style2" align="left" height="40px">
                <asp:RadioButton ID="rbtnMale" runat="server" Text="Male" GroupName="Sex" />
&nbsp;
                <asp:RadioButton ID="rbtnFemale" runat="server" Text="Female" GroupName="Sex" />
&nbsp;
                <asp:RadioButton ID="rbtnOther" runat="server" Text="Other" GroupName="Sex" />
            </td>
        </tr>
        <tr>
            <td align="right" class="style5" height="40px">
                Enter New City :&nbsp;&nbsp;</td>
            <td align="left" class="style2" height="40px">
                <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style5" height="40px">
                &nbsp;Change Image :&nbsp;&nbsp;</td>
            <td align="left" class="style2" height="40px">
                <asp:FileUpload ID="fu1" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="center" class="style2" colspan="2" height="40px">
                <asp:Button ID="btnUpdate" runat="server" Text="Update" Height="34px" 
                    Width="110px" Font-Size="Large" 
                    ToolTip="Click here to update your profile's data" />
                </td>
        </tr>
        <tr>
            <td align="center" class="style2" colspan="2" height="40px">
                If your all profile's data are true,
                <asp:HyperLink ID="hlnkLogIn" runat="server" NavigateUrl="~/Profile.aspx" 
                    Font-Italic="True">Click here</asp:HyperLink>
&nbsp;to show profile&nbsp;&nbsp;</td>
        </tr>
        <tr>
            <td align="center" class="style2" colspan="2">
                <asp:Label ID="lblMessage" runat="server" ForeColor="#FF3300" Visible="False"></asp:Label>
                </td>
        </tr>
    </table>
</asp:Content>

