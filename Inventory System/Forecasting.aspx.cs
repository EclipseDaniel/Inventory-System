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
using System.Globalization;

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
                    FillComboBox();
                    ShowData();
                }
                else
                {
                    //Insert Code Here
                }



                
            }
        }

        private void FillComboBox()
        {
            List<string> items = new List<string>();

            //get data from order table
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlD = new SqlDataAdapter("ViewOrderedItems", con);
            sqlD.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            sqlD.Fill(dt);


            foreach (DataRow dr in dt.Rows)
            {
                items.Add(dr["Ingredients"].ToString());

            }
            items.Insert(0, "All");

            ddlItem.DataSource = items.Distinct().ToList();
            ddlItem.DataBind();
        }


        private void ShowData()
        {
            List<ForecastingDetails> ForecastDetailsListTemp = new List<ForecastingDetails>();
            List<ForecastingDetails> ForecastDetailsList = new List<ForecastingDetails>();
            List<SupplyDetails> SupplyDetailsList = new List<SupplyDetails>();
            List<DemandDetails> DemandDetailsList = new List<DemandDetails>();




            try
            {

            //get data from items table
                if (con.State == ConnectionState.Closed)
                    con.Open();
                SqlDataAdapter sqlD = new SqlDataAdapter("ViewPurchasedItems", con);
                sqlD.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable dt = new DataTable();
                sqlD.Fill(dt);

                foreach (DataRow dr in dt.Rows)
                {
                    SupplyDetailsList.Add(new SupplyDetails
                    {
                        ItemName = dr["ItemName"].ToString(),
                        SupplyDate = dr["Date"].ToString(),
                        SupplyQty = dr["ItemQuantity"].ToString()
                    });
                }

            //get data from order table
                if (con.State == ConnectionState.Closed)
                    con.Open();
                sqlD = new SqlDataAdapter("ViewOrderedItems", con);
                sqlD.SelectCommand.CommandType = CommandType.StoredProcedure;
                dt = new DataTable();
                sqlD.Fill(dt);


                foreach (DataRow dr in dt.Rows)
                {
                    DemandDetailsList.Add(new DemandDetails
                    {
                        ItemName = dr["Ingredients"].ToString(),
                        OrderDate = DateTime.ParseExact(dr["Date"].ToString(), "M/d/yyyy hh:mm:ss tt", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd"),
                        OrderQty = dr["TotalQuantity"].ToString()
                    });
                }

                con.Close();

            //join the data from two table grouping them by itemname and order date
                var joinedData = DemandDetailsList
                                .Join(SupplyDetailsList,
                                        demand => new { Name = demand.ItemName, Date = demand.OrderDate },
                                        supply => new { Name = supply.ItemName, Date = supply.SupplyDate },
                                        (demand, supply) => new { demand, supply });

                foreach (var item in joinedData)
                {
                    ForecastDetailsListTemp.Add(new ForecastingDetails
                    {
                        ItemName = item.demand.ItemName,
                        OrderDate = item.demand.OrderDate,
                        OrderQty = item.demand.OrderQty,
                        SupplyDate = item.supply.SupplyDate,
                        SupplyQty = item.supply.SupplyQty
                    });
                }



                string selectedItem = ddlItem.SelectedValue;
                string selectedRange = ddlMonth.SelectedValue;


                //apply items filter
                switch (selectedItem)
                {
                case "All":
                    break;

                default:
                    ForecastDetailsListTemp = ForecastDetailsListTemp.Where(item => item.ItemName == selectedItem).ToList();
                    break;
                }


                //apply range filter
                switch (selectedRange)
                {
                case "Daily":
                    //default date grouping: daily
                    ForecastDetailsList = ForecastDetailsListTemp;
                break;

                case "Weekly":
                    //group by week of year and sum the group to show total numbers per month
                    var WeeklyGroup = ForecastDetailsListTemp
                                        .GroupBy(item => GlobalFunctions.GetIso8601WeekOfYear(DateTime.ParseExact(item.OrderDate, "yyyy-MM-dd", CultureInfo.InvariantCulture)))
                                        .Select(g => new
                                        {
                                            Week = g.Key,
                                            Supply = g.Sum(s => Convert.ToInt32(s.SupplyQty)),
                                            Demand = g.Sum(d => Convert.ToInt32(d.OrderQty))

                                        });

                        foreach (var item in WeeklyGroup)
                        {
                            ForecastDetailsList.Add(new ForecastingDetails
                            {
                                ItemName = selectedItem,
                                OrderDate = "Week " + item.Week.ToString(),
                                OrderQty = item.Demand.ToString(),
                                SupplyDate = "Week " + item.Week.ToString(),
                                SupplyQty = item.Supply.ToString()
                            });
                        }


                    break;

                case "Monthly":

                    //group by month and sum the group to show total numbers per month
                    var MonthlyGroup = ForecastDetailsListTemp
                                        .GroupBy(item => DateTime.ParseExact(item.OrderDate, "yyyy-MM-dd", CultureInfo.InvariantCulture).Month)
                                        .Select(g => new
                                        {
                                            Month = g.Key,
                                            Supply = g.Sum(s => Convert.ToInt32(s.SupplyQty)),
                                            Demand = g.Sum(d => Convert.ToInt32(d.OrderQty))

                                        });


                        foreach (var item in MonthlyGroup)
                        {
                            ForecastDetailsList.Add(new ForecastingDetails
                            {
                                ItemName = selectedItem,
                                OrderDate = new DateTime(2000, item.Month, 1).ToString("MMM", CultureInfo.InvariantCulture),
                                OrderQty = item.Demand.ToString(),
                                SupplyDate = new DateTime(2000, item.Month, 1).ToString("MMM", CultureInfo.InvariantCulture),
                                SupplyQty = item.Supply.ToString()
                            });
                        }

                    break;

                default:
                    break;
                }


                

                string labels = "";
                string supplyData = "";
                string demandData = "";

                foreach (ForecastingDetails item in ForecastDetailsList)
                {
                    labels += "'" + item.OrderDate + "',";
                    supplyData += item.SupplyQty + ",";
                    demandData += item.OrderQty + ",";
                }




                labels = labels.Substring(0, labels.Length - 1);
                supplyData = supplyData.Substring(0, supplyData.Length - 1);
                demandData = demandData.Substring(0, demandData.Length - 1);


                String chart = "";
                chart = "<canvas id=\"line-chart\" width=\"100%\" height=\"40\"></canvas>";
                chart += "<script>";
                chart += "new Chart(document.getElementById(\"line-chart\"), { type: 'line', data: {labels: [";

                chart += labels;

                chart += "],datasets: [{ data: [";

                chart += supplyData;

                chart += "],label: \"Supply Rate\",borderColor: \"#fc5c65\",fill: true}"; // Chart color

                chart += ", { data: [";

                chart += demandData;

                chart += "],label: \"Demand Rate\",borderColor: \"#45aaf2\",fill: true}";

                chart += "]},options: { title: { display: true,text: 'Forecast for " + selectedItem + "'} }"; // Chart title
                chart += "});";
                chart += "</script>";

                ltChart.Text = chart;


            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
   
    }

        protected void btnSavePercentage_Click(object sender, EventArgs e)
        {
            ShowData();
            //if(con.State == ConnectionState.Closed)
            //{
            //    con.Open();
            //    string month = ddlMonth.SelectedValue.ToString();
            //    string percentage = txtPercentage.Text.ToString();
            //    SqlDataAdapter da = new SqlDataAdapter("UPDATE tblForecasting SET SupplyRate= " + percentage + " WHERE Months='" + month + "'", con);
            //    DataSet ds = new DataSet();
            //    da.Fill(ds);
            //    Response.Redirect("~/Forecasting.aspx");
            //}
        }
    }


    public class SupplyDetails 
    {
        public string ItemName
        {
            get; set;
        }

        public string SupplyDate
        {
            get; set;
        }

        public string SupplyQty
        {
            get; set;
        }
    }

    public class DemandDetails
    {
        public string ItemName
        {
            get; set;
        }

        public string OrderDate
        {
            get; set;
        }

        public string OrderQty
        {
            get; set;
        }
    }




    public class ForecastingDetails
    {
        public string ItemName
        {
            get; set;
        }

        public string SupplyDate
        {
            get; set;
        }

        public string SupplyQty
        {
            get; set;
        }

        public string OrderDate
        {
            get; set;
        }

        public string OrderQty
        {
            get; set;
        }
    }


}