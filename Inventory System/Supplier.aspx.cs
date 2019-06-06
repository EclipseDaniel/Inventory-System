using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventory_System
{
    public partial class Supplier : System.Web.UI.Page
    {
        DataTable dt; 
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                dt = new DataTable();
                DataColumn col = new DataColumn();

                col = new DataColumn("SupplierName");
                dt.Columns.Add(col);

                col = new DataColumn("SupplierPerson");
                dt.Columns.Add(col);

                col = new DataColumn("SupplierContact");
                dt.Columns.Add(col);

                col = new DataColumn("SupplierAddress");
                dt.Columns.Add(col);

                col = new DataColumn("SupplierItem");
                dt.Columns.Add(col);

                col = new DataColumn("ItemPrice");
                dt.Columns.Add(col);

                col = new DataColumn("ItemCategory");
                dt.Columns.Add(col);

                DataRow dr = dt.NewRow();

                dr["SupplierName"] = "Supplier1";
                dr["SupplierPerson"] = "Eldon";
                dr["SupplierContact"] = "123142";
                dr["SupplierAddress"] = "Ilalim ng Tulay";
                dr["SupplierItem"] = "Shabu";
                dr["ItemPrice"] = "1000000";
                dr["ItemCategory"] = "Drugs";

                dt.Rows.Add(dr);

                gridViewSupplier.DataSource = dt;
                gridViewSupplier.DataBind();
            }
        }

        
    }
}