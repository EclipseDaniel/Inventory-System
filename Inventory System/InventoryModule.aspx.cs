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
    public partial class InventoryModule : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=.;Initial Catalog=dbMain;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btn_Delete.Enabled = false;
                //FillGridView();
            }
        }

        public void FillGridView()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("ItemViewAll", con);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            sqlDa.Fill(dt);
            con.Close();
            gridViewItem.DataSource = dt;
            gridViewItem.DataBind();
        }

        public void Clear()
        {
            txtItemNo.Text = "";
            txtItemName.Text = "";
            txtItemName.Text = "";
            ddlistCategory.Text = "";
            txtItemQuantity.Text = "";
            ddListStatus.Text = "";
            txtSupplierItem.Text = "";
            txtItemDeliveryDate.Text = "";
            txtItemExpirationDate.Text = "";
            lblSuccessMessage.Text = "";
            lblErrorMessage.Text = "";
            btn_Delete.Enabled = false;
        }

        protected void lnk_Click(object sender, EventArgs e)
        {
            int ItemID = Convert.ToInt32((sender as LinkButton).CommandArgument);

            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + ItemID + "');", true);

            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("ItemViewByID", con);

            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@ItemID", ItemID);
            DataTable dt = new DataTable();
            sqlDa.Fill(dt);
            con.Close();

            txtItemNo.Text = ItemID.ToString();
            txtItemName.Text = dt.Rows[0]["ItemName"].ToString();
            ddlistCategory.SelectedValue = dt.Rows[0]["ItemType"].ToString();
            txtItemQuantity.Text = dt.Rows[0]["ItemQuantity"].ToString();
            ddListStatus.SelectedValue = dt.Rows[0]["ItemStatus"].ToString();
            txtSupplierItem.Text = dt.Rows[0]["ItemSupplier"].ToString();
            txtItemDeliveryDate.Text = dt.Rows[0]["ItemDeliveryDate"].ToString();
            txtItemExpirationDate.Text = dt.Rows[0]["ItemExpirationDate"].ToString();

            btnSave.Text = "Update";
            btn_Delete.Enabled = true;

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

        }

        protected void btn_Delete_Click(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlCommand sqlCmd = new SqlCommand("ItemDeleteByID", con);

            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@ItemID", Convert.ToInt32(txtItemNo.Text));
            sqlCmd.ExecuteNonQuery();
            con.Close();
            Clear();

            FillGridView();

            lblSuccessMessage.Text = "Deleted Successfully";
        }

        protected void btn_Clear_Click(object sender, EventArgs e)
        {
            Clear();
        }
    }
}