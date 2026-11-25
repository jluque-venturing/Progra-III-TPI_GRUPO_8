<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MisTurnos.aspx.cs" Inherits="TPINT_GRUPO_8_PR3.MisTurnos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Mis Turnos</title>
    <style type="text/css">
        .auto-style1 {
            height: 75px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table style="width: 100%";>
                <tr>
                <td>
                    <asp:Label ID="lblUsuario" runat="server" Text=""></asp:Label>
                </td>
                <td align="right">
                    <asp:LinkButton ID="lbtnCerrarSesion" runat="server" CausesValidation="False" OnClick="lbtnCerrarSesion_Click">Cerrar sesión</asp:LinkButton>
                </td>
            </tr>
            </table>
            <table style="width: 100%";> 
                <tr>
                <td style="width: 50px;">
                    <asp:Label ID="lblBuscar" runat="server"
                        Text="Buscar"></asp:Label>
                </td>
                <td style="width: 184px;">
                    <asp:TextBox ID="txtBuscar" runat="server"
                        Width="176px"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="btnBuscar" runat="server"
                        Text="Buscar" OnClick="btnBuscar_Click" />
                </td>
            </tr>

            </table>
            <table style="width: 100%";>
                 <tr>
                <td style="width: 150px;">
                    <asp:Label ID="lblFechaDesde" runat="server"
                        Text="Fecha desde"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtFechaDesde" runat="server"
                        TextMode="Date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblFechaHasta" runat="server"
                        Text="Fecha hasta"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtFechaHasta" runat="server"
                        TextMode="Date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblAsistencia" runat="server"
                        Text="Asistencia"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlAsistencia" runat="server">
                        <asp:ListItem Text="Todas" Value="" />
                        <asp:ListItem Text="Pendiente" Value="Pendiente" />
                        <asp:ListItem Text="Presente" Value="Presente" />
                        <asp:ListItem Text="Ausente" Value="Ausente" />
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="btnFiltrar" runat="server"
                        Text="Filtrar" OnClick="btnFiltrar_Click" />
                </td>
            </tr>
            </table>

            <br />

        <table style="width: 100%;">
            <tr>
                <td>
                    <asp:Label ID="lblListadoTurnos" runat="server"
                        Font-Bold="True" Font-Size="X-Large"
                        Text="Listado de Turnos"></asp:Label>
                </td>
            </tr>
        </table>
            <table style="width: 100%;">
            <tr>
                <td class="auto-style1"></td>
                <td class="auto-style1">
                    <asp:GridView ID="gvMisTurnos" runat="server"
                         AutoGenerateColumns="False"
                        ShowHeaderWhenEmpty="True"
                        EmptyDataText="No tiene ningún turno asignado.">

                        <Columns>

                            <asp:TemplateField HeaderText="Fecha">
                                <ItemTemplate>
                                    <asp:Label ID="lblFecha" runat="server"
                                        Text=""></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Hora">
                                <ItemTemplate>
                                    <asp:Label ID="lblHora" runat="server"
                                        Text=""></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Paciente">
                                <ItemTemplate>
                                    <asp:Label ID="lblPaciente" runat="server"
                                        Text=""></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Asistencia">
                                <ItemTemplate>
                                    <asp:Label ID="lblEstado" runat="server"
                                        Text=""></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Observación">
                                <ItemTemplate>
                                    <asp:Label ID="lblObservacion" runat="server"
                                        Text=""></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>

                    </asp:GridView>
                </td>
                <td class="auto-style1"></td>
            </tr>
        </table>

        </div>
    </form>
</body>
</html>
