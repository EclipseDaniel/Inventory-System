using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Web;
using System.Web.UI;

namespace Inventory_System.Globals
{
    public static class GlobalFunctions
    {

        public static void DisableControls(System.Web.UI.Control control)
        {
            foreach (System.Web.UI.Control c in control.Controls)
            {
                // Get the Enabled property by reflection.
                Type type = c.GetType();
                PropertyInfo prop = type.GetProperty("Enabled");

                // Set it to False to disable the control.
                if (prop != null)
                {
                    prop.SetValue(c, false, null);
                }

                // Recurse into child controls.
                if (c.Controls.Count > 0)
                {
                    DisableControls(c);
                }
            }
        }


        public static void ShowPopUpMsg(System.Web.UI.Page sender, string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(sender.Page, sender.GetType(), "showalert", sb.ToString(), true);
        }
    }
}