using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

namespace _1912901060_Odev4.UserControl
{
    public partial class MetinKutusu : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (GridView1.SelectedValue != null)
            {
                DataTable dt = VeriTabani.veriGetir("select * from iletisim where msjNo = " + GridView1.SelectedValue.ToString());

                if (dt.Rows.Count > 0)
                {
                    lblMesajNo.Text = GridView1.SelectedValue.ToString();
                    txtIAdSoyad.Text = dt.Rows[0]["adsoyad"].ToString();
                    txtIEPosta.Text = dt.Rows[0]["eposta"].ToString();
                    txtIKonu.Text = dt.Rows[0]["konu"].ToString();
                    txtMetin.Text = dt.Rows[0]["metin"].ToString();
                }
            }
            
        }
        protected void btnDetayGoster_Click(object sender, EventArgs e)
        {
            MetinKutusuView.ActiveViewIndex = 1;
        }

        protected void btnSil_Click(object sender, EventArgs e)
        {
            OleDbCommand cmd = VeriTabani.KomutOlustur("delete from iletisim where msjNo = @msjNo");
            cmd.Parameters.AddWithValue("@msjNo", lblMesajNo.Text);
            VeriTabani.KomutCalistir(cmd);

            btnGuncelle.Visible = false;

            lblUyari.Text = "Mesaj başarıyla silindi.";
        }

        protected void btnGuncelle_Click(object sender, EventArgs e)
        {
            OleDbCommand cmd = VeriTabani.KomutOlustur("update iletisim set adsoyad = @adsoyad, eposta = @eposta, konu = @konu, " +
                    "metin = @metin where msjNo = @msjNo");

            cmd.Parameters.AddWithValue("@adsoyad", txtIAdSoyad.Text);
            cmd.Parameters.AddWithValue("@eposta", txtIEPosta.Text);
            cmd.Parameters.AddWithValue("@konu", txtIKonu.Text);
            cmd.Parameters.AddWithValue("@metin", txtMetin.Text);

            VeriTabani.KomutCalistir(cmd);

            lblUyari.Text = "Mesaj başarıyla güncellendi.";
        }
    }
}