using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;

namespace _1912901060_Odev4
{
    public static class VeriTabani
    {
        public static OleDbConnection con;

        public static OleDbConnection Con 
        {
            get
            {
                if (con == null)
                {
                    con = new OleDbConnection(
                        "Provider = Microsoft.Jet.OLEDB.4.0; Data Source = |DataDirectory|/vt.mdb");
                }
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                return con;
            }

        }

        public static DataTable veriGetir(string sql)
        {
            OleDbDataAdapter da = new OleDbDataAdapter(sql, Con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        public static OleDbCommand KomutOlustur(string sql) 
        {
            OleDbCommand cmd = new OleDbCommand(sql, Con);
            return cmd;
        }

        public static int KomutCalistir(OleDbCommand cmd) 
        {
            int s = cmd.ExecuteNonQuery();
            return s;

        }

    }
}