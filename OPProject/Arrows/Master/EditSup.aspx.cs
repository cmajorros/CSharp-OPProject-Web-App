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
    public partial class EditEmp : System.Web.UI.Page
    {
        clsDatabase dbconn = new clsDatabase();

        protected void Page_Load(object sender, EventArgs e)
        {
            PanelSearch.Visible = true;


        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {

            PanelSearchResult.Visible = true;
            PanelDetail.Visible = false;
            PanelUpdateResult.Visible = false;

            string findIDName;
            findIDName = "SELECT SupID, SupName, SupAdd from Suppliers where (SupID like'%" +TxtIDName.Text+ "%' or SupName like '%" +TxtIDName.Text+ "%') order by SupID";

            DataTable dt = dbconn.QueryExecuteScalar(findIDName);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            dbconn.Close();


        }

        protected void BtnFindAll_Click(object sender, EventArgs e)
        {
            PanelSearchResult.Visible = true;
            PanelDetail.Visible = false;
            PanelUpdateResult.Visible = false;
           
            string findall;
            findall = "Select SupID, SupName, SupAdd from Suppliers order by SupID";
            DataTable dt = dbconn.QueryExecuteScalar(findall);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            dbconn.Close();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            PanelDetail.Visible = true;
            PanelSearchResult.Visible = false; 
            
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
           
        }

        protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            PanelUpdateResult.Visible = true;
            PanelSearchResult.Visible = false;
            PanelDetail.Visible = false;
            PanelSearch.Visible = false;
        }

        protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {

        }       
            
        
    }
}