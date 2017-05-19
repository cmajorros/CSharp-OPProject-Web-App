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
    public partial class EditFormular : System.Web.UI.Page
    {
        clsDatabase dbconn = new clsDatabase();
        protected void Page_Load(object sender, EventArgs e)
        {

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



            string FindStyle = "SELECT dbo.JobOrders.StyleID, dbo.Styles.StylePic FROM dbo.Styles INNER JOIN dbo.JobOrders ON dbo.Styles.StyleID = dbo.JobOrders.StyleID WHERE (dbo.JobOrders.JobID = '" + GridView1.SelectedRow.Cells[1].Text + "');";
            DataTable dtStyle = dbconn.QueryExecuteScalar(FindStyle);
            string ImageN = dtStyle.Rows[0]["StylePic"].ToString();
            string ImageName = "~/ModelPicture/" + ImageN;
            Image ShowImage = (Image)DetailsView1.FindControl("Image1");
            ShowImage.ImageUrl = ImageName;
            dbconn.Close();
            //Matdetail();
        }
        private void Matdetail()
        {
            string RawMat = "SELECT     dbo.JobItemMaterials.RawID, dbo.RawMaterials.RawName, dbo.JobItemMaterials.JobItemMatQty, dbo.JobItemMaterials.RawUnitName FROM dbo.RawMaterials INNER JOIN dbo.JobItemMaterials ON dbo.RawMaterials.RawID = dbo.JobItemMaterials.RawID COLLATE SQL_Latin1_General_CP1_CI_AS WHERE '"+GridView2.SelectedRow.Cells[1].Text+"' ;";

            DataTable dt = dbconn.QueryExecuteScalar(RawMat);

            GridView GVRawMat = (GridView)DetailsView1.FindControl("GridViewMat");
            GVRawMat.DataSource = dt;
            GVRawMat.DataBind();

            dbconn.Close();

        }

        protected void GridViewMat_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                {
                    LinkButton l = (LinkButton)e.Row.FindControl("LinkButton1");
                    l.Attributes.Add("onclick", "javascript:return " +
                    "confirm('คุณต้องการลบวัตถุดิบที่ใช่หรือไม่ ')");
                }
            }
        }
    }
}