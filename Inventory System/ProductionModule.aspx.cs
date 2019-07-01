using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Inventory_System
{
    public partial class ProductionModule1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=PPCA-5253YR6-LX\AACRSQLEXPRESS;Initial Catalog=dbMain;Integrated Security=True");
        List<cMenu> listMenu;
        List<cOrder> listOrder;
        List<cInventory> listInventory;
        List<cInventoryView> listInventoryView;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                executeCommand("DELETE FROM tblOrderOutput");
                listMenuLoad("SELECT DISTINCT Dish FROM tblMenu");
                ddlMenuList.DataSource = listMenu;
                ddlMenuList.DataTextField = "Dish";
                ddlMenuList.DataBind();
                ddlMenuList.Items.Insert(0, "Select");
            }
        }

        protected void btn_Cancel_Click(object sender, EventArgs e)
        {

        }

        protected void btn_Add_Click(object sender, EventArgs e)
        {
            string strDishSelected = null;
            strDishSelected = ddlMenuList.Text;

            if (con.State == ConnectionState.Closed)
            {
                con.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("OrderViewAll", con);
                sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;

                DataTable dt = new DataTable();
                sqlDa.Fill(dt);

                string strCurrentQuantity = null;

                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        if (ddlMenuList.Text == dr["Dish"].ToString())
                        {
                            txtbox_DishID.Text = dr["MenuID"].ToString();
                            strCurrentQuantity = (Convert.ToInt32(dr["Order"]) + Convert.ToInt32(txtbox_Quantity.Text)).ToString();
                            break;
                        }
                        strCurrentQuantity = Convert.ToInt32(txtbox_Quantity.Text).ToString();
                    }

                }
                else
                {
                    strCurrentQuantity = Convert.ToInt32(txtbox_Quantity.Text).ToString();
                }


                SqlCommand cmd = new SqlCommand("OrderCreateOrUpdate", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MenuID", (txtbox_DishID.Text == "" ? 0 : Convert.ToInt32(txtbox_DishID.Text)));
                cmd.Parameters.AddWithValue("@Dish", ddlMenuList.Text.Trim());
                cmd.Parameters.AddWithValue("@Order", strCurrentQuantity);
                cmd.ExecuteNonQuery();

                con.Close();
                txtbox_DishID.Text = string.Empty;
                FillGridView();
            }
        }

        public void FillGridView()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("OrderViewAll", con);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            sqlDa.Fill(dt);
            con.Close();
            gridOrderedDish.DataSource = dt;
            gridOrderedDish.DataBind();
        }

        protected void ddlMenuList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btn_Proceed_Click(object sender, EventArgs e)
        {
            listOrderLoad("SELECT * FROM tblOrderOutput");

            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("OrderViewByIngredients", con);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            sqlDa.Fill(dt);
            con.Close();
            gridProdMod.DataSource = dt;
            gridProdMod.DataBind();
        }

        protected void btn_ProceedProcess_Click(object sender, EventArgs e)
        {
            listInventoryViewLoad("SELECT * FROM vwInventoryLeft");
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("ItemViewAll", con);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            sqlDa.Fill(dt);

            foreach (DataRow dr in dt.Rows)
            {
                foreach (cInventoryView c in listInventoryView)
                {
                    if (c.ItemID == dr["ItemID"].ToString())
                    {
                        SqlCommand cmd = new SqlCommand("InventoryUpdateQuantity", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ItemID", Convert.ToInt32(c.ItemID));
                        cmd.Parameters.AddWithValue("@ItemQuantity", c.QtyLeft.Trim());
                        cmd.ExecuteNonQuery();
                        break;
                    }
                }
            }

            con.Close();
            Response.Write("Transaction Successful");
        }

        public void executeCommand(string sqlQuery)
        {
            con.Open();
            SqlCommand command;
            command = new SqlCommand(sqlQuery, con);
            command.ExecuteNonQuery();
            command.Dispose();
            con.Close();

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

        public void listMenuLoad(string strQuery)
        {
            DataTable dt = new DataTable();
            dt = GetDataSet(strQuery).Tables["Temp"];
            if (dt.Rows.Count > 0)
            {
                listMenu = new List<cMenu>();
                listMenu.Clear();

                foreach (DataRow dr in dt.Rows)
                {
                    listMenu.Add(new cMenu
                    {
                        Dish = dr["Dish"].ToString()
                    });
                }
            }
        }

        public void listOrderLoad(string strQuery)
        {
            DataTable dt = new DataTable();
            dt = GetDataSet(strQuery).Tables["Temp"];
            if (dt.Rows.Count > 0)
            {
                listOrder = new List<cOrder>();
                listOrder.Clear();

                foreach (DataRow dr in dt.Rows)
                {
                    listOrder.Add(new cOrder
                    {
                        Dish = dr["Dish"].ToString(),
                        Order = dr["Order"].ToString()
                    });
                }
            }
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
                        ItemID = dr["ItemID"].ToString(),
                        ItemName = dr["ItemName"].ToString(),
                        ItemType = dr["ItemType"].ToString(),
                        ItemQuantity = dr["ItemQuantity"].ToString(),
                        ItemStatus = dr["ItemStatus"].ToString(),
                        ItemSupplier = dr["ItemSupplier"].ToString(),
                        ItemDeliveryDate = dr["ItemDeliveryDate"].ToString(),
                        ItemExpirationDate = dr["ItemExpirationDate"].ToString()
                    });
                }
            }
        }

        public void listInventoryViewLoad(string strQuery)
        {
            DataTable dt = new DataTable();
            dt = GetDataSet(strQuery).Tables["Temp"];
            if (dt.Rows.Count > 0)
            {
                listInventoryView = new List<cInventoryView>();
                listInventoryView.Clear();

                foreach (DataRow dr in dt.Rows)
                {
                    listInventoryView.Add(new cInventoryView
                    {
                        ItemID = dr["ItemID"].ToString(),
                        ItemName = dr["ItemName"].ToString(),
                        ItemType = dr["ItemType"].ToString(),
                        QtyLeft = dr["QtyLeft"].ToString(),
                        ItemStatus = dr["ItemStatus"].ToString(),
                        ItemSupplier = dr["ItemSupplier"].ToString(),
                        ItemDeliveryDate = dr["ItemDeliveryDate"].ToString(),
                        ItemExpirationDate = dr["ItemExpirationDate"].ToString()
                    });
                }
            }
        }


        class cMenu
        {
            public string MenuID { get; set; }
            public string Dish { get; set; }
            public string Ingredients { get; set; }
            public string Quantity { get; set; }
        }

        class cOrder
        {
            public string Dish { get; set; }
            public string Order { get; set; }
        }

        class cInventory
        {
            public string ItemID { get; set; }
            public string ItemName { get; set; }
            public string ItemType { get; set; }
            public string ItemQuantity { get; set; }
            public string ItemStatus { get; set; }
            public string ItemSupplier { get; set; }
            public string ItemDeliveryDate { get; set; }
            public string ItemExpirationDate { get; set; }
        }

        class cInventoryView
        {
            public string ItemID { get; set; }
            public string ItemName { get; set; }
            public string ItemType { get; set; }
            public string QtyLeft { get; set; }
            public string ItemStatus { get; set; }
            public string ItemSupplier { get; set; }
            public string ItemDeliveryDate { get; set; }
            public string ItemExpirationDate { get; set; }
        }

        protected void btn_Validate_Click(object sender, EventArgs e)
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
                    btn_PurchaseGood.Enabled = true;
                    btn_ProcessOrder.Enabled = false;
                }
                else
                {
                    btn_PurchaseGood.Enabled = false;
                    btn_ProcessOrder.Enabled = true;
                }

        }
    }
}