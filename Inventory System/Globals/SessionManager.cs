using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace Inventory_System.Globals
{
    public static class SessionManager
    {

        public static string UserName
        {
            get
            {
                return (string)HttpContext.Current.Session["UserName"];
            }
            set
            {
                HttpContext.Current.Session["UserName"]  = value;
            }
        }

        public static string UserLevel
        {
            get
            {
                //return "" if there is no userrole
                return HttpContext.Current.Session["UserLevel"] != null ? HttpContext.Current.Session["UserLevel"].ToString() : "";
            }
            set
            {
                HttpContext.Current.Session["UserLevel"] = value;
            }
        }

    }
}