using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventory_System
{
    public partial class About : Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=PPCA-5253YR6-LX\AACRSQLEXPRESS;Initial Catalog=dbMain;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                //get all items then put in datatable
                if (con.State == ConnectionState.Closed)
                    con.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("ItemViewAll", con);
                sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable dt = new DataTable();
                sqlDa.Fill(dt);
                con.Close();

                //get supply of current month - create SP (Select SUpplyrate where month = DateTime.Now.Month)
                if (con.State == ConnectionState.Closed)
                    con.Open();
                SqlDataAdapter sqlDaa = new SqlDataAdapter("SupplyRate", con);
                sqlDaa.SelectCommand.CommandType = CommandType.StoredProcedure;
                sqlDaa.SelectCommand.Parameters.AddWithValue("@Months", DateTime.Now.ToString("MMMM"));
                DataTable dt2 = new DataTable();
                sqlDaa.Fill(dt2);
                string supplyRate = dt2.Rows[0]["SupplyRate"].ToString();
                con.Close();





                foreach (DataRow dr in dt.Rows)
                {
                    string crit = null;
                    string optimal = null;

                    crit = Convert.ToInt32(supplyRate) * Convert.ToInt32(dr["CriticalLevel"].ToString()) + Convert.ToInt32(dr["CriticalLevel"].ToString()).ToString();
                    optimal = Convert.ToInt32(supplyRate) * Convert.ToInt32(dr["OptimalLevel"].ToString()) + Convert.ToInt32(dr["OptimalLevel"].ToString()).ToString();


                    con.Open();
                    SqlCommand cmd = new SqlCommand("UpdateCriticalOptimal", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ItemID", dr["ItemID"].ToString());
                    cmd.Parameters.AddWithValue("@CriticalLevel", crit);
                    cmd.Parameters.AddWithValue("@OptimalLevel", optimal);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }

                    executeCommand("UPDATE tblForecasting SET Status = 'Updated' WHERE Months ='" + DateTime.Now.ToString("MMMM") + "'");

                
            }
        }
        protected void executeCommand(string sqlQuery)
        {
            con.Open();
            SqlCommand command;
            command = new SqlCommand(sqlQuery, con);
            command.ExecuteNonQuery();
            command.Dispose();
            con.Close();
        }
    }
}