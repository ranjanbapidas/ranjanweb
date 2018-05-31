Imports System
Imports System.Data
Imports System.Data.SqlClient
Partial Class _Default
    Inherits System.Web.UI.Page
    Dim videoStatus As String
    Dim category As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim sqlcon As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\VideoStreaming.mdf;Integrated Security=True;User Instance=True")
        sqlcon.Open()

        'Message Display................
        Dim query As String = "select top 2 Message from AdminMessage order by MsgDate desc,MsgID desc;"
        Dim da As New SqlDataAdapter(query, sqlcon)
        Dim dt As New DataTable
        Try
            da.Fill(dt)
            lblMessage1.Text = dt.Rows(0).Item(0)
            lblMessage2.Text = dt.Rows(1).Item(0)
        Catch ex As Exception

        End Try

        'Grid view videos display................
        videoStatus = "Private"

        category = ddlCategory.Text
        If category = "All Categories" Then
            category = "%" & "" & "%"
        Else
            category = "%" & category & "%"
        End If
        Dim vdoBlock As String = "No"

        Dim query_Video As String = "select VideoID,Title,ThumbPath,Category from VideoUpload where Category like '" + category + "' and Status not like '" + videoStatus + "' and Vblock='" + vdoBlock + "' order by UploadDate desc,VideoID desc ;"
        Dim da_Video As New SqlDataAdapter(query_Video, sqlcon)
        Dim dt_Video As New DataTable
        Try
            da_Video.Fill(dt_Video)
            If dt_Video.Rows.Count < 1 Then
                lblTopMessage.Text = "No Video found in"
                gvVideo.Visible = False
            Else
                lblTopMessage.Text = "Recent Videos of"
                gvVideo.Visible = True
            End If

            gvVideo.DataSource = dt_Video
            DataBind()
        Catch ex As Exception

        End Try
        sqlcon.Close()
    End Sub

    Protected Sub gvVideo_RowCommand(ByVal sender As Object, ByVal e As CommandEventArgs)
        If e.CommandName = "View" Then
            Session("VidID") = e.CommandArgument
            Response.Redirect("View.aspx")
        End If
    End Sub


    Protected Sub OnPageIndexChangingV(ByVal sender As Object, ByVal e As GridViewPageEventArgs)
        gvVideo.PageIndex = e.NewPageIndex
        Page_Load(gvVideo, e)
        gvVideo.DataBind()
    End Sub

    Protected Sub imgbtnSearch_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgbtnSearch.Click
        If txtSearch.Text.Trim <> "" Then
            lblErrorSearch.Visible = False
            Session("SearchElement") = txtSearch.Text.Trim
            Response.Redirect("HomeSearch.aspx")
        Else
            lblErrorSearch.Visible = True
            txtSearch.Focus()
        End If

    End Sub
End Class
