<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TPINT_GRUPO_8_PR3.Login" %>
<form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblUsuario" runat="server" Text="Usuario:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvUsuario" runat="server"
                        ControlToValidate="txtUsuario"
                        ErrorMessage="Ingrese el usuario"
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblContrasena" runat="server" Text="Contraseña:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtContrasena" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvContrasena" runat="server"
                        ControlToValidate="txtContrasena"
                        ErrorMessage="Ingrese la contraseña"
                        ForeColor="Red"></asp:RequiredFieldValidator>
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