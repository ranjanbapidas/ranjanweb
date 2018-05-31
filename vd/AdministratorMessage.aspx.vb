Imports System
Imports System.Data
Imports System.Data.SqlClient
Partial Class Default2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim sqlcon As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\VideoStreaming.mdf;Integrated Security=True;User Instance=True")
        sqlcon.Open()
        'admin message display..........
        Dim query As String = "select Message,MsgDate from AdminMessage order by MsgDate desc,MsgID desc ;"
        Dim da As New SqlDataAdapter(query, sqlcon)
        Dim dt As New DataTable
        Try
            da.Fill(dt)
            ' For i = 0 To dt.Rows.Count - 1
            'dt.Rows(i).Item(1) = Day(dt.Rows(i).Item(1)) & "-" & MonthName(Month(dt.Rows(i).Item(1))) & "-" & Year(dt.Rows(i).Item(1))
            'Next

            gvMessage.DataSource = dt
            DataBind()
        Catch ex As Exception

        End Try

        sqlcon.Close()

    End Sub
    Protected Sub OnPageIndexChangingV(ByVal sender As Object, ByVal e As GridViewPageEventArgs)
        gvMessage.PageIndex = e.NewPageIndex
        Page_Load(gvMessage, e)
        gvMessage.DataBind()
    End Sub
End Class
