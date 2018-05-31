<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="SignUp.aspx.vb" Inherits="SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {            height: 19px;
        }
        .style5
        {
        }
        .style6
        {
            width: 225px;
        }
        .style7
        {
            width: 211px;
        }
        .style8
        {
            height: 52px;
        }
        .style9
        {
            width: 225px;
            height: 52px;
        }
        .style11
        {
            height: 31px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="style1" bgcolor="#E5E5E5">
        <tr>
            <td class="style2" colspan="3" align="center" valign="middle">
                <h1>SignUp </h1>&nbsp;</td>
        </tr>
        <tr>
            <td class="style7" height="40px" align="right">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Email ID :&nbsp;</td>
            <td class="style6" height="40px">
                <asp:TextBox ID="txtEmail" runat="server" Enabled="False"></asp:TextBox>
            </td>
            <td height="40px">
                <asp:RegularExpressionValidator ID="revalEmail" runat="server" 
                    ErrorMessage="Enter Valid Email" ForeColor="#FF3300" 
                    ControlToValidate="txtEmail" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <br />
                <asp:RequiredFieldValidator ID="rfvalEmail" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Enter Email" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style7" height="40px" align="right">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Password :&nbsp;</td>
            <td class="style6" height="40px">
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td height="40px">
                <asp:RequiredFieldValidator ID="rfvalPassword" runat="server" 
                    ErrorMessage="Enter Password" ForeColor="#FF3300" 
                    ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style7" height="40px" align="right">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Retype Password :&nbsp;</td>
            <td class="style6" height="40px">
                <asp:TextBox ID="txtRePassword" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td height="40px">
                <asp:CompareValidator ID="cvalRePassword" runat="server" 
                    ErrorMessage="Retype Password Correctly" ForeColor="#FF3300" 
                    ControlToCompare="txtPassword" ControlToValidate="txtRePassword"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style7" height="40px" align="right">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Name :&nbsp;</td>
            <td class="style6" height="40px">
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </td>
            <td height="40px">
                <asp:RequiredFieldValidator ID="rfvalName" runat="server" 
                    ErrorMessage="Enter Name" ForeColor="#FF3300" ControlToValidate="txtName"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style7" height="40px" align="right">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DOB :&nbsp;</td>
            <td class="style6" height="40px">
                <asp:DropDownList ID="ddlYear" runat="server">
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
                <asp:DropDownList ID="ddlMonth" runat="server">
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
                <asp:DropDownList ID="ddlDay" runat="server">
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
            <td height="40px">
                <asp:CompareValidator ID="cvalYear" runat="server" ErrorMessage="Select Year" 
                    ForeColor="#FF3300" ControlToValidate="ddlYear" Operator="NotEqual" 
                    ValueToCompare="Year"></asp:CompareValidator>
                <br />
                <asp:CompareValidator ID="cvalMonth" runat="server" ErrorMessage="Select Month" 
                    ForeColor="#FF3300" ControlToValidate="ddlMonth" Operator="NotEqual" 
                    ValueToCompare="Month"></asp:CompareValidator>
                <br />
                <asp:CompareValidator ID="cvalDay" runat="server" ErrorMessage="Select Day" 
                    ForeColor="#FF3300" ControlToValidate="ddlDay" Operator="NotEqual" 
                    ValueToCompare="Day"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style7" height="40px" align="right">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sex:&nbsp;</td>
            <td class="style6" height="40px">
                <asp:RadioButtonList ID="rdblSex" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td height="40px">
                <asp:RequiredFieldValidator ID="rfvalSex" runat="server" 
                    ErrorMessage="Select Sex" ForeColor="#FF3300" ControlToValidate="rdblSex"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style7" height="40px" align="right">
                City :&nbsp;</td>
            <td class="style6" height="40px">
                <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
            </td>
            <td height="40px">
                <asp:RequiredFieldValidator ID="rfvalCity" runat="server" 
                    ControlToValidate="txtCity" ErrorMessage="Enter City" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style7" height="40px" align="right">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Upload Image :&nbsp;</td>
            <td class="style6" height="40px">
                <asp:FileUpload ID="fu1" runat="server" />
            </td>
            <td height="40px">
                <asp:RequiredFieldValidator ID="rfvalImage" runat="server" 
                    ErrorMessage="Select Image" ForeColor="#FF3300" ControlToValidate="fu1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style11" align="center" colspan="3">
                <asp:Label ID="lblTerms" runat="server" 
                    Text="By clicking up to Sign Up button,you are agreed to the" 
                    ForeColor="#333399"></asp:Label>
                <asp:HyperLink ID="hlterms" runat="server" 
                    NavigateUrl="~/TermsAndCondition.aspx" Font-Italic="True">terms and condition.</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td class="style8">
            </td>
            <td class="style9">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" Height="34px" 
                    Width="110px" Font-Size="Large" 
                    ToolTip="Click here to sign up successfully" />
                &nbsp;</td>
            <td class="style8">
            </td>
        </tr>
        <tr>
            <td class="style5" colspan="3" height="40px" align="center">
                If you have already Signed up,
                <asp:HyperLink ID="hlnkLogIn" runat="server" NavigateUrl="~/LogIn.aspx" 
                    Font-Italic="True">Click here</asp:HyperLink>
&nbsp;to login&nbsp;</td>
        </tr>
        <tr>
            <td class="style5" colspan="3" height="40px">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblMessage" runat="server" ForeColor="#FF3300" Visible="False"></asp:Label>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

