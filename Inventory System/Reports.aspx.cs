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
using System.IO;

namespace Inventory_System
{
    public partial class Reports : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbMainConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                ////Check User role here
                //if (SessionManager.UserLevel == "Admin")
                //{
                //    //Insert Code Here
                //}
                //else
                //{
                //    //Insert Code Here

                //    //Disable Controls
                //    GlobalFunctions.DisableControls(this.pnlPage);

                //    //Prompt user
                //    GlobalFunctions.ShowPopUpMsg(this, "You need admin rights to have full access to this page."
                //                                        + Environment.NewLine +
                //                                        "This page is set to read-only.");
                //}
            }
        }

        public void FillGridViewInventoryLogs()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("viewInventoryLogs", con);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            sqlDa.Fill(dt);
            con.Close();
            gridViewInventoryLogs.DataSource = dt;
            gridViewInventoryLogs.DataBind();
        }

        public void FillGridViewForecastDemand()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("viewForecastDemand", con);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            sqlDa.Fill(dt);
            con.Close();
            gridViewForecastDemand.DataSource = dt;
            gridViewForecastDemand.DataBind();
        }

        public void FillGridViewFrequencyOfLate()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("viewFrequencyOfLate", con);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            sqlDa.Fill(dt);
            con.Close();
            gridViewFrequencyOfLateOrders.DataSource = dt;
            gridViewFrequencyOfLateOrders.DataBind();
        }
        protected void btnExportToExcel_Click(object sender, EventArgs e)
        {
            if(ddlReports.SelectedValue == "IL")
            {
                Response.ClearContent();
                Response.AppendHeader("content-disposition", "attachment; filename=IL_Report" + DateTime.Now.ToShortDateString() + ".xls");
                Response.ContentType = "application/excel";

                StringWriter stringWriter = new StringWriter();
                HtmlTextWriter htmlTextWriter = new HtmlTextWriter(stringWriter);

                gridViewInventoryLogs.RenderControl(htmlTextWriter);
                Response.Write(stringWriter.ToString());
                Response.End();
            }
            else if(ddlReports.SelectedValue == "FD")
            {
                Response.ClearContent();
                Response.AppendHeader("content-disposition", "attachment; filename=FD_Report" + DateTime.Now.ToShortDateString() + ".xls");
                Response.ContentType = "application/excel";

                StringWriter stringWriter = new StringWriter();
                HtmlTextWriter htmlTextWriter = new HtmlTextWriter(stringWriter);

                gridViewForecastDemand.RenderControl(htmlTextWriter);
                Response.Write(stringWriter.ToString());
                Response.End();
            }
            else if(ddlReports.SelectedValue == "FPS")
            {

            }
            else if(ddlReports.SelectedValue == "FLO")
            {
                Response.ClearContent();
                Response.AppendHeader("content-disposition", "attachment; filename=FLO_Report" + DateTime.Now.ToShortDateString() + ".xls");
                Response.ContentType = "application/excel";

                StringWriter stringWriter = new StringWriter();
                HtmlTextWriter htmlTextWriter = new HtmlTextWriter(stringWriter);

                gridViewFrequencyOfLateOrders.RenderControl(htmlTextWriter);
                Response.Write(stringWriter.ToString());
                Response.End();
            }
            else if(ddlReports.SelectedValue == "ISR")
            {

            }
            else if (ddlReports.SelectedValue == "FRAVA")
            {

            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            
        }

        protected void ddlReports_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlReports.SelectedValue == "IL")
            {
                Response.Redirect("~/Reports.aspx");
                FillGridViewInventoryLogs();
            }
            else if (ddlReports.SelectedValue == "FD")
            {
                Response.Redirect("~/Reports.aspx");
                FillGridViewForecastDemand();
            }
            else if (ddlReports.SelectedValue == "FPS")
            {
                Response.Redirect("~/Reports.aspx");
            }
            else if (ddlReports.SelectedValue == "ISR")
            {
                Response.Redirect("~/Reports.aspx");
            }
            else if (ddlReports.SelectedValue == "FLO")
            {
                Response.Redirect("~/Reports.aspx");
                FillGridViewFrequencyOfLate();
            }
            else if (ddlReports.SelectedValue == "FRAVA")
            {
                Response.Redirect("~/Reports.aspx");
            }
        }
    }
}