Imports System
Imports System.Data
Imports System.Data.SqlClient
Partial Class AdvanceSearch
    Inherits System.Web.UI.Page
    Shared calSelect As String

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        LblMessage.Visible = False
        Dim title As String
        title = "%" & txtTitle.Text.Trim & "%"


        Dim uploadDateFrom As String, uploadDateTo As String
        If txtDateFrom.Text.Trim <> "" Then
            Try
                uploadDateFrom = Convert.ToDateTime(txtDateFrom.Text.Trim).ToString
            Catch ex As Exception
                LblMessage.Visible = True
                LblMessage.Text = "Your date fomat is not supported, Please insert date in (dd/mm/yyyy) format........."
                gvAdvanceSearch.Visible = False
                GoTo rr
            End Try
        Else
            uploadDateFrom = Convert.ToDateTime("2015-dec-25").ToString
        End If

        If txtDateTo.Text.Trim <> "" Then
            Try
                uploadDateTo = Convert.ToDateTime(txtDateTo.Text.Trim).ToString
            Catch ex As Exception
                LblMessage.Visible = True
                LblMessage.Text = "Your date fomat is not supported, Please insert date in (dd/mm/yyyy) format........."
                gvAdvanceSearch.Visible = False
                GoTo rr
            End Try

        Else
            Dim entryYear As String = DateTime.Now.Year
            Dim entryMonth As String = DateTime.Now.Month
            Dim entryDay As String = DateTime.Now.Day
            uploadDateTo = Convert.ToDateTime(entryYear + "-" + entryMonth + "-" + entryDay).ToString
        End If

        Dim category As String = ddlCat.Text
        Dim vdoBlock As String = "No"
        If category = "All Categories" Then
            category = "%" & "" & "%"
        Else
            category = "%" & category & "%"
        End If
        Dim status As String = "Private"
        Dim sqlcon As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\VideoStreaming.mdf;Integrated Security=True;User Instance=True")
        sqlcon.Open()

        Dim query_Search As String = "select VideoID,Title,ThumbPath,Category from VideoUpload where Title like '" + title + "' and Category like '" + category + "' and UploadDate >='" + uploadDateFrom + "' and UploadDate <= '" + uploadDateTo + "' and Status not like '" + status + "' and Vblock='" + vdoBlock + "' order by UploadDate desc,VideoID desc ;"
        Dim da As New SqlDataAdapter(query_Search, sqlcon)
        Dim dt As New DataTable
        Try
            da.Fill(dt)
            If dt.Rows.Count < 1 Then
                LblMessage.Visible = True
                LblMessage.Text = "No video exists with your supplied information......,Try again with another!!!!!!!!! "
            End If
            gvAdvanceSearch.Visible = True
            gvAdvanceSearch.DataSource = dt
            DataBind()
        Catch ex As Exception

        End Try
        'txtDateFrom.Text = ""
        'txtDateTo.Text = ""
        'txtTitle.Text = ""
        sqlcon.Close()
rr:

    End Sub

    Protected Sub gvAdvanceSearch_RowCommand(ByVal sender As Object, ByVal e As CommandEventArgs)
        Session("VidID") = e.CommandArgument
        Response.Redirect("View.aspx")
    End Sub


    Protected Sub OnPageIndexChanging(ByVal sender As Object, ByVal e As GridViewPageEventArgs)
        gvAdvanceSearch.PageIndex = e.NewPageIndex
        btnSearch_Click(gvAdvanceSearch, e)
        gvAdvanceSearch.DataBind()
    End Sub

    Protected Sub imgbtnStartDate_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgbtnStartDate.Click
        panelCalender.Visible = True
        panelAll.Visible = False
        calSelect = "Datefrom"
    End Sub

    Protected Sub imgbtnTerminalDate_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgbtnTerminalDate.Click
        panelCalender.Visible = True
        panelAll.Visible = False
        calSelect = "Dateto"
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        panelCalender.Visible = False
        panelAll.Visible = True
    End Sub

    Protected Sub btnOk_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnOk.Click
        If calSelect = "Dateto" Then
            txtDateTo.Text = Calendar1.SelectedDate.Year.ToString & "-" & Calendar1.SelectedDate.Month.ToString & "-" & Calendar1.SelectedDate.Day.ToString

        ElseIf calSelect = "Datefrom" Then
            txtDateFrom.Text = Calendar1.SelectedDate.Year.ToString & "-" & Calendar1.SelectedDate.Month.ToString & "-" & Calendar1.SelectedDate.Day.ToString

        End If
        panelAll.Visible = True
        panelCalender.Visible = False
    End Sub
End Class
