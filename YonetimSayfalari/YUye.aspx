<%@ Page Title="" Language="C#" MasterPageFile="~/Yonet.Master" AutoEventWireup="true" CodeBehind="YUye.aspx.cs" Inherits="_1912901060_Odev4.YonetimSayfalari.Yuye" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblBaslik" runat="server" Text="Üye Yönetimi" Font-Bold="True" Font-Size="X-Large"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [uyeNo], [kullaniciAdi], [adi], [soyadi], [silindi] FROM [kullanici]"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="uyeNo" DataSourceID="SqlDataSource1" AllowPaging="True" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="uyeNo" HeaderText="uyeNo" InsertVisible="False" ReadOnly="True" SortExpression="uyeNo" />
            <asp:BoundField DataField="kullaniciAdi" HeaderText="kullaniciAdi" SortExpression="kullaniciAdi" />
            <asp:BoundField DataField="adi" HeaderText="adi" SortExpression="adi" />
            <asp:BoundField DataField="soyadi" HeaderText="soyadi" SortExpression="soyadi" />
            <asp:CheckBoxField DataField="silindi" HeaderText="silindi" SortExpression="silindi" />
        </Columns>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <SortedAscendingCellStyle BackColor="#F4F4FD" />
        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
        <SortedDescendingCellStyle BackColor="#D8D8F0" />
        <SortedDescendingHeaderStyle BackColor="#3E3277" />
</asp:GridView>
    <asp:LinkButton ID="btnGoster" runat="server" OnClick="btnGoster_Click">Kullanıcı Detay Goster</asp:LinkButton>
</asp:Content>
