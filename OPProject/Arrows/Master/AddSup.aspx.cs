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
    public partial class WebForm8 : System.Web.UI.Page
    {
        clsDatabase dbconn = new clsDatabase();

        protected void Page_Load(object sender, EventArgs e)
        {
            string findSupID = "select max(SupID) as maxSup from Suppliers";
            DataTable dt = dbconn.QueryExecuteScalar(findSupID);
            int SupID = Convert.ToInt32(dt.Rows[0]["maxSup"]);
            int newID = SupID + 1;
            TxtSupID.Text = newID.ToString();
        }

        protected void BtnSaveSup_Click(object sender, EventArgs e)
        {
            string insertSup = "insert into Suppliers(SupName,SupContact,SupAdd,SupTel,SupFax,SupEmail) values ('" + TxtSupName.Text + "','" + TxtSupContact.Text+ "', '" + TxtSupAdd.Text+ "','" + TxtSupPhone.Text + "','"+TxtSupFax.Text+"', '"+TxtSupEmail.Text+"');";

            dbconn.QueryExecuteScalar(insertSup);
            dbconn.Close();
        }
    }
}