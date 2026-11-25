
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pacientes.aspx.cs" Inherits="TPINT_GRUPO_8_PR3.Pacientes" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <title>Pacientes</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblUsuario" runat="server" />
            <h2>Datos del paciente</h2>

            <table>
                <tr>
                    <td>
                        <asp:Label ID="lblDni" runat="server" Text="DNI:" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtDni" runat="server" />
                        <asp:RequiredFieldValidator
                            ID="rfvDni"
                            runat="server"
                            ControlToValidate="txtDni"
                            ErrorMessage="El DNI es obligatorio."
                            ForeColor="Red"
                            Display="Dynamic" />
                        <asp:RegularExpressionValidator
                            ID="revDni"
                            runat="server"
                            ControlToValidate="txtDni"
                            ValidationExpression="^\d+$"
                            ErrorMessage="El DNI debe contener solamente números."
                            ForeColor="Red"
                            Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblNombre" runat="server" Text="Nombre:" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtNombre" runat="server" />
                        <asp:RequiredFieldValidator
                            ID="rfvNombre"
                            runat="server"
                            ControlToValidate="txtNombre"
                            ErrorMessage="El nombre es obligatorio."
                            ForeColor="Red"
                            Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblApellido" runat="server" Text="Apellido:" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtApellido" runat="server" />
                        <asp:RequiredFieldValidator
                            ID="rfvApellido"
                            runat="server"
                            ControlToValidate="txtApellido"
                            ErrorMessage="El apellido es obligatorio."
                            ForeColor="Red"
                            Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblSexo" runat="server" Text="Sexo:" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlSexo" runat="server">
                            <asp:ListItem Text="Seleccione..." Value="" />
                            <asp:ListItem Text="Masculino" Value="M" />
                            <asp:ListItem Text="Femenino" Value="F" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator
                            ID="rfvSexo"
                            runat="server"
                            ControlToValidate="ddlSexo"
                            InitialValue=""
                            ErrorMessage="Debe seleccionar un sexo."
                            ForeColor="Red"
                            Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblNacionalidad" runat="server" Text="Nacionalidad:" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtNacionalidad" runat="server" />
                        <asp:RequiredFieldValidator
                            ID="rfvNacionalidad"
                            runat="server"
                            ControlToValidate="txtNacionalidad"
                            ErrorMessage="La nacionalidad es obligatoria."
                            ForeColor="Red"
                            Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblFechaNacimiento" runat="server" Text="Fecha de nacimiento:" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtFechaNacimiento" runat="server" TextMode="Date" />
                        <asp:RequiredFieldValidator
                            ID="rfvFechaNacimiento"
                            runat="server"
                            ControlToValidate="txtFechaNacimiento"
                            ErrorMessage="La fecha de nacimiento es obligatoria."
                            ForeColor="Red"
                            Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblDireccion" runat="server" Text="Dirección:" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtDireccion" runat="server" />
                        <asp:RequiredFieldValidator
                            ID="rfvDireccion"
                            runat="server"
                            ControlToValidate="txtDireccion"
                            ErrorMessage="La dirección es obligatoria."
                            ForeColor="Red"
                            Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblEmail" runat="server" Text="Email:" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" />
                        <asp:RequiredFieldValidator
                            ID="rfvEmail"
                            runat="server"
                            ControlToValidate="txtEmail"
                            ErrorMessage="El email es obligatorio."
                            ForeColor="Red"
                            Display="Dynamic" />
                        <asp:RegularExpressionValidator
                            ID="revEmail"
                            runat="server"
                            ControlToValidate="txtEmail"
                            ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                            ErrorMessage="Ingrese un email con formato válido."
                            ForeColor="Red"
                            Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblTelefono" runat="server" Text="Teléfono:" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtTelefono" runat="server" />
                        <asp:RequiredFieldValidator
                            ID="rfvTelefono"
                            runat="server"
                            ControlToValidate="txtTelefono"
                            ErrorMessage="El teléfono es obligatorio."
                            ForeColor="Red"
                            Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblProvincia" runat="server" Text="Provincia:" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlProvincia" runat="server" AutoPostBack="True"
                            OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged">
                            <asp:ListItem Text="Seleccione una provincia..." Value="" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator
                            ID="rfvProvincia"
                            runat="server"
                            ControlToValidate="ddlProvincia"
                            InitialValue=""
                            ErrorMessage="Debe seleccionar una provincia."
                            ForeColor="Red"
                            Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblLocalidad" runat="server" Text="Localidad:" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlLocalidad" runat="server">
                            <asp:ListItem Text="Seleccione una localidad..." Value="" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator
                            ID="rfvLocalidad"
                            runat="server"
                            ControlToValidate="ddlLocalidad"
                            InitialValue=""
                            ErrorMessage="Debe seleccionar una localidad."
                            ForeColor="Red"
                            Display="Dynamic" />
                    </td>
                </tr>
            </table>

            <br />

            <asp:Button
                ID="btnGuardar"
                runat="server"
                Text="Guardar"
                CausesValidation="True"
                OnClick="btnGuardar_Click" />

            <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" />

            <br />
            <br />

            <asp:Label ID="lblMensaje" runat="server" />

            <br />
            <br />

            <h3>Buscar pacientes</h3>

            <table>
                <tr>
                    <td>
                        <asp:Label ID="lblBuscar" runat="server" Text="Buscar:" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtBuscar" runat="server" />
                    </td>
                    <td>
                        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" CausesValidation="False" />
                    </td>
                    <td>
                        <asp:Label ID="lblFiltrarSexo" runat="server" Text="Filtrar por sexo:" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlFiltroSexo" runat="server">
                            <asp:ListItem Text="Todos" Value="" />
                            <asp:ListItem Text="Masculino" Value="M" />
                            <asp:ListItem Text="Femenino" Value="F" />
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>

            <br />

            <h3>Listado de pacientes</h3>

            <asp:GridView
                ID="gvPacientes"
                runat="server"
                AutoGenerateColumns="False"
                ShowHeaderWhenEmpty="True"
                EmptyDataText="No hay pacientes registrados."
                AllowPaging="True"
                PageSize="10"
                OnPageIndexChanging="gvPacientes_PageIndexChanging">
                <Columns>

                    <asp:TemplateField HeaderText="DNI">
                        <ItemTemplate>
                            <asp:Label ID="lblDni" runat="server" Text='<%# Bind("Dni") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Nombre">
                        <ItemTemplate>
                            <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("Nombre") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Apellido">
                        <ItemTemplate>
                            <asp:Label ID="lblApellido" runat="server" Text='<%# Bind("Apellido") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Sexo">
                        <ItemTemplate>
                            <asp:Label ID="lblSexo" runat="server" Text='<%# Bind("Sexo") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Nacionalidad">
                        <ItemTemplate>
                            <asp:Label ID="lblNacionalidad" runat="server" Text='<%# Bind("Nacionalidad") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Fecha de nacimiento">
                        <ItemTemplate>
                            <asp:Label ID="lblFechaNacimiento" runat="server" Text='<%# Bind("FechaNacimiento", "{0:dd/MM/yyyy}") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Dirección">
                        <ItemTemplate>
                            <asp:Label ID="lblDireccion" runat="server" Text='<%# Bind("Direccion") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("Email") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Teléfono">
                        <ItemTemplate>
                            <asp:Label ID="lblTelefono" runat="server" Text='<%# Bind("Telefono") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Localidad">
                        <ItemTemplate>
                            <asp:Label ID="lblLocalidad" runat="server" Text='<%# Bind("Localidad") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Provincia">
                        <ItemTemplate>
                            <asp:Label ID="lblProvincia" runat="server" Text='<%# Bind("Provincia") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>