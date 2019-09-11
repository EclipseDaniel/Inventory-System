using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Inventory_System
{
    public partial class RegisterForm : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbMainConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btn_Login_Click(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("LoginCreateOrUpdate", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@AccountID", (txt_AccountID.Text == "" ? 0 : Convert.ToInt32(txt_AccountID.Text)));
                cmd.Parameters.AddWithValue("@Username", txt_UserName.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txt_Password.Text.Trim());
                cmd.Parameters.AddWithValue("@Firstname", txt_FirstName.Text.Trim());
                cmd.Parameters.AddWithValue("@Lastname", txt_LastName.Text.Trim());
                cmd.Parameters.AddWithValue("@Userlevel", txt_UserRole.Text.Trim());
                cmd.Parameters.AddWithValue("@EmailAddress", txt_Email.Text.Trim());
                cmd.Parameters.AddWithValue("@ContactNumber", txt_ContactNum.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();

                txt_AccountID.Text = string.Empty;
                txt_UserName.Text = string.Empty;
                txt_Password.Text = string.Empty;
                txt_FirstName.Text = string.Empty;
                txt_LastName.Text = string.Empty;
                txt_UserRole.Text = string.Empty;
                txt_Email.Text = string.Empty;
                txt_ContactNum.Text = string.Empty;

                string AccountID = txt_AccountID.Text;
                Clear();

                if (AccountID == "")
                {
                    lblSuccessMessage.Text = "You have successfully added a record!";
                }
                else
                {
                    lblSuccessMessage.Text = "Record has been updated!";
                }
            }
        }
        public void Clear()
        {
            txt_AccountID.Text = "";
            txt_UserName.Text = "";
            txt_Password.Text = "";
            txt_FirstName.Text = "";
            txt_LastName.Text = "";
            txt_UserRole.Text = "";
            txt_Email.Text = "";
            txt_ContactNum.Text = "";
        }
    }
}