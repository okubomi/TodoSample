
Imports System.Data.SqlClient
Imports System.Reflection.Emit

Partial Class _Default
    Inherits System.Web.UI.Page


    Protected Sub FormView1_ItemInserted(sender As Object, e As FormViewInsertedEventArgs)
        If e.Exception IsNot Nothing Then
            Dim sqlEx As SqlException = TryCast(e.Exception, SqlException)
            If sqlEx IsNot Nothing AndAlso sqlEx.Number = 2627 Then
                ' PRIMARY KEY違反コード 2627 に対応

                ErrorMessageLabel.Text = "エラー: 主キーが重複しています。同じデータが既に存在します。"
            Else
                ' 他のエラーを補足
                ErrorMessageLabel.Text = "エラーが発生しました: " & e.Exception.Message
            End If
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub LinkButton_Click(sender As Object, e As EventArgs)

        ' 編集・新規挿入リンクをクリックしたときページ更新時にエラーメッセージを消す
        ErrorMessageLabel.Text = ""
    End Sub

End Class
