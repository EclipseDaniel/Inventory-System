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
    public partial class ProductionModule : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=PPCA-5253YR6-LX\AACRSQLEXPRESS;Initial Catalog=dbMain;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dropDownListFill();
            }

            //btn_Next.Enabled = !string.IsNullOrWhiteSpace(txtbox_DishName.Text);
            //btn_Cancel.Enabled = !string.IsNullOrWhiteSpace(txtbox_Ingre.Text);
            //btn_Add.Enabled = !string.IsNullOrWhiteSpace(txtbox_Quantity.Text);

        }

        public void FillGridView(string strSelectFilter)
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("MenuViewByDish", con);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@Dish", strSelectFilter);

            DataTable dt = new DataTable();
            sqlDa.Fill(dt);
            con.Close();
            gridDishMenu.DataSource = dt;
            gridDishMenu.DataBind();

        }

        protected void btn_Next_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("MenuViewByDish", con);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@Dish", txtbox_DishName.Text);
            DataTable dt = new DataTable();
            sqlDa.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                Response.Write($"<script>alert('Dish is already existing.')</script>");
                txtbox_DishName.Text = string.Empty;
                txtbox_Quantity.Text = string.Empty;
                ddlIngredients.SelectedItem.Text = string.Empty;
            }
            else
            {
                txtbox_DishName.ReadOnly = true;

            }
            con.Close();
        }

        protected void btn_Cancel_Click(object sender, EventArgs e)
        {
            txtbox_DishName.Text = string.Empty;
            ddlIngredients.SelectedItem.Text = string.Empty;
            txtbox_Quantity.Text = string.Empty;

            //btn_Add.Enabled = false;
            //btn_Cancel.Enabled = false;
            //btn_Next.Enabled = false;
        }

        protected void btn_Add_Click(object sender, EventArgs e)
        {
            string strDishSelected = null;
            string strIngredients = null;
            string strQuantitySelected = null;
            strDishSelected = txtbox_DishName.Text;
            strIngredients = ddlIngredients.SelectedItem.Text;
            strQuantitySelected = txtbox_Quantity.Text;

            if (con.State == ConnectionState.Closed)
            {
                con.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("MenuViewByDishAndIngredients", con);
                sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                sqlDa.SelectCommand.Parameters.AddWithValue("@Dish", strDishSelected);
                sqlDa.SelectCommand.Parameters.AddWithValue("@Ingredients", strIngredients);

                DataTable dt = new DataTable();
                sqlDa.Fill(dt);

                string strCurrentQuantity = null;

                if (dt.Rows.Count > 0)
                {
                    txtbox_MenuId.Text = dt.Rows[0]["MenuID"].ToString();
                    strCurrentQuantity = (Convert.ToInt32(dt.Rows[0]["Quantity"]) + Convert.ToInt32(txtbox_Quantity.Text)).ToString();
                }
                else
                {
                    strCurrentQuantity = Convert.ToInt32(txtbox_Quantity.Text).ToString();
                }

                SqlCommand cmd = new SqlCommand("MenuCreateOrUpdate", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MenuID", (txtbox_MenuId.Text == "" ? 0 : Convert.ToInt32(txtbox_MenuId.Text)));
                cmd.Parameters.AddWithValue("@Dish", txtbox_DishName.Text.Trim());
                cmd.Parameters.AddWithValue("@Ingredients", ddlIngredients.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Quantity", strCurrentQuantity);
                cmd.ExecuteNonQuery();


                con.Close();

                string MenuID = txtbox_MenuId.Text;

                if (txtbox_DishName.ReadOnly == true && txtbox_DishName.Text != "")
                {

                }
                else
                {
                    txtbox_DishName.Text = string.Empty;
                }
                txtbox_DishName.Text = string.Empty;
                ddlIngredients.SelectedItem.Text = string.Empty;
                txtbox_Quantity.Text = string.Empty;

                FillGridView(strDishSelected);
            }

            txtbox_MenuId.Text = string.Empty;

        }

        protected void txtbox_DishName_TextChanged(object sender, EventArgs e)
        {
            btn_Next.Enabled = !string.IsNullOrWhiteSpace(txtbox_DishName.Text);
            //btn_Cancel.Enabled = !string.IsNullOrWhiteSpace(txtbox_Ingre.Text);
            //btn_Add.Enabled = !string.IsNullOrWhiteSpace(txtbox_Quantity.Text);
        }

        protected void btn_Unlock_Click(object sender, EventArgs e)
        {
            txtbox_DishName.ReadOnly = false;
        }

        protected void dropDownListFill()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();

            string ddlFill = "SELECT ItemName FROM tblItemDetails";
            SqlDataAdapter da = new SqlDataAdapter(ddlFill, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddlIngredients.DataSource = dt;
            ddlIngredients.DataBind();
            ddlIngredients.DataTextField = "ItemName";
            ddlIngredients.DataValueField = "ItemName";
            ddlIngredients.DataBind();
        }

    }

}