Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Net
Imports System.Net.Mail
Partial Class Verification
    Inherits System.Web.UI.Page
    Shared email As String

    Protected Sub btnSend_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSend.Click
        Dim sqlcon As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\VideoStreaming.mdf;Integrated Security=True;User Instance=True")
        sqlcon.Open()
      
        Dim pass As String
        email = txtEmail.Text.Trim
        Dim query_UniqueEmail As String = "select Password from Login where Email='" + email + "' ; "
        Dim sqlcom As New SqlCommand(query_UniqueEmail, sqlcon)
        Try
            pass = sqlcom.ExecuteScalar
            If pass <> "" Then
                lblMessage.Text = "Sorry,This email already registered !!! Try with other Email......"
            Else

                '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
                Dim c As String
                Dim count_query As String = "select count(*) from SignUp;"
                Dim count_sqlcom As New SqlCommand(count_query, sqlcon)
                c = count_sqlcom.ExecuteScalar
                'query to create unique path
                Dim extraNm As String = Mid(email, 3, 1)
                Dim extraNm1 As String = Mid(email, 9, 1)
                Dim c1 As String
                Dim count_query1 As String = "select count(*) from VideoUpload;"
                Dim count_sqlcom1 As New SqlCommand(count_query1, sqlcon)
                c1 = count_sqlcom1.ExecuteScalar
                Dim code As String = c + extraNm + extraNm1 + c1
                'check code is already send or not
                Dim check As String
                Dim query_code As String = "select Code from UserVerification where Email='" + email + "';"
                Dim sqlcom_code As New SqlCommand(query_code, sqlcon)
                Try
                    check = sqlcom_code.ExecuteScalar()
                Catch ex As Exception
                    lblMessage.Text = "Verification code can't be sent. Please try again."
                End Try

                If check <> "" Then
                    code = check
                End If
                Dim outgoing_server As String = "smtp.mail.yahoo.com"
                Dim port As Integer = 25
                Dim subject As String = "Verification code of Vstream"
                Dim body As String = "Welcome to vstream.  Thank you for chosing our site.  Your verification code is :" + code + ".  Use this verification code to verify your email.... "
                Dim username As String = "vstream2016@yahoo.com"
                Dim password As String = "project2016"
                Dim smtp As New SmtpClient(outgoing_server, port)
                smtp.EnableSsl = True
                smtp.UseDefaultCredentials = True

                smtp.Credentials = New NetworkCredential(username, password)
                Dim mail As New MailMessage(username, email, subject, body)
                Try
                    smtp.Send(mail)
                    Dim query_chat As String = "insert into UserVerification values('" + email + "','" + code + "');"
                    Dim sqlcom_chat As New SqlCommand(query_chat, sqlcon)
                    Try
                        sqlcom_chat.ExecuteNonQuery()
                        panelEmail.Visible = False
                        panelVerification.Visible = True
                        'lblMessage.Text = code
                        'lblVmessage.Text = code
                    Catch ex As Exception
                        panelEmail.Visible = False
                        panelVerification.Visible = True
                        'lblMessage.Text = code
                        'lblVmessage.Text = code
                    End Try
                Catch ex As Exception
                    Dim outgoing_server1 As String = "smtp.mail.yahoo.com"
                    Dim port1 As Integer = 587
                        Dim subject1 As String = "Verification code of Vstream"
                        Dim body1 As String = "Welcome to vstream.  Thank you for chosing our site.  Your verification code is :" + code + ".  Use this verification code to verify your email.... "
                    Dim username1 As String = "saikatcom3516@yahoo.com"
                    Dim password1 As String = "rashidutta"
                        Dim smtp1 As New SmtpClient(outgoing_server, port)
                        smtp.EnableSsl = True
                        smtp.UseDefaultCredentials = True

                        smtp.Credentials = New NetworkCredential(username1, password1)
                        Dim mail1 As New MailMessage(username1, email, subject1, body1)

                        smtp.Send(mail1)
                        Dim query_chat As String = "insert into UserVerification values('" + email + "','" + code + "');"
                        Dim sqlcom_chat As New SqlCommand(query_chat, sqlcon)
                    Try
                        sqlcom_chat.ExecuteNonQuery()
                        panelEmail.Visible = False
                        panelVerification.Visible = True
                        'lblMessage.Text = code
                        'lblVmessage.Text = code
                    Catch ex1 As Exception
                        panelEmail.Visible = False
                        panelVerification.Visible = True
                        lblMessage.Text = "Verification code can't be sent. Please try again."
                        'lblMessage.Text = code
                        'lblVmessage.Text = code
                    End Try


                End Try
                lblMessage.Text = "Verification code can't be sent. Please try again."
                    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

            End If


        Catch ex As Exception

        End Try

        sqlcon.Close()
    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        'create connection
        Dim sqlcon As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\VideoStreaming.mdf;Integrated Security=True;User Instance=True")
        'open connection
        sqlcon.Open()

        'retieve data
        Dim Ucode As String = txtVcode.Text.Trim
        Dim Tcode As String

            'query to check email id and password
        Dim query_get_password As String = "select Code from UserVerification where Email='" + email + "';"
            Dim sqlcom_get_password As New SqlCommand(query_get_password, sqlcon)
            Try
                Tcode = sqlcom_get_password.ExecuteScalar
            Catch ex As Exception

            End Try

            'checking the code
        If Tcode = Ucode Then
            Session("SignEmail") = email
            Response.Redirect("SignUp.aspx")
        Else
            lblVmessage.Text = "Your entered code is wrong. Please try again."
        End If
        'close connection
        sqlcon.Close()
    End Sub
End Class
