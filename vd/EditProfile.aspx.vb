Imports System
Imports System.Data
Imports System.Data.SqlClient
Partial Class EditProfile
    Inherits System.Web.UI.Page
    Shared email As String
    Shared userPassword As String
    Shared name As String
    Shared user_dob As String
    Shared sex As String
    Shared sexn As String
    Shared city As String
    Shared imageID As Integer
    Shared imagePath As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim sqlcon As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\VideoStreaming.mdf;Integrated Security=True;User Instance=True")
        sqlcon.Open()
        email = Session("UserEmail")
        If email <> "" Then
            Dim query As String = "select Name,User_DOB,Sex,City,ImageID,ImagePath from SignUp where Email='" + email + "';"
            Dim da As New SqlDataAdapter(query, sqlcon)
            Dim dt As New DataTable
            Try
                da.Fill(dt)
                name = dt.Rows(0).Item(0)
                user_dob = dt.Rows(0).Item(1)
                sex = dt.Rows(0).Item(2)
                city = dt.Rows(0).Item(3)
                imageID = dt.Rows(0).Item(4)
                imagePath = dt.Rows(0).Item(5)
            Catch ex As Exception

            End Try

            Dim query_PassWord As String = "select Password from LogIn where Email='" + email + "';"
            Dim sqlcom_Password As New SqlCommand(query_PassWord, sqlcon)
            Try
                userPassword = sqlcom_Password.ExecuteScalar()
            Catch ex As Exception

            End Try
           
        Else
            Response.Redirect("LogIn.aspx")
        End If
       sqlcon.Close()
    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        Dim sqlcon_UpdateData As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\VideoStreaming.mdf;Integrated Security=True;User Instance=True")
        sqlcon_UpdateData.Open()
        lblMessage.Visible = True

       
        If rbtnMale.Checked = True Then
            sex = "Male"
        ElseIf rbtnFemale.Checked = True Then
            sex = "Female"
        ElseIf rbtnOther.Checked = True Then
            sex = "Other"
        Else
            sex = sex
        End If
            If userPassword <> txtPassword.Text.Trim And txtPassword.Text.Trim <> "" And txtPassword.Text.Trim <> "" And txtPassword.Text.Trim = txtRePassword.Text.Trim Then
                userPassword = txtPassword.Text.Trim
            End If
            If name <> txtName.Text.Trim And txtName.Text <> "" Then
                name = txtName.Text.Trim
                lblMessage.Visible = True
                lblMessage.Text = txtName.Text
            Else
                lblMessage.Visible = True
                lblMessage.Text = txtName.Text
        End If
        If ddlDay.Text = "Day" Or ddlMonth.Text = "Month" Or ddlYear.Text = "Year" Then
            user_dob = user_dob
        Else
            'If user_dob <> CDate(ddlDay.SelectedValue + "/" + ddlMonth.SelectedValue + "/" + ddlYear.SelectedValue) Then
            user_dob = CDate(ddlDay.SelectedValue + "/" + ddlMonth.SelectedValue + "/" + ddlYear.SelectedValue)

        End If


        If city <> txtCity.Text And txtCity.Text.Trim <> "" Then
            city = txtCity.Text.ToUpper.Trim
        End If

        If fu1.FileName <> "" Then
            Dim ext As String = System.IO.Path.GetExtension(fu1.FileName)
            If (ext.ToLower = ".jpg" Or ext.ToLower = ".jpeg" Or ext.ToLower = ".png" Or ext.ToLower = ".bmp") Then
                Dim fileNm As String = System.IO.Path.GetFileNameWithoutExtension(fu1.FileName)
                Dim extraNm As String = Mid(email, 1, 3)
                fileNm = extraNm + fileNm
                fu1.PostedFile.SaveAs(Server.MapPath(".") + "//ProfileImages//" + imageID.ToString + fileNm + ext)
                imagePath = "~//ProfileImages//" + imageID.ToString + fileNm + ext
            Else
                lblMessage.Text = "Only images with these extensions .jpg, .jpeg, .png, .gif, .bmp are allowed, Try Again !!!!!!!!!"
                GoTo yy
            End If
        End If
        txtName.Text = name
        txtCity.Text = city
        ddlDay.Text = Day(user_dob)
        ddlMonth.Text = MonthName(Month(user_dob))
        ddlYear.Text = Year(user_dob)

        Try

            Dim query_Update As String = "update SignUp set Name='" + name + "', User_DOB='" + user_dob + "', Sex='" + sex + "', City='" + city + "', ImagePath='" + imagePath + "' where Email='" + email + "' ;"
            Dim sqlcom_Update As New SqlCommand(query_Update, sqlcon_UpdateData)
            Try
                sqlcom_Update.ExecuteNonQuery()
            Catch ex As Exception

            End Try

            Dim query_PasswordUpdate As String = "update LogIN set Password='" + userPassword + "' where Email='" + email + "';"
            Dim sqlcom_PasswordUpdate As New SqlCommand(query_PasswordUpdate, sqlcon_UpdateData)
            Try
                sqlcom_PasswordUpdate.ExecuteNonQuery()
            Catch ex As Exception

            End Try

            sqlcon_UpdateData.Close()
            lblMessage.Visible = True
            lblMessage.ForeColor = Drawing.Color.Green
            lblMessage.Text = "Update successfully occured........."
        Catch ex As Exception
            lblMessage.Visible = True
            lblMessage.Text = ex.Message
        End Try

yy:

    End Sub
End Class
