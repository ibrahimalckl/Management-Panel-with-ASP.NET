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
    public partial class UyeGiris : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Yetki isminde Session tanımlanmışsa üye girişi yapılmıştır.
            //Yetki isimli Session değişkeni tanımlandıysa MultiView 2. view aktif hale getirilir.
            //ve kullanıcının adı ve soyadı yazdırılır.
            if (Session["yetki"] != null)
            {
                MultiView1.ActiveViewIndex = 1;
                lblAdSoyad.Text = Session["adSoyad"].ToString();
            }
            else
            {
                MultiView1.ActiveViewIndex = 0;
            }
        }

        protected void btnGiris_Click(object sender, EventArgs e)
        {
            DataTable dt = VeriTabani.veriGetir("select * from kullanici where silindi = false and kullaniciAdi = '" + txtKullaniciAdi.Text + "'");

            if (dt.Rows.Count == 0) //Kullanıcı veri tabanında yoktur.
            {
                txtKullaniciAdi.Text = "";
                txtParola.Text = "";
            }
            else //Kullanıcı adı veri tabanında vardır.
            {
                if (txtParola.Text == dt.Rows[0]["parola"].ToString()) //Kullanıcı parolası veri tabanındaki ile aynı.
                {
                    Session["uyeNo"] = dt.Rows[0]["uyeNo"];
                    Session["adSoyad"] = dt.Rows[0]["adi"].ToString() + " " + dt.Rows[0]["soyadi"].ToString();
                    Session["yetki"] = dt.Rows[0]["yetki"];
                    MultiView1.ActiveViewIndex = 1;
                    lblAdSoyad.Text = Session["adSoyad"].ToString();
                    Response.Redirect("Default.aspx");
                }
                else //Kullanıcı parolası hatalı girildi.
                {
                    txtKullaniciAdi.Text = "";
                    txtParola.Text = "";
                }
            }
        }

        protected void btnUnuttum_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }

        protected void btnYeniUye_Click(object sender, EventArgs e)
        {
            Session["DetayUyeNo"] = "0";
            Response.Redirect("UyeDetay.aspx");
        }

        protected void btnOturumuKapat_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            txtKullaniciAdi.Text = "";
            txtParola.Text = "";
            MultiView1.ActiveViewIndex = 0;
            Response.Redirect("Default.aspx");
        }

        protected void btnParolaGonder_Click(object sender, EventArgs e)
        {
            //E-posta ile parola yenileme linki gonderilir.
        }

        protected void btnUyeBilgiGoster_Click(object sender, EventArgs e)
        {
            //Uye detay sayfasina, detaylari gosterilecek uyenin uyeNosunu bir session degiskene atiyoruz.
            Session["DetayUyeNo"] = Session["uyeNo"];
            Response.Redirect("UyeDetay.aspx");
        }
    }
}