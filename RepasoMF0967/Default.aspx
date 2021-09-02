<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RepasoMF0967.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenido" runat="server">
    <h1>Bienvenidos</h1>

  <%--  <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 row-cols-xl-5 row-cols-xxl-6 g-4">
        <asp:Repeater ID="RepeaterMuebles" runat="server" DataSourceID="MueblesDataSource">
            <ItemTemplate>
                <div class="col">
                    <div class="card h-100">
                        <img src="/imgs/<%# Eval("Id") %>.jpg" class="card-img-top" alt="<%# Eval("Nombre") %>">
                        <div class="card-body">
                            <h5 class="card-title"><%# Eval("Nombre") %></h5>
                            <p class="card-text"><%# Eval("FechaFabricacion") %></p>
                            <p class="card-text">Dimensiones: <%# Eval("Largo") %>x<%# Eval("Ancho") %>x<%# Eval("Alto") %></p>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted"><%# Eval("Precio") %> €</small>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:ObjectDataSource OnObjectCreating="MueblesDataSource_ObjectCreating" ID="MueblesDataSource" runat="server" DataObjectTypeName="RepasoMF0967.Models.Mueble" DeleteMethod="Borrar" InsertMethod="Insertar" SelectMethod="ObtenerTodos" TypeName="RepasoMF0967.Daos.DaoMueble" UpdateMethod="Modificar"></asp:ObjectDataSource>
    </div>--%>

    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 row-cols-xl-5 row-cols-xxl-6 g-4">
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="MueblesDataTableDataSource">
            <ItemTemplate>
                <div class="col">
                    <div class="card h-100">
                        <img src="/imgs/<%# Eval("Id") %>.jpg" class="card-img-top" alt="<%# Eval("Nombre") %>">
                        <div class="card-body">
                            <h5 class="card-title"><%# Eval("Nombre") %></h5>
                            <p class="card-text"><%# Eval("FechaFabricacion") %></p>
                            <p class="card-text">Dimensiones: <%# Eval("Largo") %>x<%# Eval("Ancho") %>x<%# Eval("Alto") %></p>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted"><%# Eval("Precio") %> €</small>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:ObjectDataSource OnObjectCreating="MueblesDataSource_ObjectCreating" FilterExpression="Nombre LIKE '%M%'" ID="MueblesDataTableDataSource" runat="server" DataObjectTypeName="RepasoMF0967.Models.Mueble" DeleteMethod="Borrar" InsertMethod="Insertar" SelectMethod="ObtenerTodosDataTable" TypeName="RepasoMF0967.Daos.DaoMueble" UpdateMethod="Modificar"></asp:ObjectDataSource>
    </div>
    
</asp:Content>
