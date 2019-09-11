using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Inventory_System
{
    public partial class PurchasingModule : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbMainConnectionString"].ConnectionString);

        List<cInventory> listInventory;
        List<cPurchase> listPurchase;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                txtDate.Attributes["min"] = DateTime.Now.ToString("yyyy-MM-dd");
                txtDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
                txtItemDeliveryDate.Attributes["min"] = DateTime.Now.ToString("yyyy-MM-dd");
                txtItemExpirationDate.Attributes["min"] = DateTime.Now.ToString("yyyy-MM-dd");
                btn_Delete.Enabled = false;
                FillGridView();
                string strName = null;
                strName = Request.QueryString["ID"];
                if (strName != null && strName != string.Empty)
                {
                    if (con.State == ConnectionState.Closed)
                        con.Open();
                    SqlDataAdapter sqlDa = new SqlDataAdapter("ItemViewByName", con);
                    sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                    sqlDa.SelectCommand.Parameters.AddWithValue("@ItemName", strName);
                    DataTable dt = new DataTable();
                    sqlDa.Fill(dt);
                    gridViewPurchase.DataBind();
                    con.Close();

                    txtPurchaseID.Text = "0";//strID;
                    txtItemName.Text = strName;
                    dDlistCategory.SelectedValue = dt.Rows[0]["ItemType"].ToString();
                    txtItemQuantity.Text = (Convert.ToInt32(dt.Rows[0]["OptimalLevel"].ToString()) -  Convert.ToInt32(dt.Rows[0]["ItemQuantity"].ToString())).ToString() ;
                    txtSupplierName.Text = dt.Rows[0]["ItemSupplier"].ToString();
                    txtItemDeliveryDate.Text = dt.Rows[0]["ItemDeliveryDate"].ToString();
                    txtItemExpirationDate.Text = dt.Rows[0]["ItemExpirationDate"].ToString();
                    txtItemUnit.Text = dt.Rows[0]["ItemUnit"].ToString();
                    btnSave_Click(sender, e);
                }

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

        class cInventory
        {
            public string ItemName { get; set; }
        }
        public DataSet GetDataSet(string query)
        {
            DataSet ds = new DataSet();

            con.Open();
            var dbCmd = new SqlCommand(query, con);
            var dbDataAdp = new SqlDataAdapter(dbCmd);
            dbDataAdp.Fill(ds, "Temp");
            con.Close();
            return ds;
        }
        public void listInventoryLoad(string strQuery)
        {
            DataTable dt = new DataTable();
            dt = GetDataSet(strQuery).Tables["Temp"];
            if (dt.Rows.Count > 0)
            {
                listInventory = new List<cInventory>();
                listInventory.Clear();

                foreach (DataRow dr in dt.Rows)
                {
                    listInventory.Add(new cInventory
                    {
                        ItemName = dr["ItemName"].ToString()
                    });
                }
            }
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
            txtItemPrice.Text = "";
            txtTotalPrice.Text = "";
            txtItemDeliveryDate.Text = "";
            txtItemExpirationDate.Text = "";
            txtItemUnit.Text = "";
            lblSuccessMessage.Text = "";
            lblErrorMessage.Text = "";
            btn_Delete.Enabled = false;

        }

        protected void lnk_Click(object sender, EventArgs e)
        {
            int PurchaseID = Convert.ToInt32((sender as LinkButton).CommandArgument);

            //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + PurchaseID + "');", true);

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
            txtItemUnit.Text = dt.Rows[0]["ItemUnit"].ToString();
            txtSupplierName.Text = dt.Rows[0]["SupplierName"].ToString();
            txtShippedBy.Text = dt.Rows[0]["ShippedBy"].ToString();
            txtTerms.Text = dt.Rows[0]["Terms"].ToString();
            txtAddress.Text = dt.Rows[0]["Address"].ToString();
            txtNotes.Text = dt.Rows[0]["Notes"].ToString();
            txtDate.Text = dt.Rows[0]["Date"].ToString();
            txtItemPrice.Text = dt.Rows[0]["ItemPrice"].ToString();
            txtTotalPrice.Text = dt.Rows[0]["TotalPrice"].ToString();
            txtItemDeliveryDate.Text = dt.Rows[0]["ItemDeliveryDate"].ToString();
            txtItemExpirationDate.Text = dt.Rows[0]["ItemExpirationDate"].ToString();
            btnSave.Text = "Update";
            btn_Delete.Enabled = true;
            enableReceive(true);
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
                cmd.Parameters.AddWithValue("@ItemUnit", txtItemUnit.Text.Trim());
                cmd.Parameters.AddWithValue("@SupplierName", txtSupplierName.Text.Trim());
                cmd.Parameters.AddWithValue("@ShippedBy", txtShippedBy.Text.Trim());
                cmd.Parameters.AddWithValue("@Terms", txtTerms.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@Notes", txtNotes.Text.Trim());
                cmd.Parameters.AddWithValue("@Date", txtDate.Text.Trim());
                cmd.Parameters.AddWithValue("@ItemPrice", txtItemPrice.Text.Trim());
                cmd.Parameters.AddWithValue("@TotalPrice", txtTotalPrice.Text.Trim());
                cmd.Parameters.AddWithValue("@ItemDeliveryDate", txtItemDeliveryDate.Text.Trim());
                cmd.Parameters.AddWithValue("@ItemExpirationDate", txtItemExpirationDate.Text.Trim());
                cmd.Parameters.AddWithValue("@Status", "");
                cmd.ExecuteNonQuery();

                con.Close();

                txtItemName.Text = string.Empty;
                dDlistCategory.Text = string.Empty;
                txtItemQuantity.Text = string.Empty;
                txtItemUnit.Text = string.Empty;
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
                    string Message = "You have successfully added a record!";
                    string MsgType = "Success";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + MsgType + "');", true);
                }
                else
                {
                    lblSuccessMessage.Text = "Record has been updated!";
                }

                txtPurchaseID.Text = string.Empty;
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

        protected void btnReceived_Click(object sender, EventArgs e)
        {
             
            if (con.State == ConnectionState.Closed)
                con.Open();

            SqlDataAdapter sqlItem = new SqlDataAdapter("ItemViewAll", con);
            sqlItem.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dtItem = new DataTable();
            sqlItem.Fill(dtItem);

            bool isUpdateSuccess = false;
            foreach (DataRow dtIt in dtItem.Rows)
            {
                if (txtItemName.Text.ToLower() == dtIt["ItemName"].ToString().ToLower())
                {
                    string strCurrQuantity = null;
                    strCurrQuantity = (Convert.ToInt32(txtItemQuantity.Text.Trim()) + Convert.ToInt32(dtIt["ItemQuantity"].ToString())).ToString();

                    SqlCommand cmd = new SqlCommand("InventoryUpdateQuantity", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@ItemID", dtIt["ItemID"].ToString());
                    cmd.Parameters.AddWithValue("@ItemName", txtItemName.Text.Trim());
                    cmd.Parameters.AddWithValue("@ItemQuantity", strCurrQuantity);
                    cmd.ExecuteNonQuery();
                    executeCommand("UPDATE tblPurchaseOrder SET Status = 'Received' WHERE PurchaseID = " + txtPurchaseID.Text.Trim());
                    isUpdateSuccess = true;
                    break;
                }

            }
            if (isUpdateSuccess == false)
            {
                SqlCommand cmds = new SqlCommand("InventoryInsertQuantity", con);
                cmds.CommandType = CommandType.StoredProcedure;
                cmds.Parameters.AddWithValue("@ItemName", txtItemName.Text);
                cmds.Parameters.AddWithValue("@ItemType", dDlistCategory.SelectedItem.Text);
                cmds.Parameters.AddWithValue("@ItemQuantity", txtItemQuantity.Text);
                cmds.Parameters.AddWithValue("@ItemSupplier", txtSupplierName.Text);
                cmds.Parameters.AddWithValue("@ItemDeliveryDate", txtItemDeliveryDate.Text);
                cmds.Parameters.AddWithValue("@ItemExpirationDate", txtItemExpirationDate.Text);
                cmds.ExecuteNonQuery();
                executeCommand("UPDATE tblPurchaseOrder SET Status = 'Received' WHERE PurchaseID = " + txtPurchaseID.Text.Trim());

            }
            enableReceive(false);
            con.Close();
            FillGridView();
        }

        public void executeCommand(string sqlQuery)
        {
            SqlCommand command;
            command = new SqlCommand(sqlQuery, con);
            command.ExecuteNonQuery();
            command.Dispose();
        }

        public void enableReceive(bool isEnabled)
        {
            if (isEnabled == true)
            {
                listPurchaseView("SELECT * FROM tblPurchaseOrder");
                if (con.State == ConnectionState.Closed)
                    con.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("PurchaseViewAll", con);
                sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable dt = new DataTable();
                sqlDa.Fill(dt);

                foreach (DataRow dr in dt.Rows)
                {
                    foreach (cPurchase c in listPurchase)
                    {
                        if (c.Status == "Received" && txtPurchaseID.Text != "")
                        {
                            btnReceived.Enabled = false;
                        }
                        else
                        {
                            btnReceived.Enabled = true;
                        }
                    }
                }
            }
        }

        public void listPurchaseView(string strQuery)
        {
            DataTable dt = new DataTable();
            dt = GetDataSet(strQuery).Tables["Temp"];
            if (dt.Rows.Count > 0)
            {
                listPurchase = new List<cPurchase>();
                listPurchase.Clear();

                foreach (DataRow dr in dt.Rows)
                {
                    listPurchase.Add(new cPurchase
                    {
                        Status = dr["Status"].ToString(),
                    });
                }
            }
        }

        class cPurchase
        {
            public string Status { get; set; }
        }

     

       
    }
}