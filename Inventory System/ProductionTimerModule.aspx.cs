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
    public partial class ProductionTimerModule : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        SqlConnection con = new SqlConnection(@"Data Source=PPCA-5253YR6-LX\AACRSQLEXPRESS;Initial Catalog=dbMain;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
            }
                FillGridView();
        }

        public void FillGridView()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("OrderViewAll", con);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            dt = new DataTable();
            sqlDa.Fill(dt);
            con.Close();
            gridOrderedDish.DataSource = dt;
            gridOrderedDish.DataBind();
        }

        protected void calculateDuration()
        {
            DateTime dt1 = Convert.ToDateTime(txtStartTime.Text);
            DateTime dt2 = Convert.ToDateTime(DateTime.Now);

            TimeSpan ts = dt2 - dt1;
            string duration = ts.Hours + ":" + ts.Minutes + ":" + ts.Seconds;
           
        }

        protected void lnk_Click(object sender, EventArgs e)
        {
            int ItemID = Convert.ToInt32((sender as LinkButton).CommandArgument);

            //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + ItemID + "');", true);

            if (con.State == ConnectionState.Closed)
                con.Open();


        }
        protected void btnEnd_Click(object sender, EventArgs e)
        {
            DateTime dt1 = Convert.ToDateTime(txtStartTime.Text);
            DateTime dt2 = Convert.ToDateTime(DateTime.Now);

            TimeSpan ts = dt2 - dt1;

            string duration = String.Format("{0} hours {1} minutes {2} seconds",ts.Hours, ts.Minutes, ts.Seconds); //ts.Hours + " hours:" + ts.Minutes + ":" + ts.Seconds;


        }

        protected void UpdateTimer_Tick(object sender, EventArgs e)
        {
            dt = gridOrderedDish.DataSource as DataTable;

            if (dt != null)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    if(dr["StartTime"] != null && dr["StartTime"].ToString() != "")
                    {
                        DateTime dt1 = Convert.ToDateTime(dr["StartTime"].ToString());
                        DateTime dt2 = DateTime.Now;

                        TimeSpan ts = dt2 - dt1;
                        string duration = String.Format("{0} hours {1} minutes {2} seconds", ts.Hours, ts.Minutes, ts.Seconds);

                        dr["Duration"] = duration;
                    }
                }

                gridOrderedDish.DataBind();
                
            }
            
        }
    }
}