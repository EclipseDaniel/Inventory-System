using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Inventory_System
{

    public partial class SupplierDetails : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbMainConnectionString"].ConnectionString);
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
            SqlDataAdapter sqlDa = new SqlDataAdapter("SupplierViewAll", con);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            sqlDa.Fill(dt);
            con.Close();
            gridViewSupplier.DataSource = dt;
            gridViewSupplier.DataBind();

        }

        public void Clear()
        {
            hfSupplierID.Text = "";
            txtSupplierName.Text = "";
            txtSupplierContactPerson.Text = "";
            txtContactNo.Text = "";
            txtSupplierAddress.Text = "";
            txtSupplierItem.Text = "";
            txtItemPrice.Text = "";
            dDlistCategory.Text = "";
            lblSuccessMessage.Text = "";
            lblErrorMessage.Text = "";
            btn_Delete.Enabled = false;

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SupplierCreateOrUpdate", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SupplierID", (hfSupplierID.Text == "" ? 0 : Convert.ToInt32(hfSupplierID.Text)));
                cmd.Parameters.AddWithValue("@SupplierName", txtSupplierName.Text.Trim());
                cmd.Parameters.AddWithValue("@SupplierPerson", txtSupplierContactPerson.Text.Trim());
                cmd.Parameters.AddWithValue("@SupplierContactNumber", txtContactNo.Text.Trim());
                cmd.Parameters.AddWithValue("@SupplierAddress", txtSupplierAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@SupplierItem", txtSupplierItem.Text.Trim());
                cmd.Parameters.AddWithValue("@Price", txtItemPrice.Text.Trim());
                cmd.Parameters.AddWithValue("@Category", dDlistCategory.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();

                txtContactNo.Text = string.Empty;
                dDlistCategory.Text = string.Empty;
                txtItemPrice.Text = string.Empty;
                txtSupplierAddress.Text = string.Empty;
                txtSupplierContactPerson.Text = string.Empty;
                txtSupplierItem.Text = string.Empty;
                txtSupplierName.Text = string.Empty;

                string supplierID = hfSupplierID.Text;
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
            SqlCommand sqlCmd = new SqlCommand("SupplierDeleteByID", con);

            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@SupplierID", Convert.ToInt32(hfSupplierID.Text));
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

        protected void lnk_Click(object sender, EventArgs e)
        {
            int SupplierID = Convert.ToInt32((sender as LinkButton).CommandArgument);

            //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + SupplierID + "');", true);

            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("SupplierViewByID", con);

            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@SupplierID", SupplierID);
            DataTable dt = new DataTable();
            sqlDa.Fill(dt);
            con.Close();

            hfSupplierID.Text = SupplierID.ToString();
            txtSupplierName.Text = dt.Rows[0]["SupplierName"].ToString();
            txtSupplierContactPerson.Text = dt.Rows[0]["SupplierPerson"].ToString();
            txtContactNo.Text = dt.Rows[0]["SupplierContact"].ToString();
            txtSupplierAddress.Text = dt.Rows[0]["SupplierAddress"].ToString();
            txtSupplierItem.Text = dt.Rows[0]["SupplierItem"].ToString();
            txtItemPrice.Text = dt.Rows[0]["ItemPrice"].ToString();
            dDlistCategory.SelectedValue = dt.Rows[0]["ItemCategory"].ToString();

            btnSave.Text = "Update";
            btn_Delete.Enabled = true;
        }
    }
}