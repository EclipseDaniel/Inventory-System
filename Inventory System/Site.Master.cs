using Inventory_System.Globals;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventory_System
{
    public partial class SiteMaster : MasterPage
    {
        public string UserName;
        public string UserRole;
        protected void Page_Load(object sender, EventArgs e)
        {
            UserName = SessionManager.UserName;
            UserRole = SessionManager.UserLevel;
        }
    }
}