<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RepasoMF0967.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenido" runat="server">
    <h1>Login</h1>
    <div class="row mb-3">
        <asp:Label runat="server" AssociatedControlID="TextBoxNombre" class="col-sm-2 col-form-label">Nombre</asp:Label>
        <div class="col-sm-10">
            <asp:TextBox ID="TextBoxNombre" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row mb-3">
        <asp:Label runat="server" AssociatedControlID="TextBoxPassword" class="col-sm-2 col-form-label">Contraseña</asp:Label>
        <div class="col-sm-10">
            <asp:TextBox ID="TextBoxPassword" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
        </div>
    </div>
    
    <div class="row mb-3">
        <div class="offset-sm-2 col-sm-10">
            <asp:Button ID="ButtonAceptar" CssClass="btn btn-primary" OnClick="ButtonAceptar_Click" runat="server" Text="Iniciar sesión" />
        </div>
    </div>
    
</asp:Content>

    
    
    