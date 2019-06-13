using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventory_System
{
    public partial class ProdMod : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btn_Add.Enabled = false;
            btn_Cancel.Enabled = false;
            btn_Next.Enabled = false;

            if (!IsPostBack)
            {
                if (txtbox_DishName.Text=="")
                {
                    btn_Add.Enabled = true;
                }
            }

            
            
        }

        protected void btn_Next_Click(object sender, EventArgs e)
        {

        }

        protected void btn_Cancel_Click(object sender, EventArgs e)
        {

        }

        protected void btn_Add_Click(object sender, EventArgs e)
        {

        }
    }
}