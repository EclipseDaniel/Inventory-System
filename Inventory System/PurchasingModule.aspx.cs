﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


namespace Inventory_System
{
    public partial class PurchasingModule : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=PPCA-5253YR6-LX\AACRSQLEXPRESS;Initial Catalog=dbMain;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btn_Delete.Enabled = false;
                FillGridView();
            }

        }
        public void FillGridView()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("PurchaseViewAll", con);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            sqlDa.Fill(dt);
            con.Close();
            gridViewPurchase.DataSource = dt;
            gridViewPurchase.DataBind();
        }

        public void Clear()
        {
            txtPurchaseID.Text = "";
            txtItemName.Text = "";
            dDlistCategory.Text = "";
            txtItemQuantity.Text = "";
            txtSupplierName.Text = "";
            txtShippedBy.Text = "";
            txtTerms.Text = "";
            txtAddress.Text = "";
            txtNotes.Text = "";
            txtDate.Text = "";
            txtItemPrice.Text = "";
            txtTotalPrice.Text = "";
            lblSuccessMessage.Text = "";
            lblErrorMessage.Text = "";
            btn_Delete.Enabled = false;

        }

        protected void lnk_Click(object sender, EventArgs e)
        {
            int PurchaseID = Convert.ToInt32((sender as LinkButton).CommandArgument);

            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + PurchaseID + "');", true);

            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("PurchaseViewByID", con);

            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@PurchaseID", PurchaseID);
            DataTable dt = new DataTable();
            sqlDa.Fill(dt);
            con.Close();

            txtPurchaseID.Text = PurchaseID.ToString();
            txtItemName.Text = dt.Rows[0]["ItemName"].ToString();
            dDlistCategory.SelectedValue = dt.Rows[0]["ItemType"].ToString();
            txtItemQuantity.Text = dt.Rows[0]["ItemQuantity"].ToString();
            txtSupplierName.Text = dt.Rows[0]["SupplierName"].ToString();
            txtShippedBy.Text = dt.Rows[0]["ShippedBy"].ToString();
            txtTerms.Text = dt.Rows[0]["Terms"].ToString();
            txtAddress.Text = dt.Rows[0]["Address"].ToString();
            txtNotes.Text = dt.Rows[0]["Notes"].ToString();
            txtDate.Text = dt.Rows[0]["Date"].ToString();
            txtItemPrice.Text = dt.Rows[0]["Price"].ToString();
            txtTotalPrice.Text = dt.Rows[0]["TotalPrice"].ToString();
            btnSave.Text = "Update";
            btn_Delete.Enabled = true;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("PurchaseCreateOrUpdate", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PurchaseID", (txtPurchaseID.Text == "" ? 0 : Convert.ToInt32(txtPurchaseID.Text)));
                cmd.Parameters.AddWithValue("@ItemName", txtItemName.Text.Trim());
                cmd.Parameters.AddWithValue("@ItemType", dDlistCategory.Text.Trim());
                cmd.Parameters.AddWithValue("@ItemQuantity", txtItemQuantity.Text.Trim());
                cmd.Parameters.AddWithValue("@SupplierName", txtSupplierName.Text.Trim());
                cmd.Parameters.AddWithValue("@ShippedBy", txtShippedBy.Text.Trim());
                cmd.Parameters.AddWithValue("@Terms", txtTerms.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@Notes", txtNotes.Text.Trim());
                cmd.Parameters.AddWithValue("@Date", txtDate.Text.Trim());
                cmd.Parameters.AddWithValue("@Price", txtItemPrice.Text.Trim());
                cmd.Parameters.AddWithValue("@TotalPrice", txtTotalPrice.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();

                txtItemName.Text = string.Empty;
                dDlistCategory.Text = string.Empty;
                txtItemQuantity.Text = string.Empty;
                txtSupplierName.Text = string.Empty;
                txtShippedBy.Text = string.Empty;
                txtTerms.Text = string.Empty;
                txtNotes.Text = string.Empty;
                txtDate.Text = string.Empty;
                txtItemPrice.Text = string.Empty;
                txtTotalPrice.Text = string.Empty;

                string supplierID = txtPurchaseID.Text;
                Clear();

                if (supplierID == "")
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
            SqlCommand sqlCmd = new SqlCommand("PurchaseDeleteByID", con);

            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@PurchaseID", Convert.ToInt32(txtPurchaseID.Text));
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

        
        public void totalPrice()
        {
            string price, quantity;
            price = txtItemPrice.Text;
            quantity = txtItemQuantity.Text;
            int total = Convert.ToInt32(price) * Convert.ToInt32(quantity);
            txtTotalPrice.Text = total.ToString();
        }

        protected void btnCompute_Click(object sender, EventArgs e)
        {
            totalPrice();
        }
    }
}