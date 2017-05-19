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
    public partial class EditJobOrderItem : System.Web.UI.Page
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
    }
}