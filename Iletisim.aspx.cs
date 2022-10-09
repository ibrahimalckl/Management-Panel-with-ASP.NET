using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

namespace _1912901060_Odev4
{
    public partial class Iletisim : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblGuvenlik.Text = UyeDetay.KodUret();               
            }
            
        }

        protected void btnGonder_Click(object sender, EventArgs e)
        {
            
            if (lblGuvenlik.Text == txtGuvenlik.Text)
            {
                OleDbCommand cmd = VeriTabani.KomutOlustur("insert into iletisim (adsoyad, eposta, konu, metin)" +
                "values (@adsoyad, @eposta, @konu, @metin)");

                cmd.Parameters.AddWithValue("@adsoyad", txtIAdSoyad.Text);
                cmd.Parameters.AddWithValue("@eposta", txtIEPosta.Text);
                cmd.Parameters.AddWithValue("@konu", txtIKonu.Text);
                cmd.Parameters.AddWithValue("@metin", txtIMetin.Text);

                VeriTabani.KomutCalistir(cmd);

                lblUyari.Text = "Mesaj başarıyla gönderildi.";
                btnGonder.Visible = false;
            }
            else
            {
                lblUyari.Text = "Güvenlik sözcüğü yanlış.";
            }
        }
    }
}