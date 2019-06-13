using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventory_System
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Visible = false;
        }

        protected void btn_Login_Click(object sender, EventArgs e)
        {

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

    }
}