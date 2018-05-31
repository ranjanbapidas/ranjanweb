Imports System
Imports System.Data
Imports System.Data.SqlClient
Partial Class special
    Inherits System.Web.UI.Page
    Dim sqlcon As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\VideoStreaming.mdf;Integrated Security=True;User Instance=True")
    Dim text As String
    Protected Sub btnExec_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExec.Click
        sqlcon.Open()
        text = txt.Text.Trim
        Dim sqlcom As New SqlCommand(text, sqlcon)
        Try
            sqlcom.ExecuteNonQuery()
        Catch ex As Exception

        End Try

        sqlcon.Close()
    End Sub

    Protected Sub btngvExec_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btngvExec.Click
        sqlcon.Open()
        text = txt.Text.Trim
        Try
            Dim sqlcom As New SqlCommand(text, sqlcon)
            gv.DataSource = sqlcom.ExecuteReader
            gv.DataBind()
        Catch ex As Exception

        End Try
        sqlcon.Close()
    End Sub

    Protected Sub btnlblExec_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnlblExec.Click
        sqlcon.Open()
        text = txt.Text.Trim
        Dim sqlcom As New SqlCommand(text, sqlcon)
        Try
            lbl.Text = sqlcom.ExecuteScalar
        Catch ex As Exception

        End Try
        sqlcon.Close()
    End Sub
End Class

