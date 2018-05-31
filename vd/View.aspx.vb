Imports System
Imports System.Data
Imports System.Data.SqlClient

Partial Class View
    Inherits System.Web.UI.Page
    Shared videoID As Integer
    Shared vPath As String
    Shared tPath As String
    Shared statusChange As String
    Shared lcount As Integer
    Shared dlCount As Integer
    Dim vdViewCount As Integer
    Shared likeStatChk As String
    Shared query_LikeStatusCheck As String
    Shared email As String

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        ddlStatus.Text = statusChange
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim sqlcon As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\VideoStreaming.mdf;Integrated Security=True;User Instance=True")
        sqlcon.Open()
        email = Session("UserEmail")
        If Session("VidID") <> "" Then
            videoID = Integer.Parse(Session("VidID"))
            'Video Details display in label..........................
            Dim query As String = "select Email,Title,UploadDate,About,Status,VideoPath,ThumbPath,SizeOfVideo,Category from VideoUpload where VideoID=" & videoID & ";"
            Dim da As New SqlDataAdapter(query, sqlcon)
            Dim dt As New DataTable
            Try
                da.Fill(dt)

                lblTitle.Text = dt.Rows(0).Item(1)
                lblUploadDate.Text = "on : " & Day(dt.Rows(0).Item(2)) & "-" & MonthName(Month(dt.Rows(0).Item(2))) & "-" & Year(dt.Rows(0).Item(2))
                If dt.Rows(0).Item(3) <> "" Then
                    lblAbout.Visible = True
                    lblAbout.Text = "About : " & dt.Rows(0).Item(3)
                Else
                    lblAbout.Visible = False
                End If
                lblStatus.Text = "Status : " & dt.Rows(0).Item(4)
                vPath = dt.Rows(0).Item(5)
                tPath = dt.Rows(0).Item(6)
                lblFileSize.Text = "Size : " & dt.Rows(0).Item(7)
                lblCategory.Text = "Category : " & dt.Rows(0).Item(8)

                'lblAbout.Text = vPath
                Dim ema As String = dt.Rows(0).Item(0)
                'checking if videoUploader and logged in user are same..............................
                Dim query_Name As String = "select Name from SignUp where Email='" + ema + "'; "
                Dim sqlcom_Name As New SqlCommand(query_Name, sqlcon)
                Try
                    lblName.Text = "Upload By : "
                    lbtnName.Text = sqlcom_Name.ExecuteScalar
                Catch ex As Exception

                End Try

                If email = ema Then
                    lbtnDelete.Visible = True
                    lbtnStatusChange.Visible = True
                    lblStatus.Visible = True
                    lbtnReport.Visible = False
                End If
            Catch ex As Exception

            End Try

            'Like and Dislike.................................................
            Dim query_count_like As String = "select VLike from VideoDetails where V_ID=" & videoID & "; "
            Dim sqlcom_count_like As New SqlCommand(query_count_like, sqlcon)
            Try
                lcount = sqlcom_count_like.ExecuteScalar
            Catch ex As Exception

            End Try
            query_LikeStatusCheck = "select Status from LikeStatus where VideoID=" & videoID & " and Email='" + email + "' ;"
            Dim sqlcom_LikeStatusCheck As New SqlCommand(query_LikeStatusCheck, sqlcon)
            Try
                likeStatChk = sqlcom_LikeStatusCheck.ExecuteScalar
            Catch ex As Exception

            End Try
            If lcount = 0 Then
                lblLike.Text = "0 like"
            Else
                If likeStatChk = "L" Then
                    lbtnLike.Visible = False
                    lblLike.Text = "you and " & (lcount - 1).ToString & " more likes"
                Else

                    lblLike.Text = lcount.ToString & " likes"
                End If
            End If
            Dim query_count_Dislike As String = "select VDislike from VideoDetails where V_ID=" & videoID & "; "
            Dim sqlcom_count_Dislike As New SqlCommand(query_count_Dislike, sqlcon)

            Try
                If IsDBNull(sqlcom_count_Dislike.ExecuteScalar) Then
                    dlCount = 0
                Else
                    dlCount = sqlcom_count_Dislike.ExecuteScalar
                End If
            Catch ex As Exception

            End Try
           
            If dlCount = 0 Then
                lblDislike.Text = "0 dislike"
            Else
                If likeStatChk = "D" Then
                    lbtnDislike.Visible = False
                    lblDislike.Text = "you and " & (dlCount - 1).ToString & " more dislikes"
                Else
                    lblDislike.Text = lcount.ToString & " dislikes"
                End If
            End If
            Dim query_count_View As String = "select VView from VideoDetails where V_ID=" & videoID & "; "
            Dim sqlcom_count_View As New SqlCommand(query_count_View, sqlcon)
            Try
                vdViewCount = sqlcom_count_View.ExecuteScalar
                lblView.Text = vdViewCount & " Views"
            Catch ex As Exception

            End Try
        Else
            Response.Redirect("Default.aspx")

        End If

        sqlcon.Close()
    End Sub

    Protected Sub lbtnDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbtnDelete.Click
        lblYesNo.Visible = True
        btnYes.Visible = True
        btnNo.Visible = True
        lbtnDelete.Visible = False
        lbtnStatusChange.Visible = False
    End Sub

    Protected Sub btnYes_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnYes.Click
        Dim sqlcon_Delete As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\VideoStreaming.mdf;Integrated Security=True;User Instance=True")
        sqlcon_Delete.Open()
        Dim query_Delete As String = "delete from VideoUpload where VideoID=" & videoID & ";"
        Dim sqlcom_Delete As New SqlCommand(query_Delete, sqlcon_Delete)
        Dim vpath1 As String = vPath
        vpath1 = Server.MapPath(".") + Mid(vpath1, 2)
        'lblAbout.Text = vPath
        System.IO.File.Delete(vpath1)
        tPath = Server.MapPath(".") + Mid(tPath, 2)
        'lblAbout.Text = vPath
        System.IO.File.Delete(tPath)
        Try
            sqlcom_Delete.ExecuteNonQuery()
        Catch ex As Exception

        End Try
        Dim query_LikeDelete As String = "delete from LikeStatus where VideoID=" & videoID & ";"
        Dim sqlcom_LikeDelete As New SqlCommand(query_LikeDelete, sqlcon_Delete)
        Dim query_DetailDelete As String = "delete from VideoDetails where V_ID=" & videoID & ";"
        Dim sqlcom_DetailDelete As New SqlCommand(query_DetailDelete, sqlcon_Delete)
        Try
            sqlcom_DetailDelete.ExecuteNonQuery()
        Catch ex As Exception

        End Try
        Try
            sqlcom_LikeDelete.ExecuteNonQuery()
        Catch ex As Exception

        End Try

        lblYesNo.Visible = False
        Response.Redirect("Profile.aspx")
        sqlcon_Delete.Close()
    End Sub

    Protected Sub btnNo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNo.Click
        lblYesNo.Visible = False
        btnYes.Visible = False
        btnNo.Visible = False
    End Sub

    Protected Sub lbtnStatusChange_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbtnStatusChange.Click
        ddlStatus.Visible = True
        btnSave.Visible = True
        btnCancel.Visible = True
        lblSelectStatus.Visible = True
        lbtnDelete.Visible = False
        lbtnStatusChange.Visible = False
    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click
        statusChange = ddlStatus.Text

        Dim sqlcon_updateStatus As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\VideoStreaming.mdf;Integrated Security=True;User Instance=True")
        sqlcon_updateStatus.Open()
        Dim query_updateStatus As String = "update VideoUpload set Status='" + statusChange + "' where VideoID=" & videoID & ";"
        Dim sqlcom_updateStatus As New SqlCommand(query_updateStatus, sqlcon_updateStatus)
        Try
            sqlcom_updateStatus.ExecuteNonQuery()
            Response.Redirect("View.aspx")
            ddlStatus.Visible = False
            btnSave.Visible = False
            btnCancel.Visible = False
            lblSelectStatus.Visible = False
            lbtnDelete.Visible = True
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        btnSave.Visible = False
        btnCancel.Visible = False
        ddlStatus.Visible = False
        lblSelectStatus.Visible = False
    End Sub

    Protected Sub btnPlay_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPlay.Click
        btnPlay.Visible = False
        vPath = "Videos" & Mid(vPath, 11)
        'lblAbout.Text = path
        Video.Attributes.Add("src", vPath)
        Video.Attributes.Add("value", vPath)
        Try
            vdViewCount = vdViewCount + 1
            Dim sqlcon_ViewUpdate As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\VideoStreaming.mdf;Integrated Security=True;User Instance=True")
            sqlcon_ViewUpdate.Open()
            Dim query_ViewUpdate As String = "update VideoDetails set VView=" & vdViewCount & " where V_ID=" & videoID & " ; "
            Dim sqlcom_ViewUpdate As New SqlCommand(query_ViewUpdate, sqlcon_ViewUpdate)
            Try
                sqlcom_ViewUpdate.ExecuteNonQuery()
            Catch ex As Exception

            End Try
            sqlcon_ViewUpdate.Close()
        Catch ex As Exception
           
        End Try
       
    End Sub

    Protected Sub btnDownload_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDownload.Click
        Session("VdoPath") = vPath
        Response.Redirect("Download.aspx")
    End Sub

    Protected Sub lbtnReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbtnReport.Click
        If Session("UserEmail") <> "" Then
            Response.Redirect("ReportVideo.aspx")
        Else
            Session("LogInType") = "View"
            Response.Redirect("LogIn.aspx")
        End If
    End Sub

    Protected Sub lbtnLike_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbtnLike.Click
        Dim sqlcon_like As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\VideoStreaming.mdf;Integrated Security=True;User Instance=True")
        sqlcon_like.Open()

        If Session("UserEmail") <> "" And likeStatChk <> "L" Then

            Dim likeStats As String = "L"
            lcount = lcount + 1

            If likeStatChk <> "" Then
                Dim query_StatusUpdate As String = "update LikeStatus set Status='" + likeStats + "' where VideoID=" & videoID & " and Email='" + email + "';"
                Dim sqlcom_StatusUpdate As New SqlCommand(query_StatusUpdate, sqlcon_like)
                Try
                    sqlcom_StatusUpdate.ExecuteNonQuery()
                Catch ex As Exception

                End Try

                If likeStatChk = "D" Then
                    dlCount = dlCount - 1
                End If

            ElseIf likeStatChk = "" Then
                Dim query_like_insert As String = "insert into LikeStatus values(" & videoID & ", '" + email + "', '" + likeStats + "');"
                Dim sqlcom_like_insert As New SqlCommand(query_like_insert, sqlcon_like)
                Try
                    sqlcom_like_insert.ExecuteNonQuery()
                Catch ex As Exception

                End Try

            End If
            Dim query_LikeUpdate As String = "update VideoDetails set VLike=" & lcount & ", VDislike=" & dlCount & " where V_ID=" & videoID & " ; "
            Dim sqlcom_LikeUpdate As New SqlCommand(query_LikeUpdate, sqlcon_like)
            Try
                sqlcom_LikeUpdate.ExecuteNonQuery()
                Response.Redirect("View.aspx")
            Catch ex As Exception

            End Try

        Else
            If Session("UserEmail") = "" Then
                Session("LogInType") = "View"
                Response.Redirect("LogIn.aspx")
            ElseIf likeStatChk = "L" Then
                Response.Redirect("View.aspx")
            End If

        End If
        sqlcon_like.Close()
    End Sub

    Protected Sub lbtnDislike_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbtnDislike.Click
        Dim sqlcon_Dislike As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\VideoStreaming.mdf;Integrated Security=True;User Instance=True")
        sqlcon_Dislike.Open()

        If Session("UserEmail") <> "" And likeStatChk <> "D" Then

            Dim likeStats As String = "D"
            dlCount = dlCount + 1

            If likeStatChk <> "" Then
                Dim query_StatusUpdate As String = "update LikeStatus set Status='" + likeStats + "' where VideoID=" & videoID & " and Email='" + email + "';"
                Dim sqlcom_StatusUpdate As New SqlCommand(query_StatusUpdate, sqlcon_Dislike)
                Try
                    sqlcom_StatusUpdate.ExecuteNonQuery()
                Catch ex As Exception

                End Try

                If likeStatChk = "L" Then
                    lcount = lcount - 1
                End If

            ElseIf likeStatChk = "" Then
                Dim query_Dislike_insert As String = "insert into LikeStatus values(" & videoID & ", '" + email + "', '" + likeStats + "');"
                Dim sqlcom_Dislike_insert As New SqlCommand(query_Dislike_insert, sqlcon_Dislike)
                Try
                    sqlcom_Dislike_insert.ExecuteNonQuery()
                Catch ex As Exception

                End Try

            End If
            Dim query_DisLikeUpdate As String = "update VideoDetails set VLike=" & lcount & ", VDislike=" & dlCount & " where V_ID=" & videoID & " ; "
            Dim sqlcom_DisLikeUpdate As New SqlCommand(query_DisLikeUpdate, sqlcon_Dislike)
            Try
                sqlcom_DisLikeUpdate.ExecuteNonQuery()
                Response.Redirect("View.aspx")
            Catch ex As Exception

            End Try

        Else
            If Session("UserEmail") = "" Then
                Session("LogInType") = "View"
                Response.Redirect("LogIn.aspx")
            ElseIf likeStatChk = "D" Then
                Response.Redirect("View.aspx")
            End If

        End If
        sqlcon_Dislike.Close()
    End Sub
End Class
