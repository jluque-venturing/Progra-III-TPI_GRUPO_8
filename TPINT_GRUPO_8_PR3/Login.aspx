<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TPINT_GRUPO_8_PR3.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lblUsuario" runat="server" Text="Usuario:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblContrasena" runat="server" Text="Contraseña:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtContrasena" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" OnClick="btnIngresar_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblMensaje" runat="server" Text="&nbsp;"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>