<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Turnos.aspx.cs" Inherits="TPINT_GRUPO_8_PR3.Turnos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Turnos</title>
     <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 180px;
        }

        .auto-style3 {
            width: 250px;
        }

        .auto-style4 {
            height: 35px;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lbltitulo_Turnos" runat="server"
                Font-Bold="True"
                Font-Size="X-Large"
                Text="Asignación de Turnos">
            </asp:Label>
        </div>
        <br />

        <table class="auto-style1">

            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblEspecialidad" runat="server"
                        Text="Especialidad">
                    </asp:Label>
                </td>

                <td class="auto-style3">
                    <asp:DropDownList ID="ddlEspecialidad" runat="server">
                        <asp:ListItem Text="-- Seleccionar --" Value="0"/>
                    </asp:DropDownList>
                </td>

                <td>&nbsp;</td>
            </tr>

            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblMedico" runat="server"
                        Text="Médico">
                    </asp:Label>
                </td>

                <td class="auto-style3">
                    <asp:DropDownList ID="ddlMedico" runat="server">
                        <asp:ListItem Text="-- Seleccionar --" Value="0"/>
                    </asp:DropDownList>
                </td>

                <td>&nbsp;</td>
            </tr>

            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblFecha" runat="server"
                        Text="Fecha">
                    </asp:Label>
                </td>

                <td class="auto-style3">
                    <asp:TextBox ID="txtFecha" runat="server"
                        TextMode="Date">
                    </asp:TextBox>
                </td>

                <td>&nbsp;</td>
            </tr>

            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblHorario" runat="server"
                        Text="Horario">
                    </asp:Label>
                </td>

                <td class="auto-style3">
                    <asp:DropDownList ID="ddlHorario" runat="server">
                        <asp:ListItem Text="-- Seleccionar --" Value="0"/>
                    </asp:DropDownList>
                </td>

                <td>&nbsp;</td>
            </tr>

        </table>

        <br />

        <table class="auto-style1">
            <tr>
                <td>
                    <asp:Label ID="titulo2" runat="server"
                        Text="Buscar Paciente"
                        Font-Bold="True"
                        Font-Size="X-Large">
                    </asp:Label>
                </td>
            </tr>
        </table>

        <table class="auto-style1">

            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblDNI" runat="server"
                        Text="DNI del paciente">
                    </asp:Label>
                </td>

                <td class="auto-style3">
                    <asp:TextBox ID="txtDNI" runat="server">
                    </asp:TextBox>
                </td>

                <td>
                    <asp:Button ID="btnBuscar" runat="server"
                        Text="Buscar" />
                </td>
            </tr>

            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblPacienteEncontrado" runat="server"
                        Text="Paciente">
                    </asp:Label>
                </td>

                <td colspan="2">
                    <asp:Label ID="lblPaciente" runat="server"
                        Text="Ingrese un DNI para buscar al paciente">
                    </asp:Label>
                </td>
            </tr>

        </table>

        <br />

        <table class="auto-style1">
            <tr>
                <td>
                    <asp:Button ID="btnAsignar" runat="server"
                        Text="Asignar Turno" />
                </td>
            </tr>

            <tr>
                <td class="auto-style4">
                    <asp:Label ID="lblMensaje" runat="server">
                    </asp:Label>
                </td>
            </tr>
        </table>

        <br />

        <table class="auto-style1">
            <tr>
                <td>
                    <asp:Label ID="titulo3" runat="server"
                        Text="Buscar Turnos"
                        Font-Bold="True"
                        Font-Size="X-Large">
                    </asp:Label>
                </td>
            </tr>
        </table>

        <table class="auto-style1">

            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblBuscar" runat="server"
                        Text="Buscar">
                    </asp:Label>
                </td>

                <td class="auto-style3">
                    <asp:TextBox ID="txtBuscarTurno" runat="server"
                        Width="176px">
                    </asp:TextBox>
                </td>

                <td>
                    <asp:Button ID="btnFiltrar" runat="server"
                        Text="Buscar" />
                </td>
            </tr>

            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblFechaDesde" runat="server"
                        Text="Fecha desde">
                    </asp:Label>
                </td>

                <td class="auto-style3">
                    <asp:TextBox ID="txtFechaDesde" runat="server"
                        TextMode="Date">
                    </asp:TextBox>
                </td>

                <td>&nbsp;</td>
            </tr>

            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblFechaHasta" runat="server"
                        Text="Fecha hasta">
                    </asp:Label>
                </td>

                <td class="auto-style3">
                    <asp:TextBox ID="txtFechaHasta" runat="server"
                        TextMode="Date">
                    </asp:TextBox>
                </td>

                <td>
                    <asp:Button ID="btnAplicarFiltro" runat="server"
                        Text="Filtrar" />
                </td>
            </tr>

        </table>

        <br />

        <table class="auto-style1">
            <tr>
                <td>&nbsp;</td>

                <td>
                    <asp:GridView ID="gvTurnos" runat="server"
                        AutoGenerateColumns="False"
                        ShowHeaderWhenEmpty="true"
                        EmptyDataText="No hay turnos para mostrar"
                        AllowPaging="True"
                        PageSize="10"
                        OnPageIndexChanging="gvTurnos_PageIndexChanging">

                        <Columns>

                            <asp:BoundField DataField="IdTurno"
                                HeaderText="N° Turno" />

                            <asp:BoundField DataField="Especialidad"
                                HeaderText="Especialidad" />

                            <asp:BoundField DataField="Medico"
                                HeaderText="Médico" />

                            <asp:BoundField DataField="Paciente"
                                HeaderText="Paciente" />

                            <asp:BoundField DataField="Fecha"
                                HeaderText="Fecha" />

                            <asp:BoundField DataField="Horario"
                                HeaderText="Horario" />

                        </Columns>

                    </asp:GridView>
                </td>

                <td>&nbsp;</td>
            </tr>
        </table>

    </form>
</body>
</html>
