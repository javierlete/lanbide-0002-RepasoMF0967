<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RepasoMF0967.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenido" runat="server">
    <h1>Login</h1>
    <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
    <asp:TextBox ID="TextBoxPassword" TextMode="Password" runat="server"></asp:TextBox>
    <asp:Button ID="ButtonAceptar" OnClick="ButtonAceptar_Click" runat="server" Text="Button" />
</asp:Content>
