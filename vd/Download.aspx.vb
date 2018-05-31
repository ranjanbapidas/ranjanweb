Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports System.Diagnostics
Partial Class Download
    Inherits System.Web.UI.Page
    Shared videoID As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("VdoPath") <> "" Then
            lbtnDownload.CommandArgument = Session("VdoPath")

        Else
            Response.Redirect("View.aspx")
        End If
    End Sub
    Protected Sub DownloadFile(ByVal sender As Object, ByVal e As EventArgs)
        Dim filePath As String = TryCast(sender, LinkButton).CommandArgument
        Response.ContentType = ContentType
        Response.AppendHeader("Content-Disposition", "attachment;filename=" & System.IO.Path.GetFileName(filePath))
        Response.WriteFile(filePath)
        Response.[End]()
    End Sub

    Protected Sub btnClickSure_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClickSure.Click
        Dim proc As Process
        Dim vid As String = Server.MapPath(".") & "/Videos/" & Mid(Session("VdoPath"), 12)
        Dim convetVideoPath As String = Server.MapPath(".") & "/ConvertVideos/" & Left(Mid(Session("VdoPath"), 12), Mid(Session("VdoPath"), 12).Length - 4) & ddlExtension.Text
        proc = New Process
        proc.StartInfo.Arguments = "-i " + vid + " " + convetVideoPath
        proc.StartInfo.FileName = Server.MapPath("ffmpeg.exe")
        proc.Start()
        proc.WaitForExit()
        Dim lbtnConVideo As New LinkButton
        lbtnConVideo.CommandArgument = convetVideoPath
        DownloadFile(lbtnConVideo, e)
    End Sub
End Class
