
Partial Class ProfilePicture
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("imp") <> "" Then
            Image1.Visible = True
            Image1.ImageUrl = Session("imp")
        Else
            If Session("UserEmail") <> "" Then
                Response.Redirect("Profile.aspx")
            Else
                Response.Redirect("LogIn.aspx")
            End If
        End If
        

    End Sub

    Protected Sub lbtnBack_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbtnBack.Click
        Session("imp") = ""
        If Session("ProfileType") = "OwnProfile" Then
            Session("ProfileType") = ""
            Response.Redirect("Profile.aspx")
        ElseIf Session("ProfileType") = "AnotherProfile" Then
            Session("ProfileType") = ""
            Response.Redirect("ProfileAnyone.aspx")
        End If

    End Sub
End Class
