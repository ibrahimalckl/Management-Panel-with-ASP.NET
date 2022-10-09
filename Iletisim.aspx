<%@ Page Title="" Language="C#" MasterPageFile="~/Ana.Master" AutoEventWireup="true" CodeBehind="Iletisim.aspx.cs" Inherits="_1912901060_Odev4.Iletisim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>Ad Soyad:</td>
            <td>
                <asp:TextBox ID="txtIAdSoyad" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtIAdSoyad" ErrorMessage="RequiredFieldValidator">Ad Soyad Boş Bırakılamaz</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>E-Posta Adresi:</td>
            <td>
                <asp:TextBox ID="txtIEPosta" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtIEPosta" ErrorMessage="RegularExpressionValidator" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">E-Posta Formatı Hatalı</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>Konu:</td>
            <td>
                <asp:TextBox ID="txtIKonu" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtIKonu" ErrorMessage="RequiredFieldValidator">Konu Boş Bırakılamaz</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Metin:</td>
            <td>
                <asp:TextBox ID="txtIMetin" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtIMetin" ErrorMessage="RequiredFieldValidator">Metin Boş Bırakılamaz</asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>

    <asp:Label ID="lblGuvenlik" runat="server" Text=""></asp:Label> &nbsp;sayıyı yazınız&nbsp;
    <asp:TextBox ID="txtGuvenlik" runat="server"></asp:TextBox>
    <br />
    <asp:LinkButton ID="btnGonder" runat="server" OnClick="btnGonder_Click">Gönder</asp:LinkButton>
    <br />
    <asp:Label ID="lblUyari" runat="server"></asp:Label>
</asp:Content>
