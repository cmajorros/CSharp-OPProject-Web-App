using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


namespace OPProject.Master
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        clsDatabase dbconn = new clsDatabase();

        protected void Page_Load(object sender, EventArgs e)
        {
            PanelSearch.Visible = true;
          
        }

        protected void BtnSearchAll_Click(object sender, EventArgs e)
        {
            PanelSearch.Visible = true;
            PanelResult.Visible = true;


            string findall;
            findall = "Select CusID, CusName, CusAdd from Customers order by CusID";
            DataTable dt = dbconn.QueryExecuteScalar(findall);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            dbconn.Close();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            PanelSearch.Visible = true;
            PanelResult.Visible = true;

            string findIDName;
            findIDName = "SELECT CusID, CusName, CusAdd from Customers where (CusID like'%" + TxtIDName.Text + "%' or CusName like '%" + TxtIDName.Text + "%')";

            DataTable dt = dbconn.QueryExecuteScalar(findIDName);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            dbconn.Close();

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
          
            PanelEdit.Visible = true;
            PanelSearch.Visible = true;
            PanelResult.Visible = false;

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
           

        }

  

        protected void DetailsView1_ItemUpdated1(object sender, DetailsViewUpdatedEventArgs e)
        {
            PanelSuccess.Visible = true;
            PanelResult.Visible = false;
            PanelEdit.Visible = false;
            PanelSearch.Visible = false;
        }

        protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {

        }
    }
}