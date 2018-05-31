Imports System
Imports System.Data
Imports System.Data.SqlClient
Partial Class HomeSearch
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("SearchElement") <> "" Then

            Dim sqlcon_Search As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\VideoStreaming.mdf;Integrated Security=True;User Instance=True")
            sqlcon_Search.Open()

            Dim videoStatus As String
            videoStatus = "Private"
            Dim vdoBlock As String = "No"
            Dim searchText As String = "%" & Session("SearchElement") & "%"
            Dim query_Search As String = "select VideoId,Title,Category,ThumbPath from VideoUpload where Title like '" + searchText + "' and Status not like '" + videoStatus + "' and Vblock='" + vdoBlock + "' order by Title,UploadDate,VideoID desc ;"
            Dim da_Search As New SqlDataAdapter(query_Search, sqlcon_Search)
            Dim dt_Search As New DataTable
            Try
                da_Search.Fill(dt_Search)
                gvSearch.Visible = True
                Try
                    gvSearch.DataSource = dt_Search
                    DataBind()
                Catch ex As Exception
                    'lblErrorMessage.Text = ex.Message
                End Try
            Catch ex As Exception

            End Try


            If dt_Search.Rows.Count < 1 Then
                lblMessage.Font.Size = 14
                lblMessage.ForeColor = Drawing.ColorTranslator.FromHtml("#f30")
                lblMessage.Text = "No Videos found with your given letters...,Try again!!!!"

            Else
                lblMessage.Font.Size = 20
                lblMessage.ForeColor = Drawing.ColorTranslator.FromHtml("#336666")
                lblMessage.Text = "Your Required Videos..."

            End If
            sqlcon_Search.Close()
        Else
            Response.Redirect("Default.aspx")

        End If
    End Sub

    Protected Sub gvSearch_RowCommand(ByVal sender As Object, ByVal e As CommandEventArgs)
        If e.CommandName = "View" Then
            Session("VidID") = e.CommandArgument
            Response.Redirect("View.aspx")
        End If
    End Sub


    Protected Sub OnPageIndexChanging(ByVal sender As Object, ByVal e As GridViewPageEventArgs)
        gvSearch.PageIndex = e.NewPageIndex
        Page_Load(gvSearch, e)
        gvSearch.DataBind()
    End Sub

   
End Class
