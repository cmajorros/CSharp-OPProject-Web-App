using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace OPProject.FirstPage
{
    public partial class Purchasing : System.Web.UI.Page
    {
        clsDatabase dbconn = new clsDatabase();
        protected void Page_Load(object sender, EventArgs e)
        {
            string WaitingList = "SELECT JobID, CusID, CusName, OrderDate, DeliveryDate, JobStatus FROM         dbo.JobOrders WHERE     (JobStatus = 'รอจัดซื้อวัตถุดิบ');";
            DataTable dt = dbconn.QueryExecuteScalar(WaitingList);
            GridView1.DataSource = dt;
            GridView1.DataBind();

          //  string WaitingMatForPurchasing = ""
            dbconn.Close();
        }
    }
}