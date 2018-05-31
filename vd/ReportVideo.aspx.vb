Imports System
Imports System.Data
Imports System.Data.SqlClient
Partial Class ReportVideo
    Inherits System.Web.UI.Page
    Shared videoID As Integer
    Shared email As String
    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        Dim sqlcon_Report As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\VideoStreaming.mdf;Integrated Security=True;User Instance=True")
        sqlcon_Report.Open()
       
        Dim cause As String = txtCause.Text.Trim
        Dim entryYear As String = DateTime.Now.Year
        Dim entryMonth As String = DateTime.Now.Month
        Dim entryDay As String = DateTime.Now.Day
        Dim uploadDate As String = Convert.ToDateTime(entryYear + "-" + entryMonth + "-" + entryDay).ToString
        Dim query_report_insert As String = "insert into ReportVideo values(" & videoID & ",'" + email + "','" + uploadDate + "','" + cause + "');"
        Dim sqlcom_report_insert As New SqlCommand(query_report_insert, sqlcon_Report)
        Try
            sqlcom_report_insert.ExecuteNonQuery()
            txtCause.Text = ""
            txtCause.Visible = False
            btnSubmit.Visible = False
            lblheading.Visible = False
            lblmessage.Visible = True
        Catch ex As Exception

        End Try
        sqlcon_Report.Close()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim sqlcon_Report As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\VideoStreaming.mdf;Integrated Security=True;User Instance=True")
        sqlcon_Report.Open()
        If Session("UserEmail") <> "" Then
            videoID = Integer.Parse(Session("VidID"))
            email = Session("UserEmail")
            
            Dim query_report_check As String = "select VideoID from ReportVideo where VideoID=" & videoID & " and ReportedBy='" + email + "' ; "
            Dim sqlcom_report_check As New SqlCommand(query_report_check, sqlcon_Report)
            Dim rptCheck As String
            Try
                rptCheck = sqlcom_report_check.ExecuteScalar
                If rptCheck = "" Then
                    btnSubmit.Visible = True
                    txtCause.Visible = True
                    lblheading.Visible = True
                Else
                    btnSubmit.Visible = False
                    txtCause.Visible = False
                    lblheading.Visible = False
                    lblmessage.Visible = True
                    lblmessage.Text = "You have already reported this video."
                End If
            Catch ex As Exception
                lblmessage.Visible = True
                lblmessage.ForeColor = Drawing.Color.Red
                lblmessage.Text = ex.Message
            End Try

            
        Else
            Response.Redirect("LogIn.aspx")
        End If

    End Sub
End Class
