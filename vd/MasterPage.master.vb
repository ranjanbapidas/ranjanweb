
Partial Class MasterPage
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserEmail") <> "" Then
            lbtn1.Text = "Logout"
        Else
            lbtn1.Text = "Login"
        End If
    End Sub

    Protected Sub lbtn1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbtn1.Click
        If Session("UserEmail") <> "" Then
            Session("UserEmail") = ""
            Session("imp") = ""
            Session("VideoID") = ""
            Response.Redirect("Default.aspx")
        Else
            Response.Redirect("LogIn.aspx")
        End If
    End Sub
End Class

