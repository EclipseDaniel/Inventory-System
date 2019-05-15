using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


namespace Inventory_System
{
    public partial class Supplier : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(local)\AACRSQLEXPRESS; Initial Catalog=dbMain; Integrated Security=true;");
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
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SupplierCreateOrUpdate", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SupplierID", (hfContactID.Value = "" ? 0 : Convert.ToInt32(hfContactID.Value)));
                cmd.Parameters.AddWithValue("@SupplierName", txtSupplierName.Text.Trim());
                cmd.Parameters.AddWithValue("@SupplierContactPerson", txtSupplierContactPerson.Text.Trim());
                cmd.Parameters.AddWithValue("@SupplierContactNumber", txtContactNo.Text.Trim());
                cmd.Parameters.AddWithValue("@SupplierAddress", txtSupplierAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@SupplierItem", txtSupplierItem.Text.Trim());
                cmd.Parameters.AddWithValue("@Category", txtItemCategory.Text.Trim());
                cmd.Parameters.AddWithValue("@Price", txtItemPrice.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                //Clear();
                if (hfContactID.Value = "")
                    lblSuccessMessage.Text = "You have successfully added a record!";
                else
                    lblSuccessMessage.Text = "Record has been updated!";
                    FillGridView();
            }
        }
        public void FillGridView()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("SupplierViewAll", con);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.Fill(dt);
            con.Close();
            gridViewSupplier.DataSource = dt;
            gridViewSupplier.DataBind();

        }
    }
}