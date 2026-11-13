<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Medicos.aspx.cs" Inherits="TPINT_GRUPO_8_PR3.Medicos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 112px;
        }
        .auto-style2 {
            height: 23px;
        }
        .auto-style9 {
            width: 179px;
            height: 26px;
        }
        .auto-style10 {
            height: 26px;
        }
        .auto-style11 {
            height: 23px;
            width: 178px;
        }
        .auto-style13 {
            width: 179px;
        }
        .auto-style14 {
            height: 23px;
            width: 179px;
        }
        .auto-style15 {
            width: 100%;
        }
        .auto-style16 {
            width: 526px;
        }
        .auto-style17 {
            width: 381px;
        }
        .auto-style19 {
            width: 311px;
        }
        .auto-style20 {
            height: 23px;
            width: 311px;
        }
        .auto-style21 {
            height: 26px;
            width: 311px;
        }
        .auto-style22 {
            height: 23px;
            width: 312px;
        }
        .auto-style23 {
            height: 30px;
        }
        .auto-style24 {
            height: 22px;
        }
        .auto-style25 {
            width: 139px;
        }
        .auto-style26 {
            height: 22px;
            width: 139px;
        }
        .auto-style27 {
            width: 245px;
        }
        .auto-style28 {
            width: 50px;
        }
        .auto-style29 {
            width: 184px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="titulo" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Datos del Médico"></asp:Label>
        </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style13">
                    <asp:Label ID="lblLegajo" runat="server" Text="Legajo"></asp:Label>
                </td>
                <td class="auto-style19">
                    <asp:TextBox ID="txtLegajo" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style13">
                    <asp:Label ID="lblDNI" runat="server" Text="DNI"></asp:Label>
                </td>
                <td class="auto-style19">
                    <asp:TextBox ID="txtDNI" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style14">
                    <asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label>
                </td>
                <td class="auto-style20">
                    <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style14">
                    <asp:Label ID="lblApellido" runat="server" Text="Apellido"></asp:Label>
                </td>
                <td class="auto-style20">
                    <asp:TextBox ID="txtApellido" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style13">
                    <asp:Label ID="lblSexo" runat="server" Text="Sexo"></asp:Label>
                </td>
                <td class="auto-style19">
                    <asp:TextBox ID="txtSexo" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style13">
                    <asp:Label ID="lblNacionalidad" runat="server" Text="Nacionalidad"></asp:Label>
                </td>
                <td class="auto-style19">
                    <asp:TextBox ID="txtNacionalidad" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9">
                    <asp:Label ID="lblFechaNacimiento" runat="server" Text="Fecha de Nacimiento"></asp:Label>
                </td>
                <td class="auto-style21">
                    <asp:TextBox ID="txtFechaNacimiento" runat="server" TextMode="DateTime"></asp:TextBox>
                </td>
                <td class="auto-style10"></td>
            </tr>
            <tr>
                <td class="auto-style13">
                    <asp:Label ID="lblDireccion" runat="server" Text="Dirección"></asp:Label>
                </td>
                <td class="auto-style19">
                    <asp:TextBox ID="txtDireccion" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9">
                    <asp:Label ID="lblLocalidad" runat="server" Text="Localidad"></asp:Label>
                </td>
                <td class="auto-style21">
                    <asp:TextBox ID="txtLocalidad" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style10"></td>
            </tr>
            <tr>
                <td class="auto-style13">
                    <asp:Label ID="lblProvincia" runat="server" Text="Provincia"></asp:Label>
                </td>
                <td class="auto-style19">
                    <asp:TextBox ID="txtProvincia" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table class="auto-style1">
            <tr>
                <td class="auto-style11">
                    <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                </td>
                <td class="auto-style22">
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:Label ID="lblTelefono" runat="server" Text="Teléfono"></asp:Label>
                </td>
                <td class="auto-style22">
                    <asp:TextBox ID="txtTelefono" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:Label ID="lblEspecialidad" runat="server" Text="Especialidad"></asp:Label>
                </td>
                <td class="auto-style22">
                    <asp:DropDownList ID="ddlEspecialidad" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style11">
                    &nbsp;</td>
                <td class="auto-style22">&nbsp;</td>
                <td class="auto-style2"></td>
            </tr>
            </table>
        <table class="auto-style15">
            <tr>
                <td class="auto-style17">
                    <asp:Label ID="titulo2" runat="server" Text="Días y Horarios de atención" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table class="auto-style15">
            <tr>
                <td class="auto-style16">
                    <asp:CheckBoxList ID="cblDias" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>Lunes</asp:ListItem>
                        <asp:ListItem>Martes</asp:ListItem>
                        <asp:ListItem Value="Miercoles">Miércoles</asp:ListItem>
                        <asp:ListItem>Jueves</asp:ListItem>
                        <asp:ListItem>Viernes</asp:ListItem>
                        <asp:ListItem Value="Sabado">Sábado</asp:ListItem>
                        <asp:ListItem>Domingo</asp:ListItem>
                    </asp:CheckBoxList>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style16">
                    <asp:DropDownList ID="ddlHoraFin" runat="server">
                        <asp:ListItem>08:00</asp:ListItem>
                        <asp:ListItem>09:00</asp:ListItem>
                        <asp:ListItem>10:00</asp:ListItem>
                        <asp:ListItem>11:00</asp:ListItem>
                        <asp:ListItem>12:00</asp:ListItem>
                        <asp:ListItem>13:00</asp:ListItem>
                        <asp:ListItem>14:00</asp:ListItem>
                        <asp:ListItem>15:00</asp:ListItem>
                        <asp:ListItem>16:00</asp:ListItem>
                        <asp:ListItem>17:00</asp:ListItem>
                        <asp:ListItem>18:00</asp:ListItem>
                        <asp:ListItem>19:00</asp:ListItem>
                        <asp:ListItem>20:00</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style16">
                    <asp:DropDownList ID="ddlHoraInicio" runat="server">
                        <asp:ListItem>08:00</asp:ListItem>
                        <asp:ListItem>09:00</asp:ListItem>
                        <asp:ListItem>10:00</asp:ListItem>
                        <asp:ListItem>11:00</asp:ListItem>
                        <asp:ListItem>12:00</asp:ListItem>
                        <asp:ListItem>13:00</asp:ListItem>
                        <asp:ListItem>14:00</asp:ListItem>
                        <asp:ListItem>15:00</asp:ListItem>
                        <asp:ListItem>16:00</asp:ListItem>
                        <asp:ListItem>17:00</asp:ListItem>
                        <asp:ListItem>18:00</asp:ListItem>
                        <asp:ListItem>19:00</asp:ListItem>
                        <asp:ListItem>20:00</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table class="auto-style15">
            <tr>
                <td class="auto-style23">
                    <asp:Label ID="titulo3" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Registrate"></asp:Label>
                </td>
                <td class="auto-style23"></td>
                <td class="auto-style23"></td>
            </tr>
        </table>
        <table class="auto-style15">
            <tr>
                <td class="auto-style25">
                    <asp:Label ID="lblUsuario" runat="server" Text="Ingresar Usuario"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtUsuario" runat="server" style="margin-left: 0px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style25">
                    <asp:Label ID="lblContraseña" runat="server" Text="Ingrese su contraseña"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtContraseña" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style25">
                    <asp:Label ID="lblRepetirContraseña" runat="server" Text="Repetir contraseña"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtRepetirContraseña" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style26">&nbsp;</td>
                <td class="auto-style24">
                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar Médico" />
                </td>
                <td class="auto-style24"></td>
            </tr>
            <tr>
                <td class="auto-style25">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table class="auto-style15">
            <tr>
                <td class="auto-style27">
                    <asp:Label ID="titulo4" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Buscar Médicos"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table class="auto-style15">
            <tr>
                <td class="auto-style28">
                    <asp:Label ID="lblBuscar" runat="server" Text="Buscar"></asp:Label>
                </td>
                <td class="auto-style29">
                    <asp:TextBox ID="txtBuscar" runat="server" style="margin-left: 0px" Width="176px"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="btnBuscar" runat="server" style="margin-left: 0px" Text="Buscar" />
                </td>
            </tr>
            <tr>
                <td class="auto-style28">&nbsp;</td>
                <td class="auto-style29">
                    <asp:DropDownList ID="ddlFiltrarEspecialidad" runat="server">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" />
                </td>
            </tr>
            <tr>
                <td class="auto-style28">&nbsp;</td>
                <td class="auto-style29">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table class="auto-style15">
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:GridView ID="gvMedicos" runat="server">
                    </asp:GridView>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
