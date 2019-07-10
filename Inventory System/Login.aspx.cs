using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace Inventory_System
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=PPCA-5253YR6-LX\AACRSQLEXPRESS;Initial Catalog=dbMain;Integrated Security=True");
        List<cLogin> listLogin;
        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Visible = false;
        }

        protected void btn_Login_Click(object sender, EventArgs e)
        {
            listLoginView("SELECT * FROM tblLogin");
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("LoginViewAll", con);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            sqlDa.Fill(dt);

            foreach (DataRow dr in dt.Rows)
            {
                foreach (cLogin c in listLogin)
                {
                    if (c.Username == txt_UserName.Text && c.Password == txt_Password.Text)
                    {
                        Session["AccountID"] = txt_UserName.Text;
                        Response.Redirect("~/About.aspx");
                        Session.RemoveAll();
                    }
                    else
                    {
                        ShowPopUpMsg("Incorrect User Credentials");
                    }
                }
            }
        }

        protected void btn_Clear_Click(object sender, EventArgs e)
        {
            clear();
        }

        public void clear()
        {
            txt_Password.Text = "";
            txt_UserName.Text = "";
        }

        public DataSet GetDataSet(string query)
        {
            DataSet ds = new DataSet();

            con.Open();
            var dbCmd = new SqlCommand(query, con);
            var dbDataAdp = new SqlDataAdapter(dbCmd);
            dbDataAdp.Fill(ds, "Temp");

            return ds;
        }
        public void listLoginView(string strQuery)
        {
            DataTable dt = new DataTable();
            dt = GetDataSet(strQuery).Tables["Temp"];
            if (dt.Rows.Count > 0)
            {
                listLogin = new List<cLogin>();
                listLogin.Clear();

                foreach (DataRow dr in dt.Rows)
                {
                    listLogin.Add(new cLogin
                    {
                        AccountID = dr["AccountID"].ToString(),
                        Username = dr["Username"].ToString(),
                        Password = dr["Password"].ToString(),
                        Firstname = dr["Firstname"].ToString(),
                        Lastname = dr["Lastname"].ToString(),
                    });
                }
            }
        }
        class cLogin
        {
            public string AccountID { get; set; }
            public string Username { get; set; }
            public string Password { get; set; }
            public string Firstname { get; set; }
            public string Lastname { get; set; }
        }

        private void ShowPopUpMsg(string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);
        }
    }
}