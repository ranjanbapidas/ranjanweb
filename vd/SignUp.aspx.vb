Imports System
Imports System.Data
Imports System.Data.SqlClient
Partial Class SignUp
    Inherits System.Web.UI.Page

    Protected Sub btnSignUp_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSignUp.Click
        Dim sqlcon As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\VideoStreaming.mdf;Integrated Security=True;User Instance=True")
        sqlcon.Open()
        lblMessage.Visible = True

        Dim email As String = txtEmail.Text.Trim
        Dim userPassword As String = txtPassword.Text.Trim
        Dim name As String = txtName.Text.Trim
        Dim user_dob As String = Convert.ToDateTime(ddlYear.SelectedValue + "-" + ddlMonth.SelectedValue + "-" + ddlDay.SelectedValue).ToString
        Dim sex As String = rdblSex.Text
        Dim city As String = txtCity.Text.ToUpper.Trim
        Dim blockNot As String = "No"

        Dim imagePath As String
        Dim ext As String = System.IO.Path.GetExtension(fu1.FileName)
        If (ext.ToLower = ".jpg" Or ext.ToLower = ".jpeg" Or ext.ToLower = ".png" Or ext.ToLower = ".bmp") Then
            imagePath = "ProfileImages"
        Else
            lblMessage.Text = "Only images with these extensions .jpg, .jpeg, .png, .gif, .bmp are allowed, Try Again !!!!!!!!!"
            GoTo xx
        End If

        Dim query_SignUp As String = "insert into SignUp values('" + email + "', '" + name + "', '" + user_dob + "', '" + sex + "','" + city + "', '" + imagePath + "');"
        Dim sqlcom_SignUp As New SqlCommand(query_SignUp, sqlcon)
        Dim query_LogIn As String = "insert into LogIn values('" + email + "', '" + userPassword + "','" + blockNot + "' ); "
        Dim sqlcom_LogIn As New SqlCommand(query_LogIn, sqlcon)
      
       

        Dim imgId As Integer
        Try
            sqlcom_SignUp.ExecuteNonQuery()
            Dim query_ImageId As String = "select ImageID from SignUp where Email = '" + email + "' ;"
            Dim sqlcom_imageId As New SqlCommand(query_ImageId, sqlcon)
            Try
                sqlcom_LogIn.ExecuteNonQuery()
                imgId = sqlcom_imageId.ExecuteScalar

                Dim fileNm As String = System.IO.Path.GetFileNameWithoutExtension(fu1.FileName)
                Dim extraNm As String = Mid(email, 1, 2)
                fileNm = extraNm + fileNm
                fu1.PostedFile.SaveAs(Server.MapPath(".") + "//ProfileImages//" + imgId.ToString + fileNm + ext)
                imagePath = "~//ProfileImages//" + imgId.ToString + fileNm + ext

                Try
                    Dim query_Update As String = "update SignUp set ImagePath='" + imagePath + "' where Email='" + email + "' ;"
                    Dim sqlcom_Update As New SqlCommand(query_Update, sqlcon)
                    sqlcom_Update.ExecuteNonQuery()
                    lblMessage.ForeColor = Drawing.Color.Green
                    lblMessage.Text = " You have successfully signed up.............."

                    txtCity.Text = ""
                    txtEmail.Text = ""
                    txtName.Text = ""
                    Response.Redirect("LogIn.aspx")

                Catch ex As Exception
                    lblMessage.Text = ex.Message
                End Try

            Catch ex As Exception
                lblMessage.Text = ex.Message
            End Try

        Catch ex As Exception
            lblMessage.Text = ex.Message
        End Try
xx:
        sqlcon.Close()

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        txtEmail.Text = Session("SignEmail")
    End Sub
End Class