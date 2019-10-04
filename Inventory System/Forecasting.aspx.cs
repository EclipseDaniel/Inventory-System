using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using Inventory_System.Globals;

namespace Inventory_System
{
    public partial class Forecasting : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbMainConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
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



                ShowData();
            }
        }

        private void ShowData()
        {
            
            string query = "SELECT SupplyRate, DemandRate FROM tblForecasting";
            SqlCommand cmd = new SqlCommand(query, con);
            DataTable dt = new DataTable();
            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                dt.Load(dr, LoadOption.OverwriteChanges);
                con.Close();

                if (dt.Rows.Count > 0)
                {
                    String chart = "";
                    chart = "<canvas id=\"line-chart\" width=\"100%\" height=\"40\"></canvas>";
                    chart += "<script>";
                    chart += "new Chart(document.getElementById(\"line-chart\"), { type: 'line', data: {labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'";
                    chart += "],datasets: [{ data: [";

                    // get data from database and add to chart
                    String value = "";
                    for (int i = 0; i < dt.Rows.Count; i++)
                        value += dt.Rows[i]["SupplyRate"].ToString() + ",";
                    value = value.Substring(0, value.Length - 1);
                    chart += value;

                    chart += "],label: \"Supply Rate\",borderColor: \"#3e95cd\",fill: true}"; // Chart color

                    chart += ", { data: [";

                    String value2 = "";
                    for (int i = 0; i < dt.Rows.Count; i++)
                        value2 += dt.Rows[i]["DemandRate"].ToString() + ",";
                    value2 = value2.Substring(0, value2.Length - 1);
                    chart += value2;

                    chart += "],label: \"Demand Rate\",borderColor: \"#3e95cd\",fill: true}";

                    chart += "]},options: { title: { display: true,text: 'Inventory Forecasting'} }"; // Chart title
                    chart += "});";
                    chart += "</script>";

                    ltChart.Text = chart;
                }
            }
            catch
            {

            }
        }

        protected void btnSavePercentage_Click(object sender, EventArgs e)
        {
            if(con.State == ConnectionState.Closed)
            {
                con.Open();
                string month = ddlMonth.SelectedValue.ToString();
                string percentage = txtPercentage.Text.ToString();
                SqlDataAdapter da = new SqlDataAdapter("UPDATE tblForecasting SET SupplyRate= " + percentage + " WHERE Months='" + month + "'", con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                Response.Redirect("~/Forecasting.aspx");
            }
        }
    }
}