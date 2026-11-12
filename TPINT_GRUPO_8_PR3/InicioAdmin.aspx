<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InicioAdmin.aspx.cs" Inherits="TPINT_GRUPO_8_PR3.InicioAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Menú del administrador</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td colspan="4" align="right">
                        <asp:Label ID="lblUsuario" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">Menú del administrador</td>
                </tr>
                <tr>
                    <td>
                        <asp:HyperLink ID="hlPacientes" runat="server" NavigateUrl="~/Pacientes.aspx">Pacientes</asp:HyperLink>
                    </td>
                    <td>
                        <asp:HyperLink ID="hlMedicos" runat="server" NavigateUrl="~/Medicos.aspx">Médicos</asp:HyperLink>
                    </td>
                    <td>
                        <asp:HyperLink ID="hlTurnos" runat="server" NavigateUrl="~/Turnos.aspx">Turnos</asp:HyperLink>
                    </td>
                    <td>
                        <asp:HyperLink ID="hlInformes" runat="server" NavigateUrl="~/Informes.aspx">Informes</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
