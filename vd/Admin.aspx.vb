Imports System
Imports System.Data
Imports System.Data.SqlClient
Partial Class admin
    Inherits System.Web.UI.Page
    Shared vPath As String
    Shared videoID As Integer
    Shared emaluser As String
    Shared blockUserStatusSelect As String
    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        Dim sqlcon As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\VideoStreaming.mdf;Integrated Security=True;User Instance=True")
        sqlcon.Open()
        


        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

        Dim msg As String = txtProvideMessage.Text.Trim
        Dim entryYear As String = DateTime.Now.Year
        Dim entryMonth As String = DateTime.Now.Month
        Dim entryDay As String = DateTime.Now.Day
        Dim msgDt As String = Convert.ToDateTime(entryYear + "-" + entryMonth + "-" + entryDay).ToString
        Dim query As String = "insert into AdminMessage values('" + msg + "','" + msgDt + "' ); "
        Dim sqlcom As New SqlCommand(query, sqlcon)
        Try
            sqlcom.ExecuteNonQuery()
            txtProvideMessage.Text = ""
        Catch ex As Exception

        End Try

        sqlcon.Close()
    End Sub

    Protected Sub btnLogIn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLogIn.Click
        ''''''''''''admin check..........
        Dim sqlcon As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\VideoStreaming.mdf;Integrated Security=True;User Instance=True")
        sqlcon.Open()

        Dim email As String = txtEmail.Text.Trim
        Dim UserPassword As String = txtPassword.Text.Trim
        Dim query_Admin As String = "select Password from AdministratorVstream where Email='" + email + "'; "
        Dim sqlcom_Admin As New SqlCommand(query_Admin, sqlcon)
        Dim dbPassword_Admin As String = sqlcom_Admin.ExecuteScalar
        Try
            If dbPassword_Admin = UserPassword Then
                Session("AdminVstream") = email
                panelLogIn.Visible = False
                panelAll.Visible = True
                Response.Redirect("Admin.aspx")
            Else
                panelAll.Visible = False
                panelLogIn.Visible = True
                lblMessage.Text = "Invalid Email or Password !!!!!!!!, Try again......."
            End If
        Catch ex As Exception

        End Try
        sqlcon.Close()
    End Sub
    Protected Sub gvReportedVideo_RowCommand(ByVal sender As Object, ByVal e As CommandEventArgs)
        If e.CommandName = "View" Then
          
            '''''''''''''VideoID gets Value''''''''''''''''
            videoID = e.CommandArgument
            panelPlayer.Visible = False
            btnViewVideo.Visible = True
            panelReportMenu.Visible = True
            btnTemp(gvReportedVideo, e)
        End If
    End Sub

    Protected Sub btnTemp(ByVal sender As Object, ByVal e As EventArgs)
        Dim sqlcon As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\VideoStreaming.mdf;Integrated Security=True;User Instance=True")
        sqlcon.Open()
        ''deteil of reporting user and reported video........

        Dim query_ReportedUser As String = "select a.Name,b.Rdate,b.Cause from SignUp a,ReportVideo b where b.VideoID=" & videoID & " and a.Email=b.ReportedBy ; "
        Dim sqlcom_ReportedUser As New SqlDataAdapter(query_ReportedUser, sqlcon)
        Dim dt_ReportedUser As New DataTable
        Try
            sqlcom_ReportedUser.Fill(dt_ReportedUser)
            gvReportedUser.DataSource = dt_ReportedUser
            gvReportedUser.DataBind()
            lblReportedNumber.Text = "Total Report : " & dt_ReportedUser.Rows.Count.ToString
        Catch ex As Exception

        End Try
        ''detail of uploader of reported video and detail of their video..........

        Dim query_MoreDetail As String = "select a.Name,b.Title from SignUp a, VideoUpload b where b.VideoId=" & videoID & " and a.Email in ( select Email from VideoUpload where VideoID= " & videoID & " ) ; "
        Dim da_MoreDetail As New SqlDataAdapter(query_MoreDetail, sqlcon)
        Dim dt_MoreDetail As New DataTable
        Try
            da_MoreDetail.Fill(dt_MoreDetail)
            lblTitle.Text = dt_MoreDetail.Rows(0).Item(1)
            lbtnUploadedBy.Text = dt_MoreDetail.Rows(0).Item(0)
        Catch ex As Exception

        End Try

        sqlcon.Close()
    End Sub
    Protected Sub OnPageIndexChanging(ByVal sender As Object, ByVal e As GridViewPageEventArgs)
        gvReportedVideo.PageIndex = e.NewPageIndex
        Page_Load(gvReportedVideo, e)
        gvReportedVideo.DataBind()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("AdminVstream") <> "" Then
            panelLogIn.Visible = False
            panelAll.Visible = True
            If Session("pnlType") = "Block" Then
                panelBlockedVideo.Visible = True
                Session("pnlType") = ""
                panelProvideMessage.Visible = False

            ElseIf Session("pnlType") = "Unblock" Then
                panelReportGridView.Visible = True
                Session("pnlType") = ""
                panelProvideMessage.Visible = False
            ElseIf Session("pnlType") = "UnblockUser" Then
                Session("pnlType") = ""
                panelProvideMessage.Visible = False
                panelUploadRe.Visible = True
           
            End If

            Dim sqlcon As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\VideoStreaming.mdf;Integrated Security=True;User Instance=True")
            sqlcon.Open()
            Dim vdoBlock As String = "No"
            Dim query_ReportedVideo As String = "select b.VideoID,a.Title,a.ThumbPath,a.Category,b.Noofvideo from VideoUpload a,( select VideoID,count(VideoID) 'Noofvideo' from ReportVideo group by VideoID) b where a.VideoID=b.VideoID and a.Vblock='" + vdoBlock + "' order by b.Noofvideo desc ; "
            Dim sqlcom_ReportedVideo As New SqlDataAdapter(query_ReportedVideo, sqlcon)
            Dim dt_ReportedVideo As New DataTable
            Try
                sqlcom_ReportedVideo.Fill(dt_ReportedVideo)
                gvReportedVideo.DataSource = dt_ReportedVideo
                gvReportedVideo.DataBind()
                If dt_ReportedVideo.Rows.Count < 1 Then
                    lblReportMessage.Text = "There are no reported videos...."
                Else
                    lblReportMessage.Text = "Reported Videos"
                End If
            Catch ex As Exception

            End Try

            ''block Videos
            vdoBlock = "Yes"
            Dim query_Blockvideo As String = "select VideoId,Title,ThumbPath,Category from VideoUpload where Vblock='" + vdoBlock + "' order by VideoID desc ; "
            Dim da_BlockedVideo As New SqlDataAdapter(query_Blockvideo, sqlcon)
            Dim dt_BlockedVideo As New DataTable
            Try
                da_BlockedVideo.Fill(dt_BlockedVideo)
                gvBlockedVideo.DataSource = dt_BlockedVideo
                gvBlockedVideo.DataBind()
                If dt_BlockedVideo.Rows.Count < 1 Then
                    lblBlockMessage.Text = "There are no blocked videos........"
                Else
                    lblBlockMessage.Text = "Blocked Videos"
                End If
            Catch ex As Exception

            End Try
            '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
            'Reported User.............
            Dim bstat As String
            If blockUserStatusSelect = "1" Then
                bstat = "No"
            ElseIf blockUserStatusSelect = "2" Then
                bstat = "Yes"
            End If

            Dim query_Reporteduser As String = "select c.Name,c.Email from VideoUpload a,( select VideoID,count(VideoID) 'Noofvideo' from ReportVideo group by VideoID) b,SignUp c,LogIn d where a.VideoID=b.VideoID and c.Email=a.Email and d.Email=c.Email and d.Blocked='" + bstat + "' group by c.name,c.Email  ;"
            Dim sqlcom_Reporteduser As New SqlDataAdapter(query_Reporteduser, sqlcon)
            Dim dt_Reporteduser As New DataTable
            Try
                sqlcom_Reporteduser.Fill(dt_Reporteduser)
                GridView1.DataSource = dt_Reporteduser
                GridView1.DataBind()
                If dt_Reporteduser.Rows.Count > 0 Then
                    If blockUserStatusSelect = "1" Then
                        lblReportedUser.Text = "Reported video uploaders"
                    ElseIf blockUserStatusSelect = "2" Then
                        lblReportedUser.Text = "Blocked users"
                    End If

                Else
                    If blockUserStatusSelect = "1" Then
                        lblReportedUser.Text = "There is no reported video uploaders"
                    ElseIf blockUserStatusSelect = "2" Then
                        lblReportedUser.Text = "There is no Blocked Users"
                    End If

                End If
            Catch ex As Exception

            End Try
            ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
            sqlcon.Close()
        Else
            panelAll.Visible = False
            panelLogIn.Visible = True
        End If
        

    End Sub
    Protected Sub OnPageIndexChangingV(ByVal sender As Object, ByVal e As GridViewPageEventArgs)
        gvReportedUser.PageIndex = e.NewPageIndex
        btnTemp(gvReportedUser, e)
        gvReportedUser.DataBind()
    End Sub

    Protected Sub btnViewVideo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnViewVideo.Click
        btnViewVideo.Visible = False
        panelPlayer.Visible = True
        Dim sqlcon As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\VideoStreaming.mdf;Integrated Security=True;User Instance=True")
        sqlcon.Open()
        Dim query_VideoPath As String = "select VideoPath from VideoUpload where VideoID=" & videoID & " ; "
        Dim sqlcom_VideoPath As New SqlCommand(query_VideoPath, sqlcon)
        Try
            vPath = sqlcom_VideoPath.ExecuteScalar

            vPath = "Videos" & Mid(vPath, 11)
            'lblAbout.Text = path
            Video.Attributes.Add("src", vPath)
            Video.Attributes.Add("value", vPath)
        Catch ex As Exception

        End Try
        sqlcon.Close()
    End Sub

    Protected Sub btnBlock_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBlock.Click
        Dim sqlcon As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\VideoStreaming.mdf;Integrated Security=True;User Instance=True")
        sqlcon.Open()
        Dim vStatusBlock As String = "Yes"
        Dim query_BlockVideo As String = "update VideoUpload set Vblock='" + vStatusBlock + "' where VideoID=" & videoID & " ; "
        Dim sqlcom_BlockVideo As New SqlCommand(query_BlockVideo, sqlcon)
        lblError.Visible = True
        Try
            sqlcom_BlockVideo.ExecuteNonQuery()
            lblError.ForeColor = Drawing.Color.Green
            lblError.Text = "Video successfully blocked......"
        Catch ex As Exception
            lblError.ForeColor = Drawing.Color.Red
            lblError.Text = "This video can not be blocked because " & ex.Message
        End Try
        sqlcon.Close()
        Session("pnlType") = "Unblock"
        Response.Redirect("Admin.aspx")

    End Sub

    Protected Sub lbtnUploadedBy_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbtnUploadedBy.Click
        Session("VidID") = videoID.ToString
        Response.Redirect("ProfileAnyone.aspx")
    End Sub
    Protected Sub OnPageIndexChangingB(ByVal sender As Object, ByVal e As GridViewPageEventArgs)
        gvBlockedVideo.PageIndex = e.NewPageIndex
        Page_Load(gvBlockedVideo, e)
        gvBlockedVideo.DataBind()
    End Sub
    Protected Sub gvBlockedVideo_RowCommand(ByVal sender As Object, ByVal e As CommandEventArgs)
        If e.CommandName = "View" Then
            '''''''''''''VideoID gets Value''''''''''''''''
            videoID = e.CommandArgument

            panelBlockMenu.Visible = True
            panelPlayer.Visible = False
            btnPlayVideo.Visible = True
            Dim sqlcon As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\VideoStreaming.mdf;Integrated Security=True;User Instance=True")
            sqlcon.Open()
            Dim query_Title As String = "select Title from VideoUpload where VideoId=" & videoID & " ; "
            Dim sqlcom_title As New SqlCommand(query_Title, sqlcon)
            Try
                lblTitle0.Text = sqlcom_title.ExecuteScalar
            Catch ex As Exception
                lblError0.Text = ex.Message
            End Try
            sqlcon.Close()
        End If
    End Sub

    Protected Sub btnUnblock_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUnblock.Click
        Dim sqlcon As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\VideoStreaming.mdf;Integrated Security=True;User Instance=True")
        sqlcon.Open()
        Dim vStatusBlock As String = "No"
        Dim query_UnblockVideo As String = "update VideoUpload set Vblock='" + vStatusBlock + "' where VideoID=" & videoID & " ; "
        Dim sqlcom_UnblockVideo As New SqlCommand(query_UnblockVideo, sqlcon)
        lblError0.Visible = True
        Try
            sqlcom_UnblockVideo.ExecuteNonQuery()
            lblError0.ForeColor = Drawing.Color.Green
            lblError0.Text = "Video successfully unblocked......"
        Catch ex As Exception
            lblError0.ForeColor = Drawing.Color.Red
            lblError0.Text = "This video can not be unblocked because " & ex.Message
        End Try
        sqlcon.Close()
        Session("pnlType") = "Block"
        Response.Redirect("Admin.aspx")
    End Sub

    Protected Sub btnPlayVideo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPlayVideo.Click
        btnPlayVideo.Visible = False
        btnViewVideo_Click(btnPlayVideo, e)
    End Sub

    Protected Sub lbtnShowMessage_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbtnShowMessage.Click

        panelProvideMessage.Visible = True
        panelReportGridView.Visible = False
        panelBlockedVideo.Visible = False
        panelBlockMenu.Visible = False
        panelReportMenu.Visible = False
        panelUploadRe.Visible = False
    End Sub

    Protected Sub lbtnShowReportedVideo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbtnShowReportedVideo.Click
        panelReportGridView.Visible = True
        panelBlockedVideo.Visible = False
        panelReportMenu.Visible = False
        panelProvideMessage.Visible = False
        panelBlockMenu.Visible = False
        panelUploadRe.Visible = False
    End Sub

    Protected Sub lbtnBlockVideo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbtnBlockVideo.Click
        panelReportGridView.Visible = False
        panelBlockedVideo.Visible = True
        panelProvideMessage.Visible = False
        panelReportMenu.Visible = False
        panelBlockMenu.Visible = False
        panelUploadRe.Visible = False
    End Sub
    Protected Sub gvReportedUser_RowCommand(ByVal sender As Object, ByVal e As CommandEventArgs)
        If e.CommandName = "View" Then
            emaluser = e.CommandArgument
            btnProfile.Visible = True

            Dim sqlcon As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\VideoStreaming.mdf;Integrated Security=True;User Instance=True")
            sqlcon.Open()
            Dim query_UploaderName As String = "select Name from SignUp where Email='" + emaluser + "' ; "
            Dim sqlcom_UploaderName As New SqlCommand(query_UploaderName, sqlcon)
            Try
                lblUploaderName.Text = sqlcom_UploaderName.ExecuteScalar
            Catch ex As Exception

            End Try

            Dim query_CheckBlock As String = "select Blocked from LogIn where Email='" + emaluser + "' ; "
            Dim sqlcom_CheckBlock As New SqlCommand(query_CheckBlock, sqlcon)
            Try
                If sqlcom_CheckBlock.ExecuteScalar = "Yes" Then
                    btnUnblockUser.Visible = True
                    btnBlockUser.Visible = False
                ElseIf sqlcom_CheckBlock.ExecuteScalar = "No" Then
                    btnBlockUser.Visible = True
                    btnUnblockUser.Visible = False
                End If
            Catch ex As Exception

            End Try
            sqlcon.Close()
        End If
    End Sub
   
    Protected Sub btnProfile_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnProfile.Click
        Dim sqlcon As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\VideoStreaming.mdf;Integrated Security=True;User Instance=True")
        sqlcon.Open()
        Dim query_RuserProfile As String = "select max(VideoID) from VideoUpload where Email='" + emaluser + "' ; "
        Dim sqlcom_RuserProfile As New SqlCommand(query_RuserProfile, sqlcon)
        Try
            Session("VidID") = sqlcom_RuserProfile.ExecuteScalar.ToString
            Response.Redirect("ProfileAnyone.aspx")
        Catch ex As Exception

        End Try
        sqlcon.Close()
    End Sub

    Protected Sub btnUnblockUser_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUnblockUser.Click
        Dim sqlcon As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\VideoStreaming.mdf;Integrated Security=True;User Instance=True")
        sqlcon.Open()
        Dim bStat As String = "No"
        Dim query_RuserProfileUnblock As String = "update LogIn set Blocked='" + bStat + "' where Email='" + emaluser + "' ; "
        Dim sqlcom_RuserProfileUnblock As New SqlCommand(query_RuserProfileUnblock, sqlcon)
        Try
            Session("VidID") = sqlcom_RuserProfileUnblock.ExecuteNonQuery
            lblUserMessage.Text = "User Successfully Unblocked"
        Catch ex As Exception

        End Try
        Session("pnlType") = "UnblockUser"
        Response.Redirect("Admin.aspx")
        sqlcon.Close()
    End Sub

    Protected Sub btnBlockUser_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBlockUser.Click
        Dim sqlcon As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\VideoStreaming.mdf;Integrated Security=True;User Instance=True")
        sqlcon.Open()
        Dim bStat As String = "Yes"
        Dim query_RuserProfileBlock As String = "update LogIn set Blocked='" + bStat + "' where Email='" + emaluser + "' ; "
        Dim sqlcom_RuserProfileBlock As New SqlCommand(query_RuserProfileBlock, sqlcon)
        Try
            sqlcom_RuserProfileBlock.ExecuteNonQuery()
            lblUserMessage.Text = "User Successfully blocked"
        Catch ex As Exception

        End Try
        Session("pnlType") = "UnblockUser"
        Response.Redirect("Admin.aspx")
        sqlcon.Close()
    End Sub

    Protected Sub lbtnReVdUploaders_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbtnReVdUploaders.Click
        blockUserStatusSelect = "1"
        btnBlockUser.Visible = False
        btnUnblockUser.Visible = False
        btnProfile.Visible = False
        lblUploaderName.Visible = False
        panelUploadRe.Visible = True
        panelBlockedVideo.Visible = False
        panelReportMenu.Visible = False
        panelProvideMessage.Visible = False
        panelBlockMenu.Visible = False
        panelReportGridView.Visible = False
        Session("pnlType") = "UnblockUser"
        Response.Redirect("Admin.aspx")
    End Sub

    Protected Sub lbtnBlockedUsers_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbtnBlockedUsers.Click
        blockUserStatusSelect = "2"
        btnBlockUser.Visible = False
        btnUnblockUser.Visible = False
        btnProfile.Visible = False
        lblUploaderName.Visible = False
        panelUploadRe.Visible = True
        panelBlockedVideo.Visible = False
        panelReportMenu.Visible = False
        panelProvideMessage.Visible = False
        panelBlockMenu.Visible = False
        panelReportGridView.Visible = False
        Session("pnlType") = "UnblockUser"
        Response.Redirect("Admin.aspx")
    End Sub

    Protected Sub lbtnLogOut_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbtnLogOut.Click
        lbtnLogOut.Visible = False
        Session("AdminVstream") = ""
        Response.Redirect("Admin.aspx")
    End Sub
End Class
