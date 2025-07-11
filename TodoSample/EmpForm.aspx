<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="EmpForm.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style>

        table {
            /* width: 100%;*/
            margin-left: auto;
            margin-right: auto;
            border: 2px solid #ffffff; /* 見やすいように枠線を追加 */
        }
        td {
            text-align: left;
            padding: 5px;
        }

        .equal-width {
          display: inline-block;
          width: 80px; /* 必要に応じて幅を調整 */
          text-align: left; /* 文字の揃え方も指定可能 */
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:FormView ID="FormView1" runat="server" AllowPaging="True" DataKeyNames="ID" DataSourceID="SqlDataSource1" OnItemInserted="FormView1_ItemInserted">
        <EditItemTemplate>
            <span class="equal-width">ID:</span>
            <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
            <br />
            <span class="equal-width">Password:</span>
            <asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Bind("Password") %>' />
            <br />
            <span class="equal-width">Name:</span>
            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
            <br />
            <span class="equal-width">Note:</span>
            <asp:TextBox ID="NoteTextBox" runat="server" Text='<%# Bind("Note") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="キャンセル" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <span class="equal-width">ID:</span>
            <asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="IDは必須です。" ControlToValidate="IDTextBox" Display="None"></asp:RequiredFieldValidator>

            <br />
            <span class="equal-width">Password:</span>
            <asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Bind("Password") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PasswordTextBox" ErrorMessage="パスワードは必須です。" Display="None"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="パスワードは半角英数文字で<br>6～12文字で入力してください。" ControlToValidate="PasswordTextBox" Display="None" ValidationExpression="^[a-zA-Z0-9]{6,12}$"></asp:RegularExpressionValidator>
            
            <br />
            <span class="equal-width">Name:</span>
            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="氏名は必須です。" ControlToValidate="NameTextBox" Display="None"></asp:RequiredFieldValidator>
            <br />
            <span class="equal-width">Note:</span>
            <asp:TextBox ID="NoteTextBox" runat="server" Text='<%# Bind("Note") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="挿入" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="キャンセル" />
            
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" BackColor="Red" ForeColor="White" />
        </InsertItemTemplate>
        <ItemTemplate>
            ID:
            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
            <br />
            Password:
            <asp:Label ID="PasswordLabel" runat="server" Text='<%# Bind("Password") %>' />
            <br />
            Name:
            <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
            <br />
            Note:
            <asp:Label ID="NoteLabel" runat="server" Text='<%# Bind("Note") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="編集"  OnClick="LinkButton_Click" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="削除" OnClientClick="return confirm('本当に削除しますか？');" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="新規作成"  OnClick="LinkButton_Click" />
        </ItemTemplate>

    </asp:FormView>

            <asp:Label ID="ErrorMessageLabel" runat="server" ForeColor="Red"></asp:Label>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:todo_dbConnectionString %>" DeleteCommand="DELETE FROM [Employees] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Employees] ([ID], [Password], [Name], [Note]) VALUES (@ID, @Password, @Name, @Note)" SelectCommand="SELECT * FROM [Employees]" UpdateCommand="UPDATE [Employees] SET [Password] = @Password, [Name] = @Name, [Note] = @Note WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ID" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Note" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Note" Type="String" />
            <asp:Parameter Name="ID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

