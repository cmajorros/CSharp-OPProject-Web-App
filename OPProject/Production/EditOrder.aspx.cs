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
    public partial class WebForm1 : System.Web.UI.Page
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
            PanelJobOrder.Visible = true;
            GridView1.Visible = false;
            string JobID = GridView1.SelectedRow.Cells[1].Text;
            string FindJobID = "SELECT dbo.JobOrders.*, dbo.Styles.StylePic FROM dbo.JobOrders INNER JOIN                      dbo.Styles ON dbo.JobOrders.StyleID = dbo.Styles.StyleID where JobID = '" + JobID + "' AND JobOrders.StyleID = Styles.StyleID;";
            DataTable dt = dbconn.QueryExecuteScalar(FindJobID);
            LblJobID.Text = dt.Rows[0]["JobID"].ToString();
            DdlCusName.SelectedValue = dt.Rows[0]["CusID"].ToString();
            TxtOrderDate.Text = Convert.ToDateTime(dt.Rows[0]["OrderDate"]).Date.ToString("dd/MM/yyyy");
            TxtDelDate.Text = Convert.ToDateTime(dt.Rows[0]["DeliveryDate"]).Date.ToString("dd/MM/yyyy");

           /* string Style = dt.Rows[0]["StyleID"].ToString();
            DdlModel.SelectedValue = Style;*/
            Image1.ImageUrl = "~/ModelPicture/" + dt.Rows[0]["StylePic"].ToString();
            

            
        }
    }
}