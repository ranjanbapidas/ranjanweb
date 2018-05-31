Imports System
Imports System.Data
Imports System.Data.SqlClient
Partial Class ProfileAnyone
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("VidID") <> "" Then
            Dim videoStatus As String = "Public"
            Dim vdoBlock As String = "No"
            Dim sqlcon As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\VideoStreaming.mdf;Integrated Security=True;User Instance=True")
            sqlcon.Open()
            Dim videoId As Integer = Integer.Parse(Session("VidID"))
            Dim email As String
            Dim query_email As String = "select Email from VideoUpload where VideoID=" & videoId & ";"
            Dim sqlcom_email As New SqlCommand(query_email, sqlcon)
            Try
                email = sqlcom_email.ExecuteScalar
            Catch ex As Exception

            End Try
            Dim query_Name As String = "select Name,Sex,City,ImagePath from SignUp where Email='" + email + "';"
            Dim da As New SqlDataAdapter(query_Name, sqlcon)
            Dim dt As New DataTable
            Try
                da.Fill(dt)
                lblProfileName.Text = dt.Rows(0).Item(0)
                lblEmail.Text = email
                lblSex.Text = dt.Rows(0).Item(1)
                lblCity.Text = dt.Rows(0).Item(2)

                imgBtnProfile.ImageUrl = dt.Rows(0).Item(3)
                Session("imp") = dt.Rows(0).Item(3)
                DataBind()
                Dim query_VideoDetails As String = "select VideoID,Title,Category,ThumbPath from VideoUpload where Email='" + email + "' and Status = '" + videoStatus + "' and Vblock='" + vdoBlock + "' order by UploadDate desc,VideoID desc ;"
                Dim da_VideoDetails As New SqlDataAdapter(query_VideoDetails, sqlcon)
                Dim dt_VideoDetails As New DataTable
                Try
                    gvDetails.Visible = True
                    da_VideoDetails.Fill(dt_VideoDetails)
                    gvDetails.DataSource = dt_VideoDetails
                    DataBind()
                    If dt_VideoDetails.Rows.Count > 0 Then
                        lblTopMessage.Text = "Uploaded Videos of " & dt.Rows(0).Item(0) & " ............."
                    Else
                        lblTopMessage.Text = dt.Rows(0).Item(0) & "no uploaded videos............"
                    End If
                Catch ex As Exception

                End Try
            Catch ex As Exception
                LblErr.Visible = True
                LblErr.Text = ex.Message
            End Try
        Else
            Response.Redirect("Default.aspx")
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

    Protected Sub imgBtnProfile_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgBtnProfile.Click
        Session("ProfileType") = "AnotherProfile"
        Response.Redirect("ProfilePicture.aspx")
    End Sub
End Class
