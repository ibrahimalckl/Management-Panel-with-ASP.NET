<%@ Page Title="" Language="C#" MasterPageFile="~/Ana.Master" AutoEventWireup="true" CodeBehind="UyeDetay.aspx.cs" Inherits="_1912901060_Odev4.UyeDetay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table>
        <tr>
            <td>Üye Numarası</td>
            <td>
                <asp:Label ID="lblUyeNo" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td>Kullanıcı Adı</td>
            <td><asp:TextBox ID="txtKullaniciAdi" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtKullaniciAdi" 
                    ErrorMessage="RequiredFieldValidator">Bir Kullanıcı Adı Giriniz</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>Parola</td>
            <td><asp:TextBox ID="txtParola" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtParola" 
                    ErrorMessage="RequiredFieldValidator">Parola Boş Olamaz</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>Parola Tekrar</td>
            <td><asp:TextBox ID="txtParolaTekrar" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtParola" ControlToValidate="txtParolaTekrar" 
                    ErrorMessage="CompareValidator">Parolalar Uyuşmuyor</asp:CompareValidator></td>
        </tr>
        <tr>
            <td>Adı</td>
            <td><asp:TextBox ID="txtAdi" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAdi" 
                    ErrorMessage="RequiredFieldValidator">Ad Boş Bırakılamaz</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>Soyadı</td>
            <td><asp:TextBox ID="txtSoyadi" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtSoyadi" 
                    ErrorMessage="RequiredFieldValidator">Soyad Boş Bırakılamaz</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>e-Posta</td>
            <td><asp:TextBox ID="txtePosta" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtePosta" 
                    ErrorMessage="RegularExpressionValidator" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">e-Posta Formatı Hatalı</asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td>Yetki</td>
            <td>
                <asp:DropDownList ID="drpYetki" Width="150px" runat="server">
                    <asp:ListItem Value="1">Yönetici</asp:ListItem>
                    <asp:ListItem Value="2">Kullanıcı</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
    </table>

    <asp:Label ID="lblGuvenlik" runat="server" Text=""></asp:Label>
    &nbsp;sayıyı yazınız
    <asp:TextBox ID="txtGuvenlik" runat="server" Width="82px"></asp:TextBox>
    <br />
    <asp:LinkButton ID="btnUyeEkle" runat="server" OnClick="btnUyeEkle_Click">Üye Ekle</asp:LinkButton>
    &nbsp;<asp:LinkButton ID="btnGuncelle" runat="server" OnClick="btnGuncelle_Click">Bilgilerimi Güncelle</asp:LinkButton>
    &nbsp;
    <br />
    <asp:LinkButton ID="btnUyeSil" runat="server" OnClick="btnUyeSil_Click" Visible="False">Üye Sil</asp:LinkButton>
    <br />
    <asp:LinkButton ID="btnAnaSayfa" runat="server" OnClick="btnAnaSayfa_Click">Ana Sayfa Dön</asp:LinkButton>
    <br />
    <asp:Label ID="lblUyari" runat="server" Text=""></asp:Label>

</asp:Content>
