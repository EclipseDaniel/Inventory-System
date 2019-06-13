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
    public partial class Inventory : System.Web.UI.Page
    {
        //SqlConnection con = new SqlConnection(@"Data Source=PPCA-5253YR6-LX\AACRSQLEXPRESS;Initial Catalog=dbMain;Integrated Security=True");
        SqlConnection con = new SqlConnection(@"Data Source=.;Initial Catalog=dbMain;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                btnDelete.Enabled = false;
                FillGridView();
            }

            txtItemDeliveryDate.Text = DateTime.Now.ToString("MM-dd-yyyy");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("ItemCreateOrUpdate", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ItemID", (txtItemNo.Text == "" ? 0 : Convert.ToInt32(txtItemNo.Text)));
                cmd.Parameters.AddWithValue("@ItemName", txtItemName.Text.Trim());
                cmd.Parameters.AddWithValue("@ItemType", ddlItemType.Text.Trim());
                cmd.Parameters.AddWithValue("@ItemQuantity", txtItemQuantity.Text.Trim());
                cmd.Parameters.AddWithValue("@ItemStatus", ddlItemStatus.Text.Trim());
                cmd.Parameters.AddWithValue("@ItemSupplier", txtItemSupplier.Text.Trim());
                cmd.Parameters.AddWithValue("@ItemDeliveryDate", txtItemDeliveryDate.Text.Trim());
                cmd.Parameters.AddWithValue("@ItemExpirationDate", txtItemExpirationDate.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();

                txtItemName.Text = string.Empty;
                ddlItemType.Text = string.Empty;
                txtItemQuantity.Text = string.Empty;
                ddlItemStatus.Text = string.Empty;
                txtItemSupplier.Text = string.Empty;
                txtItemDeliveryDate.Text = string.Empty;
                txtItemExpirationDate.Text = string.Empty;

                string itemID = txtItemNo.Text;
                Clear();

                if (itemID == "")
                {
                    lblSuccessMessage.Text = "You have successfully added a record!";
                }
                else
                {
                    lblSuccessMessage.Text = "Record has been updated!";
                }

                FillGridView();
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
            ddlItemType.Text = "";
            txtItemQuantity.Text = "";
            ddlItemStatus.Text = "";
            txtItemSupplier.Text = "";
            txtItemDeliveryDate.Text = "";
            txtItemExpirationDate.Text = "";
            lblSuccessMessage.Text = "";
            lblErrorMessage.Text = "";
            btnDelete.Enabled = false;
        }

        protected void lnk_OnClick(object sender, EventArgs e)
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
            ddlItemType.SelectedValue = dt.Rows[0]["ItemType"].ToString();
            txtItemQuantity.Text = dt.Rows[0]["ItemQuantity"].ToString();
            ddlItemStatus.SelectedValue = dt.Rows[0]["ItemStatus"].ToString();
            txtItemSupplier.Text = dt.Rows[0]["ItemSupplier"].ToString();
            txtItemDeliveryDate.Text = dt.Rows[0]["ItemDeliveryDate"].ToString();
            txtItemExpirationDate.Text = dt.Rows[0]["ItemExpirationDate"].ToString();

            btnSave.Text = "Update";
            btnDelete.Enabled = true;

        }

        protected void btnDelete_Click(object sender, EventArgs e)
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
    }
}