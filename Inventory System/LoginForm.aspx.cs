using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Inventory_System
{
    public partial class LoginForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Visible = false;

        }

        protected void btn_login_Click(object sender, EventArgs e)
        {

        }

        protected void btn_Clear_Click(object sender, EventArgs e)
        {
            clear();
        }

        public void clear()
        {
            tbox_UserName.Text = "";
            tbox_Password.Text = "";
        }
    }
}