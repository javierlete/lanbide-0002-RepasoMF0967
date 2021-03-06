<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="AdminMuebles.aspx.cs" Inherits="RepasoMF0967.admin.AdminMuebles" Culture="en-US" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Content/dataTables.bootstrap5.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenido" runat="server">
    <h1>Administración muebles</h1>

    <asp:GridView OnDataBound="GridViewMuebles_DataBound" DataKeyNames="Id" CssClass="table table-hover table-striped table-bordered" ID="GridViewMuebles" runat="server" AutoGenerateColumns="False" DataSourceID="ListadoDataSource" OnSelectedIndexChanged="GridViewMuebles_SelectedIndexChanged">
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
                    <asp:Button ID="EditarButton" OnClick="EditarButton_Click" CausesValidation="false" CssClass="btn btn-primary" runat="server" Text="Editar" CommandName="Select" />
                    <asp:Button CausesValidation="false" CssClass="btn btn-danger" runat="server" Text="Borrar" CommandName="Delete" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:Button CausesValidation="false" CssClass="btn btn-primary" ID="InsertButton" runat="server" Text="Añadir" OnClick="InsertButton_Click" />
    <asp:ObjectDataSource OnObjectCreating="ListadoDataSource_ObjectCreating" runat="server" ID="ListadoDataSource" DataObjectTypeName="RepasoMF0967.Models.Mueble" DeleteMethod="Borrar" InsertMethod="Insertar" SelectMethod="ObtenerTodos" TypeName="RepasoMF0967.Daos.IDaoMueble" UpdateMethod="Modificar"></asp:ObjectDataSource>

    <asp:FormView OnItemUpdating="FormViewMueble_ItemUpdating" OnItemInserting="FormViewMueble_ItemInserting" RenderOuterTable="false" DataKeyNames="Id" ID="FormViewMueble" runat="server" DataSourceID="FormularioDataSource" OnItemUpdated="RefrescarGrid" OnItemInserted="FormViewMueble_ItemInserted">
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
                    <asp:TextBox ID="Nombre" Text='<%# Bind("Nombre") %>' CssClass='form-control' runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="text-danger" ControlToValidate="Nombre" ID="RfNombre" runat="server" ErrorMessage="Es obligatorio rellenar el nombre" Display="Dynamic" ValidationGroup="Editar"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row mb-3">
                <asp:Label runat="server" AssociatedControlID="Precio" class="col-sm-2 col-form-label">Precio</asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox TextMode="Number" step=".01" ID="Precio" Text='<%# Bind("Precio", "{0:f2}") %>' CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="text-danger" ControlToValidate="Precio" ID="RfPrecio" runat="server" ErrorMessage="Es obligatorio rellenar el precio" Display="Dynamic" ValidationGroup="Editar"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CvPrecio" runat="server" ErrorMessage="Debe ser un número decimal positivo" Operator="GreaterThanEqual" ControlToValidate="Precio" Type="Currency" CssClass="text-danger" ValueToCompare="0" Display="Dynamic" ValidationGroup="Editar"></asp:CompareValidator>
                </div>
            </div>
            <div class="row mb-3">
                <asp:Label runat="server" AssociatedControlID="Largo" class="col-sm-2 col-form-label">Largo</asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox TextMode="Number" step=".01" ID="Largo" Text='<%# Bind("Largo", "{0:f2}") %>' CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:CompareValidator ID="CvLargo" runat="server" ErrorMessage="Debe ser un número decimal positivo" Operator="GreaterThanEqual" ControlToValidate="Largo" Type="Double" CssClass="text-danger" ValueToCompare="0" Display="Dynamic" ValidationGroup="Editar"></asp:CompareValidator>
                </div>
            </div>
            <div class="row mb-3">
                <asp:Label runat="server" AssociatedControlID="Ancho" class="col-sm-2 col-form-label">Ancho</asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox TextMode="Number" step=".01" ID="Ancho" Text='<%# Bind("Ancho", "{0:f2}") %>' CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:CompareValidator ID="CvAncho" runat="server" ErrorMessage="Debe ser un número decimal positivo" Operator="GreaterThanEqual" ControlToValidate="Ancho" Type="Double" CssClass="text-danger" ValueToCompare="0" Display="Dynamic" ValidationGroup="Editar"></asp:CompareValidator>
                </div>
            </div>
            <div class="row mb-3">
                <asp:Label runat="server" AssociatedControlID="Alto" class="col-sm-2 col-form-label">Alto</asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox TextMode="Number" step=".01" ID="Alto" Text='<%# Bind("Alto", "{0:f2}") %>' CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:CompareValidator ID="CvAlto" runat="server" ErrorMessage="Debe ser un número decimal positivo" Operator="GreaterThanEqual" ControlToValidate="Alto" Type="Double" CssClass="text-danger" ValueToCompare="0" Display="Dynamic" ValidationGroup="Editar"></asp:CompareValidator>
                </div>
            </div>
            <div class="row mb-3">
                <asp:Label runat="server" AssociatedControlID="FechaFabricacion" class="col-sm-2 col-form-label">Fecha de fabricación</asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox TextMode="Date" ID="FechaFabricacion" Text='<%# Bind("FechaFabricacion", "{0:yyyy-MM-dd}") %>' CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:CompareValidator ID="CvFechaFabricacion" runat="server" ErrorMessage="Debe ser una fecha posterior al año 2000" Operator="GreaterThanEqual" ControlToValidate="FechaFabricacion" Type="Date" CssClass="text-danger" ValueToCompare="01-01-2000" Display="Dynamic" ValidationGroup="Editar"></asp:CompareValidator>
                </div>
            </div>

            <div class="row mb-3">
                <div class="offset-sm-2 col-sm-10">
                    <asp:LinkButton CssClass="btn btn-primary" runat="server" Text="Guardar" CommandName="Update" ID="UpdateButton" CausesValidation="True" ValidationGroup="Editar" />
                </div>
            </div>
        </EditItemTemplate>
        <InsertItemTemplate>
            <div class="row mb-3">
                <asp:Label runat="server" AssociatedControlID="Nombre" class="col-sm-2 col-form-label">Nombre</asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox ID="Nombre" Text='<%# Bind("Nombre") %>' CssClass='form-control' runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="text-danger" ControlToValidate="Nombre" ID="RfNombre" runat="server" ErrorMessage="Es obligatorio rellenar el nombre" Display="Dynamic" ValidationGroup="Insertar"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row mb-3">
                <asp:Label runat="server" AssociatedControlID="Precio" class="col-sm-2 col-form-label">Precio</asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox TextMode="Number" step=".01" ID="Precio" Text='<%# Bind("Precio", "{0:f2}") %>' CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="text-danger" ControlToValidate="Precio" ID="RfPrecio" runat="server" ErrorMessage="Es obligatorio rellenar el precio" Display="Dynamic" ValidationGroup="Insertar"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CvPrecio" runat="server" ErrorMessage="Debe ser un número decimal positivo" Operator="GreaterThanEqual" ControlToValidate="Precio" Type="Currency" CssClass="text-danger" ValueToCompare="0" Display="Dynamic" ValidationGroup="Insertar"></asp:CompareValidator>
                </div>
            </div>
            <div class="row mb-3">
                <asp:Label runat="server" AssociatedControlID="Largo" class="col-sm-2 col-form-label">Largo</asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox TextMode="Number" step=".01" ID="Largo" Text='<%# Bind("Largo", "{0:f2}") %>' CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:CompareValidator ID="CvLargo" runat="server" ErrorMessage="Debe ser un número decimal positivo" Operator="GreaterThanEqual" ControlToValidate="Largo" Type="Double" CssClass="text-danger" ValueToCompare="0" Display="Dynamic" ValidationGroup="Insertar"></asp:CompareValidator>
                </div>
            </div>
            <div class="row mb-3">
                <asp:Label runat="server" AssociatedControlID="Ancho" class="col-sm-2 col-form-label">Ancho</asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox TextMode="Number" step=".01" ID="Ancho" Text='<%# Bind("Ancho", "{0:f2}") %>' CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:CompareValidator ID="CvAncho" runat="server" ErrorMessage="Debe ser un número decimal positivo" Operator="GreaterThanEqual" ControlToValidate="Ancho" Type="Double" CssClass="text-danger" ValueToCompare="0" Display="Dynamic" ValidationGroup="Insertar"></asp:CompareValidator>
                </div>
            </div>
            <div class="row mb-3">
                <asp:Label runat="server" AssociatedControlID="Alto" class="col-sm-2 col-form-label">Alto</asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox TextMode="Number" step=".01" ID="Alto" Text='<%# Bind("Alto", "{0:f2}") %>' CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:CompareValidator ID="CvAlto" runat="server" ErrorMessage="Debe ser un número decimal positivo" Operator="GreaterThanEqual" ControlToValidate="Alto" Type="Double" CssClass="text-danger" ValueToCompare="0" Display="Dynamic" ValidationGroup="Insertar"></asp:CompareValidator>
                </div>
            </div>
            <div class="row mb-3">
                <asp:Label runat="server" AssociatedControlID="FechaFabricacion" class="col-sm-2 col-form-label">Fecha de fabricación</asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox TextMode="Date" ID="FechaFabricacion" Text='<%# Bind("FechaFabricacion", "{0:yyyy-MM-dd}") %>' CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:CompareValidator ID="CvFechaFabricacion" runat="server" ErrorMessage="Debe ser una fecha posterior al año 2000" Operator="GreaterThanEqual" ControlToValidate="FechaFabricacion" Type="Date" CssClass="text-danger" ValueToCompare="01-01-2000" Display="Dynamic" ValidationGroup="Insertar"></asp:CompareValidator>
                </div>
            </div>

            <div class="row mb-3">
                <div class="offset-sm-2 col-sm-10">
                    <asp:LinkButton CssClass="btn btn-primary" runat="server" Text="Insertar" CommandName="Insert" ID="InsertButton" CausesValidation="True" ValidationGroup="Insertar" />
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

    <asp:ObjectDataSource OnObjectCreating="ListadoDataSource_ObjectCreating" runat="server" ID="FormularioDataSource" DataObjectTypeName="RepasoMF0967.Models.Mueble" DeleteMethod="Borrar" InsertMethod="Insertar" SelectMethod="ObtenerPorId" TypeName="RepasoMF0967.Daos.IDaoMueble" UpdateMethod="Modificar">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridViewMuebles" PropertyName="SelectedValue" Name="id" Type="Int64"></asp:ControlParameter>
        </SelectParameters>
    </asp:ObjectDataSource>
    <script src="/Scripts/jquery-3.6.0.min.js"></script>
    <script src="/Scripts/jquery.dataTables.min.js"></script>
    <script src="/Scripts/dataTables.bootstrap5.min.js"></script>

    <script>
        $(function () {
            $('table').DataTable({
                language: {
                    url: '/Content/es_es.json'
                }
            })
        });
    </script>
</asp:Content>
