using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace OPProject.Production
{
    public partial class Formular : System.Web.UI.Page
    {
        clsDatabase dbconn = new clsDatabase();
        DataTable dt1; 

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                dt1 = new DataTable();
                MakeDataTable();
            }
            else
            {
                dt1 = (DataTable)ViewState["DataTable"];
            }
            ViewState["DataTable"] = dt1;

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            String FindJobOrder = "Select * from JobOrders where JobID Like '%" + txtFindJO.Text + "%' or CusName like '%" + txtFindJO.Text + "%' and JobStatus = 'รอจัดซื้อวัตถุดิบ';";
            DataTable dt = dbconn.QueryExecuteScalar(FindJobOrder);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            dbconn.Close();

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string JOID = GridView1.SelectedRow.Cells[1].Text;
            string SearchJI = "SELECT * FROM JobOrderItems WHERE JobID = '" + JOID + "';";
            DataTable dt = dbconn.QueryExecuteScalar(SearchJI);
            GridView2.DataSource = dt;
            GridView2.DataBind();
            dbconn.Close();
            
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ShowJobItem = "Select JobItemID, JobItemStatus, JobItemName, JobItemDes, JobOrderItems.SizeID,SizeName from JobOrderItems, Sizes where JobItemID = '" + GridView2.SelectedRow.Cells[1].Text + "' AND JobOrderItems.SizeID = Sizes.SizeID ;";

            DataTable dt = dbconn.QueryExecuteScalar(ShowJobItem);


            GridView GV = (GridView)DetailsView1.FindControl("GridViewJobOrderItem");
            GV.DataSource = dt;
            GV.DataBind();
           


            string FindStyle = "SELECT dbo.JobOrders.StyleID, dbo.Styles.StylePic FROM dbo.Styles INNER JOIN dbo.JobOrders ON dbo.Styles.StyleID = dbo.JobOrders.StyleID WHERE (dbo.JobOrders.JobID = '"+GridView1.SelectedRow.Cells[1].Text+"');";
            DataTable dtStyle = dbconn.QueryExecuteScalar(FindStyle);
            string ImageN = dtStyle.Rows[0]["StylePic"].ToString();
            string ImageName = "~/ModelPicture/"+ImageN;
            Image ShowImage = (Image)DetailsView1.FindControl("Image1");
            ShowImage.ImageUrl = ImageName;
            dbconn.Close();

        }

        protected void SqlDataSource3_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            SaveMat();
        }
        private void MakeDataTable()
        {
            dt1.Columns.Add("รหัสวัตถุดิบ");
            dt1.Columns.Add("วัตถุดิบ");
            dt1.Columns.Add("จำนวน");
            dt1.Columns.Add("หน่วย");
            

        }

        private void AddToDataTable()
        {
            DataRow dr = dt1.NewRow();
            dr["รหัสวัตถุดิบ"] = ddlRaw.SelectedValue;
            dr["วัตถุดิบ"] = ddlRaw.SelectedItem.Text;
            dr["จำนวน"] = txtQty.Text;
            dr["หน่วย"] = ddlUnit.SelectedItem.Text;

            dt1.Rows.Add(dr);
        }

        private void BindGrid()
        {
            GridView3.DataSource = dt1;
            GridView3.DataBind();

        }
        


        

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
           
            AddToDataTable();
            BindGrid();
        }

        protected void GridView3_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            dt1.Rows.RemoveAt(e.RowIndex);
            GridView3.DataSource = dt1;
            BindGrid();
        }

        private void SaveMat()
        {
            for (int i = 0; i < GridView3.Rows.Count; i++)
            {

                string save = "INSERT INTO JobItemMaterials (JobItemID, RawID,JobItemMatQty,RawUnitName) VALUES ('" +GridView2.SelectedRow.Cells[1].Text+ "','" + Convert.ToString(dt1.Rows[i]["รหัสวัตถุดิบ"]) + "','" + Convert.ToDouble(dt1.Rows[i]["จำนวน"]) + "','" + Convert.ToString(dt1.Rows[i]["หน่วย"]) + "');";
                dbconn.QueryExecuteScalar(save);
            }

            dbconn.Close();
        }
    }
}