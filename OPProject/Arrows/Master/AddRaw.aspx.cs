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
    public partial class WebForm5 : System.Web.UI.Page
    {
        clsDatabase dbconn = new clsDatabase();

        protected void Page_Load(object sender, EventArgs e)
        {
            string findRawID = "select max(RawID) as maxRaw from RawMaterials";
            DataTable dt = dbconn.QueryExecuteScalar(findRawID);
            int RawID = Convert.ToInt32(dt.Rows[0]["maxRaw"]);
            int newID = RawID + 1;
            TextBox1.Text = newID.ToString();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string insertRaw = "insert into RawMaterials(RawName,RawTypeID,RawUnitID) values ('" + TxtRawName.Text + "','" +DrdType.SelectedValue + "', '" + DrdUnit.SelectedValue + "');";

            dbconn.QueryExecuteScalar(insertRaw);
            dbconn.Close();
        }
    }
}