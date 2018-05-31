Imports System
Imports System.Data
Imports System.Data.SqlClient
Partial Class Login
    Inherits System.Web.UI.Page

    Protected Sub btnLogIn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLogIn.Click
        lblMessage.Visible = True
        'create connection
        Dim sqlcon As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\VideoStreaming.mdf;Integrated Security=True;User Instance=True")
        'open connection
        sqlcon.Open()

        Dim email As String = txtEmail.Text
        Dim userPassword As String = txtPassword.Text
        Dim databasePassword As String
        Dim blk As String
        'query to check email id and password
        Dim query_get_password As String = "select Password from LogIn where Email='" + email + "';"
        Dim sqlcom_get_password As New SqlCommand(query_get_password, sqlcon)
        Try
            databasePassword = sqlcom_get_password.ExecuteScalar
            'checking the password
            If databasePassword = userPassword Then
                'successful login
                'check if it is blocked
                Dim query_Block As String = "select Blocked from LogIn where Email='" + email + "';"
                Dim sqlcom_Block As New SqlCommand(query_Block, sqlcon)
                Try
                    blk = sqlcom_Block.ExecuteScalar
                    If blk = "No" Then
                        lblMessage.ForeColor = Drawing.Color.Green
                        lblMessage.Text = "you have successfully logged in.........."
                        txtEmail.Text = ""
                        Session("UserEmail") = email

                        If Session("LogInType") = "Upload" Then
                            Session("LogInType") = ""
                            Response.Redirect("Upload.aspx")

                        ElseIf Session("LogInType") = "Profile" Then
                            Session("LogInType") = ""
                            Response.Redirect("Profile.aspx")

                        ElseIf Session("LogInType") = "View" Then
                            Session("LogInType") = ""
                            Response.Redirect("View.aspx")

                        Else
                            Response.Redirect("Profile.aspx")
                        End If

                    Else
                        lblMessage.Text = " Sorry, your account has been blocked........."
                    End If
                Catch ex As Exception
                    lblMessage.Text = ex.Message
                End Try
            Else
                'passwords mismatch. NO login. Provide login failure message......
                'txtEmail.Text = ""
                lblMessage.Text = "Invalid username or password !!!!!!, Please try again....."
            End If
                Catch ex As Exception
                    lblMessage.Text = ex.Message
        End Try
          


    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        txtEmail.Focus()
    End Sub
End Class
