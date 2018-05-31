Imports System
Imports System.Data
Imports System.Data.SqlClient
Partial Class AllVideo
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim email As String = Session("UserEmail")
        Dim stat As String
        If email <> "" Then
            Dim sqlcon As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\VideoStreaming.mdf;Integrated Security=True;User Instance=True")
            sqlcon.Open()
            If ddlFilture.Text = "All" Then
                stat = "%" & "" & "%"
            Else
                stat = "%" & ddlFilture.Text & "%"
            End If
            Try
                Dim query_VideoDetails1 As String = "select VideoID,Title,Category,ThumbPath from VideoUpload where Email='" + email + "' and Status like '" + stat + "' order by UploadDate desc,VideoID desc ;"
                Dim da_VideoDetails1 As New SqlDataAdapter(query_VideoDetails1, sqlcon)
                Dim dt_VideoDetails1 As New DataTable
                Try
                    gvDetails.Visible = True
                    da_VideoDetails1.Fill(dt_VideoDetails1)
                    gvDetails.DataSource = dt_VideoDetails1
                    DataBind()
                    If dt_VideoDetails1.Rows.Count < 1 Then
                        lblTotal.Visible = False
                        lblTopMessage.Text = "You have no " & ddlFilture.Text & " videos ....."
                    Else
                        lblTopMessage.Text = "Your " & ddlFilture.Text & " videos are....."
                        lblTotal.Visible = True
                        lblTotal.Text = "Total Number Of " & ddlFilture.Text & " Videos = " & dt_VideoDetails1.Rows.Count
                    End If
                Catch ex As Exception

                End Try
               
                'sqlcon.Close()
            Catch ex As Exception
                LblErr.Visible = True
                LblErr.Text = ex.Message
            End Try



            sqlcon.Close()

        Else
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

End Class
