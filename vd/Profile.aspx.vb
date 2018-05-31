Imports System
Imports System.Data
Imports System.Data.SqlClient
Partial Class Profile
    Inherits System.Web.UI.Page
    Shared rowCheck As Integer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim email As String = Session("UserEmail")
        If email <> "" Then
            rowCheck = 2
            Dim sqlcon As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\VideoStreaming.mdf;Integrated Security=True;User Instance=True")
            sqlcon.Open()
            Dim query_Name As String = "select Name,User_DOB,Sex,City,ImagePath from SignUp where Email='" + email + "';"
            Dim da As New SqlDataAdapter(query_Name, sqlcon)
            Dim dt As New DataTable
            Try
                da.Fill(dt)
                lblProfileName.Text = "Welcome" & " " & dt.Rows(0).Item(0)
                lblEmail.Text = email
                lblDOB.Text = Day(dt.Rows(0).Item(1)) & "-" & MonthName(Month(dt.Rows(0).Item(1))) & "-" & Year(dt.Rows(0).Item(1))
                lblSex.Text = dt.Rows(0).Item(2)
                lblCity.Text = dt.Rows(0).Item(3)

                imgBtnProfile.ImageUrl = dt.Rows(0).Item(4)
                Session("imp") = dt.Rows(0).Item(4)
                DataBind()
                Dim query_VideoDetails As String = "select Top 3 VideoID,Title,Category,ThumbPath from VideoUpload where Email='" + email + "'  order by UploadDate desc,VideoID desc ;"
                Dim da_VideoDetails As New SqlDataAdapter(query_VideoDetails, sqlcon)
                Dim dt_VideoDetails As New DataTable
                Try
                    gvDetails.Visible = True
                    da_VideoDetails.Fill(dt_VideoDetails)
                    gvDetails.DataSource = dt_VideoDetails
                    DataBind()
                    If dt_VideoDetails.Rows.Count > 0 Then
                        lblTopMessage.Text = "Your Last Uploaded Videos......"
                        lblBottomMessage.Text = "to show all videos......"
                        lbtnVideo.ToolTip = "Click here to show all video of a particular status"
                        rowCheck = 1
                    Else
                        rowCheck = 2
                        lblTopMessage.Text = "You have no uploaded videos............"
                        lblBottomMessage.Text = "to upload videos......"
                        lbtnVideo.ToolTip = "Click here to upload video"
                    End If
                Catch ex As Exception

                End Try
            Catch ex As Exception
                LblErr.Visible = True
                LblErr.Text = ex.Message
            End Try
            sqlcon.Close()
        Else
            Session("LogInType") = "Profile"
            Response.Redirect("LogIn.aspx")
        End If
       
    End Sub

    Protected Sub gvDetails_RowCommand(ByVal sender As Object, ByVal e As CommandEventArgs)
        If e.CommandName = "View" Then
            Session("VidID") = e.CommandArgument
            Response.Redirect("View.aspx")
        End If
    End Sub


    Protected Sub OnPageIndexChanging(ByVal sender As Object, ByVal e As GridViewPageEventArgs)
        gvDetails.PageIndex = e.NewPageIndex
        Page_Load(gvDetails, e)
        gvDetails.DataBind()
    End Sub

    Protected Sub lbtnVideo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbtnVideo.Click
        If rowCheck = 1 Then
            Response.Redirect("AllVideo.aspx")
        ElseIf rowCheck = 2 Then
            Response.Redirect("Upload.aspx")
        End If
    End Sub

    Protected Sub imgBtnProfile_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgBtnProfile.Click
        Session("ProfileType") = "OwnProfile"
        Response.Redirect("ProfilePicture.aspx")
    End Sub
End Class
