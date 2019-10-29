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
    public partial class ProductionTimerModule : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
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
                }



            }
            FillGridView();
        }

        public void FillGridView()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("OrderViewInProgress", con);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            dt = new DataTable();
            sqlDa.Fill(dt);
            con.Close();
            gridOrderedDish.DataSource = dt;
            gridOrderedDish.DataBind();
        }

        //protected void calculateDuration()
        //{
        //   // DateTime dt1 = Convert.ToDateTime(txtStartTime.Text);
        //    DateTime dt2 = Convert.ToDateTime(DateTime.Now);

        //    TimeSpan ts =  dt2;
        //    string duration = ts.Hours + ":" + ts.Minutes + ":" + ts.Seconds;

        //}

        protected void lnk_Click(object sender, EventArgs e)
        {

            //int MenuID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            int rowIndex = Convert.ToInt32((sender as LinkButton).CommandArgument);
            int menuID = Convert.ToInt32(gridOrderedDish.Rows[rowIndex].Cells[0].Text);

            //compute duration
            string startTime = gridOrderedDish.Rows[rowIndex].Cells[5].Text;
            string endTime = DateTime.Now.ToString();

            DateTime dt1 = Convert.ToDateTime(startTime);
            DateTime dt2 = Convert.ToDateTime(endTime);

            TimeSpan ts = dt2 - dt1;

            string duration = String.Format("{0} hours {1} minutes {2} seconds", ts.Hours, ts.Minutes, ts.Seconds);


            //compute lead time & status
            string status = "";
            string leadTime = gridOrderedDish.Rows[rowIndex].Cells[7].Text;

            if (ts.TotalMinutes > Convert.ToInt32(leadTime))
            {
                status = "Completed - Late";
            }
            else
            {
                status = "Completed - On time";
            }

            

            if (con.State == ConnectionState.Closed)
                con.Open();

            SqlCommand cmd = new SqlCommand("OrderTimeUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MenuID", menuID);
            cmd.Parameters.AddWithValue("@Duration", duration);
            cmd.Parameters.AddWithValue("@EndTime", endTime);
            cmd.Parameters.AddWithValue("@OrderStatus", status);
            cmd.ExecuteNonQuery();


            con.Close();

            FillGridView();

        }
        //protected void btnEnd_Click(object sender, EventArgs e)
        //{
        //    //DateTime dt1 = Convert.ToDateTime(txtStartTime.Text);
        //    DateTime dt2 = Convert.ToDateTime(DateTime.Now);

        //    TimeSpan ts = dt2;

        //    string duration = String.Format("{0} hours {1} minutes {2} seconds",ts.Hours, ts.Minutes, ts.Seconds); //ts.Hours + " hours:" + ts.Minutes + ":" + ts.Seconds;


        //}

        protected void UpdateTimer_Tick(object sender, EventArgs e)
        {
            dt = gridOrderedDish.DataSource as DataTable;

            if (dt != null)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    if (dr["StartTime"] != null && dr["StartTime"].ToString() != "")
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

        protected void lnkCancel_Click(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
                con.Open();

        }
    }
}