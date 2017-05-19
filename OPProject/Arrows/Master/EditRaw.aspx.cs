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
    public partial class WebForm10 : System.Web.UI.Page
    {
        clsDatabase dbconn = new clsDatabase();

        protected void Page_Load(object sender, EventArgs e)
        {
            PanelSearch.Visible = true;
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            PanelSearchResult.Visible = true;
            PanelSearch.Visible = true;

            string findIDName;
            findIDName = "select RawID, RawName, RawMaterials.RawUnitID, RawUnitName, RawMaterials.RawTypeID, RawTypeName from RawMaterials, RawMatTypes, RawUnit where RawMaterials.RawTypeID = RawMatTypes.RawTypeID AND (RawMaterials.RawUnitID = RawUnit.RawUnitID) AND (RawID LIKE '%"+TxtIDName.Text+"%' or RawName LIKE '%"+TxtIDName.Text+"%');";
            DataTable dt = dbconn.QueryExecuteScalar(findIDName);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            dbconn.Close();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void BtnFindAll_Click(object sender, EventArgs e)
        {
            PanelSearchResult.Visible = true;
            PanelSearch.Visible = true;

            string findIDName;
            findIDName = "select RawID, RawName, RawMaterials.RawUnitID, RawUnitName, RawMaterials.RawTypeID, RawTypeName from RawMaterials, RawMatTypes, RawUnit where RawMaterials.RawTypeID = RawMatTypes.RawTypeID AND (RawMaterials.RawUnitID = RawUnit.RawUnitID)";
            DataTable dt = dbconn.QueryExecuteScalar(findIDName);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            dbconn.Close();
        }
      

      

        
    }
}