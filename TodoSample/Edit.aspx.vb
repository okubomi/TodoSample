
Imports System.Data
Imports System.Data.SqlClient


Partial Class _Default
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' 初回読み込み時の処理

            ''TodoテーブルのEmployee IDを取得
            Dim ID As String = Session("ID")

            'TodoテーブルのNoを取得
            Dim No As Integer = Request.QueryString("No")


            Label1.Text = ID
            Label2.Text = No

            Dim connStr As String = ConfigurationManager.ConnectionStrings("todo_dbConnectionString").ConnectionString
            Dim sql As String = "SELECT Title, Client, Registration_date, Working_date, Completion_date FROM Todos WHERE No = @No"

            Dim conn As New SqlConnection(connStr)
            Dim adapter As New SqlDataAdapter(sql, conn)
            adapter.SelectCommand.Parameters.AddWithValue("@No", No)

            Dim ds As New DataSet()
            adapter.Fill(ds, "Todo")

            Dim TodoDataTable As DataTable = ds.Tables("Todo")

            If TodoDataTable.Rows.Count > 0 Then
                Dim row As DataRow = TodoDataTable.Rows(0)
                TextBox1.Text = row("Title").ToString()
                TextBox2.Text = row("Client").ToString()
                TextBox3.Text = Convert.ToDateTime(row("Registration_date")).ToString("yyyy-MM-dd")
                TextBox4.Text = If(IsDBNull(row("Working_date")), "", Convert.ToDateTime(row("Working_date")).ToString("yyyy-MM-dd"))
                TextBox5.Text = If(IsDBNull(row("Completion_date")), "", Convert.ToDateTime(row("Completion_date")).ToString("yyyy-MM-dd"))
            Else
                ' 該当データなし

            End If

        End If
    End Sub
End Class
