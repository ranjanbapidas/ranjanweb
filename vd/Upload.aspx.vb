Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports System.Diagnostics
Partial Class upl
    Inherits System.Web.UI.Page

    Protected Sub btnUpload_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpload.Click
        Dim sqlcon As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\VideoStreaming.mdf;Integrated Security=True;User Instance=True")
        sqlcon.Open()


        Dim title As String = txtTitle.Text
        Dim email As String = Session("UserEmail")
        Dim category As String = ddlCategory.Text
        Dim about As String = txtAbout.Text
        Dim status As String = ddlStatus.Text
        Dim vBlock As String = "No"
        Dim entryYear As String = DateTime.Now.Year
        Dim entryMonth As String = DateTime.Now.Month
        Dim entryDay As String = DateTime.Now.Day
        Dim uploadDate As String = Convert.ToDateTime(entryYear + "-" + entryMonth + "-" + entryDay).ToString
        Dim videoPath As String
        Dim thumb As String
        Dim thumbPath As String
        Dim fleSiz As Decimal
        Dim fleUnit As String
        Dim vdoSize As String

        Dim vdoID As Integer

        Dim ext As String = System.IO.Path.GetExtension(fu1.FileName)
        If (ext.ToLower = ".mkv" Or ext.ToLower = ".avi" Or ext.ToLower = ".wmv" Or ext.ToLower = ".mp4" Or ext.ToLower = ".3gp" Or ext.ToLower = ".vob" Or ext.ToLower = ".mpeg" Or ext.ToLower = ".mpg") Then
            '' Dim lv As Integer = Integer.Parse(fu1.PostedFile.ContentLength) / 1048576
            'File size checking..................
            If fu1.PostedFile.ContentLength < 20971520 Then
                
                fleUnit = "MB"
                vdoSize = "Unknown"
                Dim tempSizeFile As Decimal = Decimal.Parse(fu1.PostedFile.ContentLength)
                fleSiz = tempSizeFile / 1048576.0
                If fleSiz > 1024.0 Then
                    fleSiz = fleSiz / 1024.0
                    fleUnit = "GB"
                End If
                fleSiz = Math.Round(fleSiz, 1)
                vdoSize = fleSiz.ToString + " " + fleUnit

                videoPath = "VideoPath"
                thumbPath = "thumb"
            Else
                    lblMessage.Visible = True
                    lblMessage.Text = "File size limit is 20 MB till now !!! You have crossed the limit........."
                    GoTo xx
            End If
            '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
        Else
            lblMessage.Visible = True
            lblMessage.Text = "Only .mp4, .avi, .wmv, .mkv, .vob, .3gp, .mpeg, .mpg formated files are supported !!!!!!!!,try atgain.."
            GoTo xx
        End If
        Dim query_Upload As String = "insert into VideoUpload values('" + email + "', '" + title + "', '" + videoPath + "', '" + category + "', '" + uploadDate + "', '" + about + "', '" + status + "', '" + thumbPath + "', '" + vBlock + "', '" + vdoSize + "');"
        Dim sqlcom_Upload As New SqlCommand(query_Upload, sqlcon)
        Try

            sqlcom_Upload.ExecuteNonQuery()
            sqlcon.Close()
            sqlcon.Open()

            Dim query_videoId As String = "select max(VideoID) from VideoUpload where Email = '" + email + "';"
            Dim sqlcom_VideoId As New SqlCommand(query_videoId, sqlcon)
            Try
                vdoID = sqlcom_VideoId.ExecuteScalar
            Catch ex As Exception

            End Try

            Dim fileNm As String = System.IO.Path.GetFileNameWithoutExtension(fu1.FileName)
            Dim extraNm As String = Mid(email, 1, 2)
            fileNm = extraNm + fileNm.Trim
            fileNm = fileNm.Replace(" ", "")
            fu1.PostedFile.SaveAs(Server.MapPath(".") + "//Videos//" + vdoID.ToString + fileNm + ext)
            videoPath = "~//Videos//" + vdoID.ToString + fileNm + ext

            ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
            'extracting first screen shot 
            Dim proc As Process
            Dim vid As String = Server.MapPath(".") & "/Videos/" & vdoID.ToString & fileNm & ext
            thumb = Server.MapPath(".") & "/Thumbs/" & vdoID.ToString & fileNm & ".jpg"
            thumbPath = "~//Thumbs//" & vdoID.ToString & fileNm & ".jpg"
            'txtTitle.Text = vid
            'txtAbout.Text = thumb
            proc = New Process
            proc.StartInfo.Arguments = "-i " + vid + " -ss 00:00:01 -vframes 1 " + thumb
            proc.StartInfo.FileName = Server.MapPath("ffmpeg.exe")
            proc.Start()
            proc.WaitForExit()
            sqlcon.Close()
            sqlcon.Open()

            '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

            ' update Path column of the VideoUpload table with orginal video path and upload it to proper location... 
            Dim query_Update As String = "update VideoUpload set VideoPath='" + videoPath + "',ThumbPath='" + thumbPath + "' where VideoID = " & vdoID & " ;"
            Dim sqlcom_Update As New SqlCommand(query_Update, sqlcon)
            Try
                sqlcom_Update.ExecuteNonQuery()
            Catch ex As Exception

            End Try
            sqlcon.Close()
            '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
            'VideoDetails Table Update..........
            sqlcon.Open()
            Dim vlike As Integer = 0
            Dim vdislike As Integer = 0
            Dim vview As Integer = 0
            Dim vcomment As Integer = 0
            Dim query_VideoDetail As String = "insert into VideoDetails values(" & vdoID & ", " & vlike & ", " & vcomment & ", " & vview & ", " & vdislike & ") ; "
            Dim sqlcom_VideoDetail As New SqlCommand(query_VideoDetail, sqlcon)
            Try
                sqlcom_VideoDetail.ExecuteNonQuery()
            Catch ex As Exception

            End Try
            ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

            txtTitle.Text = ""
            txtAbout.Text = ""
            ddlCategory.Text = "<< Select >>"
            ddlStatus.Text = "Select"
            lblMessage.Visible = True
            lblMessage.ForeColor = Drawing.Color.Green
            lblMessage.Text = "Video is successfully uploaded...."
        Catch ex As Exception
            lblMessage.Visible = True
            lblMessage.Text = ex.Message
        End Try
xx:
        sqlcon.Close()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserEmail") = "" Then
            Session("LogInType") = "Upload"
            Response.Redirect("LogIn.aspx")
        End If
    End Sub
End Class
