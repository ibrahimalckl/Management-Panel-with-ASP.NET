<%@ Page Title="" Language="C#" MasterPageFile="~/Yonet.Master" AutoEventWireup="true" CodeBehind="YIletisim.aspx.cs" Inherits="_1912901060_Odev4.YonetimSayfalari.YIletisim" %>

<%@ Register Src="~/UserControl/MetinKutusu.ascx" TagPrefix="uc1" TagName="MetinKutusu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblBaslik" runat="server" Text="Metin Kutusu" Font-Bold="True" Font-Size="X-Large"></asp:Label>
    <uc1:MetinKutusu runat="server" ID="MetinKutusu" />
    </asp:Content>
