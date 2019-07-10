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
    public partial class CrystalReportsItemExpired : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=PPCA-5253YR6-LX\AACRSQLEXPRESS;Initial Catalog=dbMain;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            ItemExpired ie = new ItemExpired();
            SqlDataAdapter da = new SqlDataAdapter("SELECT ItemID, ItemName, ItemType, ItemQuantity, ItemStatus, ItemSupplier, ItemDeliveryDate, ItemExpirationDate, ItemUnit, CriticalLevel, OptimalLevel, IIF(CAST(ItemQuantity as int) <= CAST(CriticalLevel as int), 'Critical', IIF(CAST(ItemQuantity as int) >= CAST(OptimalLevel as int), 'Optimal', 'Good')) as ItemLevelStatus, IIF(DATEDIFF(DAY, CONVERT(varchar(10), GETDATE(), 101), CONVERT(varchar(10), CAST(ItemExpirationDate as date), 101)) <= 0, 'Expired', 'Good') as Expiration FROM  dbo.tblItemDetails WHERE IIF(DATEDIFF(DAY, CONVERT(varchar(10), GETDATE(), 101), CONVERT(varchar(10), CAST(ItemExpirationDate as date), 101)) <= 0, 'Expired', 'Good') = 'Expired'", con);
            da.Fill(ie.ItemWithExpiration);
            CrystalReportItemExpired crptItemExpired = new CrystalReportItemExpired();
            crptItemExpired.SetDataSource(ie);
            CrystalReportViewer1.ReportSource = crptItemExpired;
        }
    }
}