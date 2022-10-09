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
    public partial class UyeDetay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblGuvenlik.Text = KodUret();

                if (Session["DetayUyeNo"] == null) //Yeni uyelik
                {
                    //Kod yazmaya gerek yok. Sayfa ilk yuklenirken zaten bos yani bilgi doldurulmamis halde geliyor.
                    btnGuncelle.Visible = false;
                }
                else if (Session["DetayUyeNo"].ToString() == "0") //Yeni uyelik
                {
                    //Kod yazmaya gerek yok. Sayfa ilk yuklenirken zaten bos yani bilgi doldurulmamis halde geliyor.
                    btnGuncelle.Visible = false;
                }
                else
                {
                    btnUyeEkle.Visible = false;
                    DataTable dt = VeriTabani.veriGetir(
                        "select * from kullanici where uyeNo = " + Session["DetayUyeNo"].ToString());
                    if (dt.Rows.Count > 0)
                    {
                        lblUyeNo.Text = dt.Rows[0]["uyeNo"].ToString();
                        txtKullaniciAdi.Text = dt.Rows[0]["kullaniciAdi"].ToString();
                        txtParola.Text = dt.Rows[0]["parola"].ToString();
                        txtParolaTekrar.Text = dt.Rows[0]["parola"].ToString();
                        txtAdi.Text = dt.Rows[0]["adi"].ToString();
                        txtSoyadi.Text = dt.Rows[0]["soyadi"].ToString();
                        txtePosta.Text = dt.Rows[0]["eposta"].ToString();
                        drpYetki.SelectedValue = dt.Rows[0]["yetki"].ToString();
                        
                        if (Convert.ToBoolean(dt.Rows[0]["silindi"]))
                        {
                            lblUyari.Text = "BU ÜYE SİLİNMİŞTİR.";
                        }
                    }
                }
                if (Session["Yetki"] == null) //Giris yapilmamis
                {
                    drpYetki.SelectedValue = "2";
                    drpYetki.Enabled = false;
                }
                else if (Session["Yetki"].ToString() == "1") //Yonetici
                {
                    //Tum bilgileri degistirilebilir
                    btnUyeSil.Visible = true;
                }
                else //Kullanici
                {
                    drpYetki.Enabled = false;
                }
            }
        }
        public static string KodUret()
        {
            Random r = new Random();
            return r.Next(10000, 99999).ToString();
        }

        protected void btnUyeEkle_Click(object sender, EventArgs e)
        {
            if (lblGuvenlik.Text == txtGuvenlik.Text)
            {
                OleDbCommand cmd = VeriTabani.KomutOlustur("insert into kullanici (kullaniciAdi, parola, adi, soyadi, eposta, yetki)" +
                    "values (@kullaniciAdi, @parola, @adi, @soyadi, @eposta, @yetki)");

                cmd.Parameters.AddWithValue("@kullaniciAdi", txtKullaniciAdi.Text);
                cmd.Parameters.AddWithValue("@parola", txtParola.Text);
                cmd.Parameters.AddWithValue("@adi", txtAdi.Text);
                cmd.Parameters.AddWithValue("@soyadi", txtSoyadi.Text);
                cmd.Parameters.AddWithValue("@eposta", txtePosta.Text);
                cmd.Parameters.AddWithValue("@yetki", drpYetki.Text);

                VeriTabani.KomutCalistir(cmd);

                lblUyari.Text = "Yeni üyelik başarıyla yapıldı.";
            }
            else
            {
                lblUyari.Text = "Güvenlik sözcüğü yanlış.";
            }
        }

        protected void btnGuncelle_Click(object sender, EventArgs e)
        {
            if (lblGuvenlik.Text == txtGuvenlik.Text)
            {
                OleDbCommand cmd = VeriTabani.KomutOlustur("update kullanici set kullaniciAdi = @kullaniciAdi, parola = @parola, adi = @adi, " +
                    "soyadi = @soyadi, eposta = @eposta, yetki = @yetki where uyeNo = @uyeNo");

                cmd.Parameters.AddWithValue("@kullaniciAdi", txtKullaniciAdi.Text);
                cmd.Parameters.AddWithValue("@parola", txtParola.Text);
                cmd.Parameters.AddWithValue("@adi", txtAdi.Text);
                cmd.Parameters.AddWithValue("@soyadi", txtSoyadi.Text);
                cmd.Parameters.AddWithValue("@eposta", txtePosta.Text);
                cmd.Parameters.AddWithValue("@yetki", drpYetki.Text);

                VeriTabani.KomutCalistir(cmd);

                lblUyari.Text = "Üyelik bilgileri başarıyla güncellendi";
            }
            else
            {
                lblUyari.Text = "Güvenlik sözcüğü yanlış.";
            }
        }

        protected void btnAnaSayfa_Click(object sender, EventArgs e)
        {
            Session["DetayUyeNo"] = "0";
            Response.Redirect("Default.aspx");
        }

        protected void btnUyeSil_Click(object sender, EventArgs e)
        {
            OleDbCommand cmd = VeriTabani.KomutOlustur("update kullanici set silindi = true where uyeNo = @uyeNo");
            cmd.Parameters.AddWithValue("@uyeNo", lblUyeNo.Text);
            VeriTabani.KomutCalistir(cmd);

            lblUyari.Text = "Kullanıcı başarıyla silinmiştir.";

            btnUyeEkle.Enabled = false;
            btnGuncelle.Enabled = false;
            btnUyeSil.Enabled = false;
        }
    }
}