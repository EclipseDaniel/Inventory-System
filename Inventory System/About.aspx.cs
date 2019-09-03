﻿using System;
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
        List<cInventory> listInventory;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                listInventoryView("SELECT * FROM tblItemDetails");
                if (con.State == ConnectionState.Closed)
                    con.Open();
                SqlDataAdapter sqlD = new SqlDataAdapter("ItemViewAll", con);
                sqlD.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable dt = new DataTable();
                sqlD.Fill(dt);

                foreach (DataRow dr in dt.Rows)
                {
                    foreach (cInventory c in listInventory)
                    {
                        if (c.CriticalLevel != null && c.OptimalLevel != null)
                        {
                            //get all items then put in datatable
                            if (con.State == ConnectionState.Closed)
                                con.Open();
                            SqlDataAdapter sqlDa = new SqlDataAdapter("ItemViewAll", con);
                            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                            DataTable dtt = new DataTable();
                            sqlDa.Fill(dtt);
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

                            foreach (DataRow drr in dt.Rows)
                            {
                                if(!String.IsNullOrEmpty(drr["CriticalLevel"].ToString()) && !String.IsNullOrEmpty(drr["OptimalLevel"].ToString()))
                                {
                                    string crit = null;
                                    string optimal = null;

                                    crit = Convert.ToInt32(supplyRate) * Convert.ToInt32(drr["CriticalLevel"].ToString()) + Convert.ToInt32(drr["CriticalLevel"].ToString()).ToString();
                                    optimal = Convert.ToInt32(supplyRate) * Convert.ToInt32(drr["OptimalLevel"].ToString()) + Convert.ToInt32(drr["OptimalLevel"].ToString()).ToString();


                                    con.Open();
                                    SqlCommand cmd = new SqlCommand("UpdateCriticalOptimal", con);
                                    cmd.CommandType = CommandType.StoredProcedure;
                                    cmd.Parameters.AddWithValue("@ItemID", drr["ItemID"].ToString());
                                    cmd.Parameters.AddWithValue("@CriticalLevel", crit);
                                    cmd.Parameters.AddWithValue("@OptimalLevel", optimal);
                                    cmd.ExecuteNonQuery();
                                    con.Close();
                                }

                            }


                        }
                        else
                        {
                            continue;
                        }

                    }
                    executeCommand("UPDATE tblForecasting SET Status = 'Updated' WHERE Months ='" + DateTime.Now.ToString("MMMM") + "'");
                }            
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

        public void listInventoryView(string strQuery)
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
                        CriticalLevel = dr["CriticalLevel"].ToString(),
                        OptimalLevel = dr["OptimalLevel"].ToString(),

                    });
                }
            }
        }
        class cInventory
        {
            public string CriticalLevel { get; set; }
            public string OptimalLevel { get; set; }
        }
    }
}