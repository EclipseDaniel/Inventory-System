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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }    
        }

        private void FillDishList()
        {
            ddlMenuList.Items.Clear();
            string selectSQL = "SELECT DISTINCT Dish From tblMenu";

            fillDish();


        }

        protected void btn_Cancel_Click(object sender, EventArgs e)
        {

        }

        protected void btn_Add_Click(object sender, EventArgs e)
        {
            
        }

        protected void fillDish()
        {

            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlCommand cmd = new SqlCommand("MenuViewByDish", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            try
            {
                con.Open();
                da.Fill(ds);
                con.Close();
            }
            catch (Exception)
            {

                throw;
            }
            
           
           
            return ds;  
        }

        protected void ddlMenuList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectSQL = "SELECT DISTINCT Dish FROM tblMenu";
            selectSQL = "WHERE MenuID='" + ddlMenuList.SelectedItem.Value + "'";
        }
    }
}