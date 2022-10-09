<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MetinKutusu.ascx.cs" Inherits="_1912901060_Odev4.UserControl.MetinKutusu" %>
<style type="text/css">
    .auto-style1 {
        height: 26px;
    }
    #TextArea1 {
        height: 201px;
        width: 351px;
    }
    #txtMetin {
        height: 50px;
        width: 250px;
    }
</style>
<asp:MultiView ID="MetinKutusuView" runat="server" ActiveViewIndex="0">
    <asp:View ID="View1" runat="server">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [msjNo], [adsoyad], [konu] FROM [iletisim]"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" DataKeyNames="msjNo" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="msjNo" HeaderText="msjNo" InsertVisible="False" ReadOnly="True" SortExpression="msjNo" />
                <asp:BoundField DataField="adsoyad" HeaderText="adsoyad" SortExpression="adsoyad" />
                <asp:BoundField DataField="konu" HeaderText="konu" SortExpression="konu" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#487575" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#275353" />
        </asp:GridView>
        <br />
        <asp:LinkButton ID="btnDetayGoster" runat="server" OnClick="btnDetayGoster_Click">Mesajın Detayını Göster</asp:LinkButton>

    </asp:View>
    <asp:View ID="View2" runat="server">

        <table>
        <tr>
            <td class="auto-style1">Mesaj Numarası</td>
            <td class="auto-style1">
                <asp:Label ID="lblMesajNo" runat="server" Font-Bold="True"></asp:Label></td>
        </tr>
        <tr>
            <td>Ad Soyad:</td>
            <td>
                <asp:TextBox ID="txtIAdSoyad" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>E-Posta Adresi:</td>
            <td>
                <asp:TextBox ID="txtIEPosta" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Konu:</td>
            <td>
                <asp:TextBox ID="txtIKonu" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Metin:</td>
            <td>
                <asp:TextBox ID="txtMetin" runat="server" Font-Bold="False" Height="245px" TextMode="MultiLine" Width="250px"></asp:TextBox>
            </td>
        </tr>
    </table>

        <asp:LinkButton ID="btnSil" runat="server" OnClick="btnSil_Click">Mesajı Sil</asp:LinkButton><br />
        <asp:LinkButton ID="btnGuncelle" runat="server" OnClick="btnGuncelle_Click">Mesajı Güncelle</asp:LinkButton><br />
        <asp:Label ID="lblUyari" runat="server" Text=""></asp:Label>


    </asp:View>
</asp:MultiView>