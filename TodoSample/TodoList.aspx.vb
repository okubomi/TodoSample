
Imports System.Reflection.Emit

Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' 初回読み込み時の処理

            Session("ID") = "emp001"

            ' Label1.Text = "ようこそ！"
        End If
    End Sub


End Class
