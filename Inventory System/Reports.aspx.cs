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
    public partial class Reports : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=PPCA-5253YR6-LX\AACRSQLEXPRESS;Initial Catalog=dbMain;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            dsPurchaseOrder ds = new dsPurchaseOrder();
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM tblPurchaseOrder", con);
            da.Fill(ds.CrystalReportsPurchaseOrderView);
            CrystalReportsPurchaseOrder crptPurchaseOrder = new CrystalReportsPurchaseOrder();
            crptPurchaseOrder.SetDataSource(ds);
            CrystalReportViewer1.ReportSource = crptPurchaseOrder;
        }
    }
}