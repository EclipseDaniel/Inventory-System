using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Inventory_System.Globals;

namespace Inventory_System
{
    public partial class InventoryModule : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbMainConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                //Check User role here
                if (SessionManager.UserLevel == "Admin")
                {
                    //Insert Code Here
                }
                else
                {
                    //Insert Code Here

                    //Disable Controls
                    GlobalFunctions.DisableControls(this.pnlPage);

                    //Prompt user
                    GlobalFunctions.ShowPopUpMsg(this, "You need admin rights to have full access to this page." 
                                                        + Environment.NewLine + 
                                                        "This page is set to read-only.");
                }



                btn_Delete.Enabled = false;
                FillGridView();
                FillGridViewCritical();
                criticalLevel();
                FillGridViewExpiration();
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
            txtItemNo.Text = string.Empty;
            txtItemName.Text = string.Empty;
            txtItemName.Text = string.Empty;
            ddlistCategory.Text = string.Empty;
            txtItemQuantity.Text = string.Empty;
            ddListStatus.Text = string.Empty;
            txtSupplierItem.Text = string.Empty;
            txtItemDeliveryDate.Text = string.Empty;
            txtItemExpirationDate.Text = string.Empty;
            txtItemUnit.Text = string.Empty;
            txtCriticalLevel.Text = string.Empty;
            txtOptimalLevel.Text = string.Empty;
            lblSuccessMessage.Text = string.Empty;
            lblErrorMessage.Text = string.Empty;
            btn_Delete.Enabled = false;
        }

        protected void lnk_Click(object sender, EventArgs e)
        {
            int ItemID = Convert.ToInt32((sender as LinkButton).CommandArgument);

            //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + ItemID + "');", true);

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
            txtItemUnit.Text = dt.Rows[0]["ItemUnit"].ToString();
            txtCriticalLevel.Text = dt.Rows[0]["CriticalLevel"].ToString();
            txtOptimalLevel.Text = dt.Rows[0]["OptimalLevel"].ToString();

            btnSave.Text = "Update";
            btn_Delete.Enabled = true;

            Session["ID"] = dt.Rows[0]["ItemName"].ToString(); 
            Response.Redirect("PurchasingModule.aspx?ID=" + Session["ID"]);

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("ItemViewAll", con);
                sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable dt = new DataTable();
                sqlDa.Fill(dt);
                string strCurrNumber = null;
                string strQuantity = null;
                foreach (DataRow dr in dt.Rows)
                {
                    if (dr["ItemName"].ToString().ToLower() == txtItemName.Text.ToLower())
                    {
                        strCurrNumber = dr["ItemID"].ToString();
                        strQuantity = (Convert.ToInt32(txtItemQuantity.Text) + Convert.ToInt32(dr["ItemQuantity"])).ToString();
                        break;
                    }
                }




                SqlCommand cmd = new SqlCommand("ItemCreateOrUpdate", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ItemID", String.IsNullOrEmpty(strCurrNumber) ? 0 : Convert.ToInt32(strCurrNumber));
                cmd.Parameters.AddWithValue("@ItemName", txtItemName.Text.Trim());
                cmd.Parameters.AddWithValue("@ItemType", ddlistCategory.SelectedValue.Trim());
                cmd.Parameters.AddWithValue("@ItemQuantity", String.IsNullOrEmpty(strQuantity) ? txtItemQuantity.Text.Trim() : strQuantity);  
                cmd.Parameters.AddWithValue("@ItemStatus", ddListStatus.SelectedValue.Trim());
                cmd.Parameters.AddWithValue("@ItemSupplier", txtSupplierItem.Text.Trim());
                cmd.Parameters.AddWithValue("@ItemDeliveryDate", txtItemDeliveryDate.Text.Trim());
                cmd.Parameters.AddWithValue("@ItemExpirationDate", txtItemExpirationDate.Text.Trim());
                cmd.Parameters.AddWithValue("@ItemUnit", txtItemUnit.Text.Trim());
                cmd.Parameters.AddWithValue("@CriticalLevel", txtCriticalLevel.Text.Trim());
                cmd.Parameters.AddWithValue("@OptimalLevel", txtOptimalLevel.Text.Trim());
                cmd.Parameters.AddWithValue("@DateModified", DateTime.UtcNow.ToShortDateString());
                cmd.ExecuteNonQuery();
                con.Close();

                txtItemNo.Text = string.Empty;
                txtItemName.Text = string.Empty;
                ddlistCategory.Text = string.Empty;
                txtItemQuantity.Text = string.Empty;
                ddListStatus.Text = string.Empty;
                txtSupplierItem.Text = string.Empty;
                txtItemDeliveryDate.Text = string.Empty;
                txtItemExpirationDate.Text = string.Empty;
                txtItemUnit.Text = string.Empty;

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

        protected void checkInventory_Click(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            string quantity;
            quantity = txtCheckQuantity.Text;
            string checkQuantity = $"SELECT * FROM tblItemDetails WHERE ItemQuantity <= {quantity}";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = checkQuantity;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            gridViewItem.DataSource = ds;
            gridViewItem.DataBind();
            con.Close();
        }

        protected void criticalLevel()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("ItemWithCriticalLevel", con);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            sqlDa.Fill(dt);

            foreach (DataRow dr in dt.Rows)
            {

                if (dr["CriticalLevel"].ToString() == "Critical")
                {
                    Response.Write($"<script>alert('Ingredient is in critical level')</script>");
                }

            }
        }

        public void FillGridViewCritical()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("ItemWithCriticalOnly", con);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            sqlDa.Fill(dt);
            con.Close();
            gridViewCritical.DataSource = dt;
            gridViewCritical.DataBind();
        }

    

        public void FillGridViewExpiration()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("ItemWithExpiration", con);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            sqlDa.Fill(dt);
            con.Close();
            gridViewItemExpiration.DataSource = dt;
            gridViewItemExpiration.DataBind();
        }

        protected void lnk2_Click(object sender, EventArgs e)
        {
            int ItemID = Convert.ToInt32((sender as LinkButton).CommandArgument);


            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("ItemViewByID", con);

            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@ItemID", ItemID);
            DataTable dt = new DataTable();
            sqlDa.Fill(dt);
            con.Close();

            txtItemID.Text = ItemID.ToString();
            txtItemName.Text = dt.Rows[0]["ItemName"].ToString();
            ddlistCategory.SelectedValue = dt.Rows[0]["ItemType"].ToString();
            txtItemQuantity.Text = dt.Rows[0]["ItemQuantity"].ToString();
            txtItemUnit.Text = dt.Rows[0]["ItemUnit"].ToString();
            ddListStatus.Text = dt.Rows[0]["ItemStatus"].ToString();
            txtCriticalLevel.Text = dt.Rows[0]["CriticalLevel"].ToString();
            txtOptimalLevel.Text = dt.Rows[0]["OptimalLevel"].ToString();
            txtItemDeliveryDate.Text = dt.Rows[0]["ItemDeliveryDate"].ToString();
            txtItemExpirationDate.Text = dt.Rows[0]["ItemExpirationDate"].ToString();
            btnSave.Text = "Update";
            btn_Delete.Enabled = true;

        }

        protected void gridViewCritical_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("ItemWithCriticalOnly", con);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            sqlDa.Fill(dt);
            con.Close();
            gridViewCritical.PageIndex = e.NewPageIndex;
            gridViewCritical.DataSource = dt;
            gridViewCritical.DataBind();
        }

        protected void gridViewItem_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("ItemViewAll", con);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            sqlDa.Fill(dt);
            con.Close();
            gridViewItem.PageIndex = e.NewPageIndex;
            gridViewItem.DataSource = dt;
            gridViewItem.DataBind();
        }

        protected void gridViewItemExpiration_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("ItemWithExpiration", con);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            sqlDa.Fill(dt);
            con.Close();
            gridViewItemExpiration.PageIndex = e.NewPageIndex;
            gridViewItemExpiration.DataSource = dt;
            gridViewItemExpiration.DataBind();
        }
    }
}