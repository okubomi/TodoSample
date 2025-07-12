

Imports System

Partial Class Win10
    Inherits System.Web.UI.Page

    Private Sub Win10_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Label1.Text = "clickしました。"
    End Sub
End Class
