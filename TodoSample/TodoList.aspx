<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="TodoList.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <H3>メインコンテンツ</H3>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" DataKeyNames="No">
        <Columns>
            <asp:BoundField DataField="No" HeaderText="No" SortExpression="No" InsertVisible="False" ReadOnly="True"></asp:BoundField>
            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID"></asp:BoundField>
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title"></asp:BoundField>
            <asp:BoundField DataField="Client" HeaderText="Client" SortExpression="Client"></asp:BoundField>
            <asp:BoundField DataField="Registration_date" HeaderText="Registration_date" SortExpression="Registration_date" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundField>
            <asp:BoundField DataField="Working_date" HeaderText="Working_date" SortExpression="Working_date" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundField>
            <asp:BoundField DataField="Completion_date" DataFormatString="{0:yyyy-MM-dd}" HeaderText="Completion_date" SortExpression="Completion_date" />
            <asp:HyperLinkField DataNavigateUrlFields="No" DataNavigateUrlFormatString="Edit.aspx?No={0}" Text="編集" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:todo_dbConnectionString %>" SelectCommand="SELECT * FROM [Todos] WHERE ([ID] = @ID)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="emp001" Name="ID" SessionField="ID" Type="String" />
        </SelectParameters>
</asp:SqlDataSource>
</asp:Content>

