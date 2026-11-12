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
            <h2>Datos del paciente</h2>

            <table>
                <tr>
                    <td>
                        <asp:Label ID="lblDni" runat="server" Text="DNI:" /></td>
                    <td>
                        <asp:TextBox ID="txtDni" runat="server" /></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblNombre" runat="server" Text="Nombre:" /></td>
                    <td>
                        <asp:TextBox ID="txtNombre" runat="server" /></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblApellido" runat="server" Text="Apellido:" /></td>
                    <td>
                        <asp:TextBox ID="txtApellido" runat="server" /></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblSexo" runat="server" Text="Sexo:" /></td>
                    <td>
                        <asp:DropDownList ID="ddlSexo" runat="server">
                            <asp:ListItem Text="Seleccione..." Value="" />
                            <asp:ListItem Text="Masculino" Value="M" />
                            <asp:ListItem Text="Femenino" Value="F" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblNacionalidad" runat="server" Text="Nacionalidad:" /></td>
                    <td>
                        <asp:TextBox ID="txtNacionalidad" runat="server" /></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblFechaNacimiento" runat="server" Text="Fecha de nacimiento:" /></td>
                    <td>
                        <asp:TextBox ID="txtFechaNacimiento" runat="server" TextMode="Date" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblDireccion" runat="server" Text="Dirección:" /></td>
                    <td>
                        <asp:TextBox ID="txtDireccion" runat="server" /></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblEmail" runat="server" Text="Email:" /></td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" /></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblTelefono" runat="server" Text="Teléfono:" /></td>
                    <td>
                        <asp:TextBox ID="txtTelefono" runat="server" /></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblProvincia" runat="server" Text="Provincia:" /></td>
                    <td>
                        <asp:DropDownList ID="ddlProvincia" runat="server">
                            <asp:ListItem Text="Seleccione una provincia..." Value="" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblLocalidad" runat="server" Text="Localidad:" /></td>
                    <td>
                        <asp:DropDownList ID="ddlLocalidad" runat="server">
                            <asp:ListItem Text="Seleccione una localidad..." Value="" />
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>

            <br />

            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" />

            <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" />

            <br />
            <br />

            <asp:Label ID="lblMensaje" runat="server" />

            <br />

            <asp:Label ID="lblUsuario" runat="server" />

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
                        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" />
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
                PageSize="10">

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