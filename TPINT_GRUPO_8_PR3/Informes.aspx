,,,<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Informes.aspx.cs" Inherits="TPINT_GRUPO_8_PR3.Informes" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Informes - Clínica</title>
    <style type="text/css">
        .seccion-informe { margin-top: 24px; }
        .tabla-informe { margin-top: 10px; }
        .fila-filtros td { padding-right: 15px; padding-bottom: 8px; }
        .dato-informe { margin-bottom: 8px; }
        .mensaje-informe { display: block; margin-top: 12px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Pantalla de informes</h2>
            <asp:HyperLink ID="hlInicioAdmin" runat="server" NavigateUrl="~/InicioAdmin.aspx">Volver al menú del administrador</asp:HyperLink>

            <h3>Seleccionar período</h3>
            <table>
                <tr class="fila-filtros">
                    <td>
                        <asp:Label ID="lblFechaDesde" runat="server" Text="Fecha desde:" AssociatedControlID="txtFechaDesde" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtFechaDesde" runat="server" TextMode="Date" />
                    </td>
                    <td>
                        <asp:Label ID="lblFechaHasta" runat="server" Text="Fecha hasta:" AssociatedControlID="txtFechaHasta" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtFechaHasta" runat="server" TextMode="Date" />
                    </td>
                    <td>
                        <asp:Button ID="btnGenerarInformes" runat="server" Text="Generar informes" OnClick="btnGenerarInformes_Click" />
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblMensaje" runat="server" CssClass="mensaje-informe" />

            <div class="seccion-informe">
                <h3>Informe 1: Porcentajes de asistencia</h3>
                <div class="dato-informe">
                    <asp:Label ID="lblTituloPorcentajePresentes" runat="server" Text="Porcentaje de presentes: " />
                    <asp:Label ID="lblPorcentajePresentes" runat="server" Text="-- %" />
                </div>
                <div class="dato-informe">
                    <asp:Label ID="lblTituloPorcentajeAusentes" runat="server" Text="Porcentaje de ausentes: " />
                    <asp:Label ID="lblPorcentajeAusentes" runat="server" Text="-- %" />
                </div>
            </div>

            <div class="seccion-informe">
                <h3>Informe 2: Presentes</h3>
                <asp:GridView ID="gvPresentes" runat="server" AutoGenerateColumns="True"
                    CssClass="tabla-informe" EmptyDataText="Sin datos cargados para el período seleccionado."
                    BorderWidth="1px" CellPadding="5" />
            </div>

            <div class="seccion-informe">
                <h3>Informe 3: Ausentes</h3>
                <asp:GridView ID="gvAusentes" runat="server" AutoGenerateColumns="True"
                    CssClass="tabla-informe" EmptyDataText="Sin datos cargados para el período seleccionado."
                    BorderWidth="1px" CellPadding="5" />
            </div>
        </div>
    </form>
</body>
</html>
