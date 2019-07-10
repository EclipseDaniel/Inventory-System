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
    public partial class ReportsOrders : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=PPCA-5253YR6-LX\AACRSQLEXPRESS;Initial Catalog=dbMain;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            dsOrders ds = new dsOrders();
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM tblOrderOutput", con);
            da.Fill(ds.CrystalReportsOrderOutput);
            CrystalReportOrders crptOrders = new CrystalReportOrders();
            crptOrders.SetDataSource(ds);
            CrystalReportViewer1.ReportSource = crptOrders;
        }
    }
}