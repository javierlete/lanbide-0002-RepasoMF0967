<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="AdminMuebles.aspx.cs" Inherits="RepasoMF0967.admin.AdminMuebles" Culture="en-US" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenido" runat="server">
    <h1>Administración muebles</h1>

    <asp:GridView DataKeyNames="Id" CssClass="table table-hover table-striped table-bordered" ID="GridViewMuebles" runat="server" AutoGenerateColumns="False" DataSourceID="ListadoDataSource">
        <HeaderStyle CssClass="table-dark" />
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id"></asp:BoundField>
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre"></asp:BoundField>
            <asp:BoundField DataFormatString="{0:0.00 €}" DataField="Precio" HeaderText="Precio" SortExpression="Precio"></asp:BoundField>
            <asp:BoundField DataFormatString="{0:0.00 m}" DataField="Largo" HeaderText="Largo" SortExpression="Largo"></asp:BoundField>
            <asp:BoundField DataFormatString="{0:0.00 m}" DataField="Ancho" HeaderText="Ancho" SortExpression="Ancho"></asp:BoundField>
            <asp:BoundField DataFormatString="{0:0.00 m}" DataField="Alto" HeaderText="Alto" SortExpression="Alto"></asp:BoundField>
            <asp:BoundField DataFormatString="{0:dd-MM-yyyy}" DataField="FechaFabricacion" HeaderText="FechaFabricacion" SortExpression="FechaFabricacion"></asp:BoundField>
            <%--<asp:CommandField ShowSelectButton="True" ShowDeleteButton="True"></asp:CommandField>--%>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button CssClass="btn btn-primary" runat="server" Text="Editar" CommandName="Select" />
                    <asp:Button CssClass="btn btn-danger" runat="server" Text="Borrar" CommandName="Delete" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:Button CssClass="btn btn-primary" ID="InsertButton" runat="server" Text="Añadir" OnClick="InsertButton_Click" />
    <asp:ObjectDataSource OnObjectCreating="ListadoDataSource_ObjectCreating" runat="server" ID="ListadoDataSource" DataObjectTypeName="RepasoMF0967.Models.Mueble" DeleteMethod="Borrar" InsertMethod="Insertar" SelectMethod="ObtenerTodos" TypeName="RepasoMF0967.Daos.DaoMueble" UpdateMethod="Modificar"></asp:ObjectDataSource>

    <asp:FormView DataKeyNames="Id" CssClass="w-100" ID="FormViewMueble" runat="server" DataSourceID="FormularioDataSource" OnItemUpdated="RefrescarGrid" OnItemInserted="FormViewMueble_ItemInserted">
        <EditItemTemplate>
            <div class="row mb-3">
                <asp:Label runat="server" AssociatedControlID="Id" class="col-sm-2 col-form-label">Id</asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox ReadOnly="true" ID="Id" Text='<%# Eval("Id") %>' CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row mb-3">
                <asp:Label runat="server" AssociatedControlID="Nombre" class="col-sm-2 col-form-label">Nombre</asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox ID="Nombre" Text='<%# Bind("Nombre") %>' CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row mb-3">
                <asp:Label runat="server" AssociatedControlID="Precio" class="col-sm-2 col-form-label">Precio</asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox TextMode="Number" step=".01" ID="Precio" Text='<%# Bind("Precio", "{0:N2}") %>' CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row mb-3">
                <asp:Label runat="server" AssociatedControlID="Largo" class="col-sm-2 col-form-label">Largo</asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox TextMode="Number" step=".01" ID="Largo" Text='<%# Bind("Largo", "{0:f2}") %>' CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row mb-3">
                <asp:Label runat="server" AssociatedControlID="Ancho" class="col-sm-2 col-form-label">Ancho</asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox TextMode="Number" step=".01" ID="Ancho" Text='<%# Bind("Ancho", "{0:f2}") %>' CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row mb-3">
                <asp:Label runat="server" AssociatedControlID="Alto" class="col-sm-2 col-form-label">Alto</asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox TextMode="Number" step=".01" ID="Alto" Text='<%# Bind("Alto", "{0:f2}") %>' CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row mb-3">
                <asp:Label runat="server" AssociatedControlID="FechaFabricacion" class="col-sm-2 col-form-label">Fecha de fabricación</asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox TextMode="Date" ID="FechaFabricacion" Text='<%# Bind("FechaFabricacion", "{0:yyyy-MM-dd}") %>' CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="row mb-3">
                <div class="offset-sm-2 col-sm-10">
                    <asp:LinkButton CssClass="btn btn-primary" runat="server" Text="Aceptar" CommandName="Update" ID="UpdateButton" CausesValidation="True" />
                </div>
            </div>
            
        </EditItemTemplate>
        <InsertItemTemplate>
            <div class="row mb-3">
                <asp:Label runat="server" AssociatedControlID="Nombre" class="col-sm-2 col-form-label">Nombre</asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox ID="Nombre" Text='<%# Bind("Nombre") %>' CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row mb-3">
                <asp:Label runat="server" AssociatedControlID="Precio" class="col-sm-2 col-form-label">Precio</asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox TextMode="Number" step=".01" ID="Precio" Text='<%# Bind("Precio", "{0:f2}") %>' CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row mb-3">
                <asp:Label runat="server" AssociatedControlID="Largo" class="col-sm-2 col-form-label">Largo</asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox TextMode="Number" step=".01" ID="Largo" Text='<%# Bind("Largo", "{0:f2}") %>' CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row mb-3">
                <asp:Label runat="server" AssociatedControlID="Ancho" class="col-sm-2 col-form-label">Ancho</asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox TextMode="Number" step=".01" ID="Ancho" Text='<%# Bind("Ancho", "{0:f2}") %>' CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row mb-3">
                <asp:Label runat="server" AssociatedControlID="Alto" class="col-sm-2 col-form-label">Alto</asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox TextMode="Number" step=".01" ID="Alto" Text='<%# Bind("Alto", "{0:f2}") %>' CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row mb-3">
                <asp:Label runat="server" AssociatedControlID="FechaFabricacion" class="col-sm-2 col-form-label">Fecha de fabricación</asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox TextMode="Date" ID="FechaFabricacion" Text='<%# Bind("FechaFabricacion", "{0:yyyy-MM-dd}") %>' CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="row mb-3">
                <div class="offset-sm-2 col-sm-10">
                    <asp:LinkButton CssClass="btn btn-primary" runat="server" Text="Aceptar" CommandName="Insert" ID="InsertButton" CausesValidation="True" />
                </div>
            </div>
        </InsertItemTemplate>
        <%--<ItemTemplate>
            Id:
            <asp:Label Text='<%# Bind("Id") %>' runat="server" ID="IdLabel" /><br />
            Nombre:
            <asp:Label Text='<%# Bind("Nombre") %>' runat="server" ID="NombreLabel" /><br />
            Precio:
            <asp:Label Text='<%# Bind("Precio") %>' runat="server" ID="PrecioLabel" /><br />
            Largo:
            <asp:Label Text='<%# Bind("Largo") %>' runat="server" ID="LargoLabel" /><br />
            Ancho:
            <asp:Label Text='<%# Bind("Ancho") %>' runat="server" ID="AnchoLabel" /><br />
            Alto:
            <asp:Label Text='<%# Bind("Alto") %>' runat="server" ID="AltoLabel" /><br />
            FechaFabricacion:
            <asp:Label Text='<%# Bind("FechaFabricacion") %>' runat="server" ID="FechaFabricacionLabel" /><br />
            <asp:LinkButton runat="server" Text="Editar" CommandName="Edit" ID="EditButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="Eliminar" CommandName="Delete" ID="DeleteButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="Nuevo" CommandName="New" ID="NewButton" CausesValidation="False" />
        </ItemTemplate>--%>
    </asp:FormView>

    <asp:ObjectDataSource OnObjectCreating="ListadoDataSource_ObjectCreating" runat="server" ID="FormularioDataSource" DataObjectTypeName="RepasoMF0967.Models.Mueble" DeleteMethod="Borrar" InsertMethod="Insertar" SelectMethod="ObtenerPorId" TypeName="RepasoMF0967.Daos.DaoMueble" UpdateMethod="Modificar">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridViewMuebles" PropertyName="SelectedValue" Name="id" Type="Int64"></asp:ControlParameter>
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
