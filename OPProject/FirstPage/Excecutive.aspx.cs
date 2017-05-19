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
    public partial class Excecutive : System.Web.UI.Page
    {
        clsDatabase dbconn = new clsDatabase();

        protected void Page_Load(object sender, EventArgs e)
        {
            string findLateItem = "SELECT     dbo.JobOrderItems.JobItemName, dbo.JobOrderItems.JobItemDes, dbo.JobOrderItems.JobItemQty, dbo.JobOrderItems.JobItemStatus, dbo.JobOrderItems.JobItemID,                dbo.JobOrderItems.JobID, dbo.JobOrders.DeliveryDate, dbo.JobOrders.CusID, dbo.Customers.CusName FROM         dbo.JobOrderItems INNER JOIN  dbo.JobOrders ON dbo.JobOrderItems.JobID = dbo.JobOrders.JobID INNER JOIN dbo.Customers ON dbo.JobOrders.CusID COLLATE SQL_Latin1_General_CP1_CI_AS = dbo.Customers.CusID WHERE     (dbo.JobOrderItems.JobItemStatus <> 'จัดส่งสินค้าเรียบร้อยแล้ว') AND (dbo.JobOrders.DeliveryDate <= GETDATE());";
            DataTable dt = dbconn.QueryExecuteScalar(findLateItem);
            GridView1.DataSource = dt;
            GridView1.DataBind();

            string FindDeliveryItemForThisWeek = "SELECT     dbo.JobOrderItems.JobItemName, dbo.JobOrderItems.JobItemDes, dbo.JobOrderItems.JobItemQty, dbo.JobOrderItems.JobItemStatus, dbo.JobOrderItems.JobItemID,dbo.JobOrderItems.JobID, dbo.JobOrders.DeliveryDate, dbo.JobOrders.CusID, dbo.Customers.CusName, DATEDIFF(Day, GETDATE(), dbo.JobOrders.DeliveryDate)AS RemainedTime FROM         dbo.JobOrderItems INNER JOIN dbo.JobOrders ON dbo.JobOrderItems.JobID = dbo.JobOrders.JobID INNER JOIN dbo.Customers ON dbo.JobOrders.CusID COLLATE SQL_Latin1_General_CP1_CI_AS = dbo.Customers.CusID WHERE     (dbo.JobOrderItems.JobItemStatus <> 'จัดส่งสินค้าเรียบร้อยแล้ว') AND (DATEDIFF(Day, GETDATE(), dbo.JobOrders.DeliveryDate) <= 7) AND (DATEDIFF(Day, GETDATE(),                       dbo.JobOrders.DeliveryDate) > 0);";

            DataTable dt2 = dbconn.QueryExecuteScalar(FindDeliveryItemForThisWeek);
            GridView2.DataSource = dt2;
            GridView2.DataBind();
            
            dbconn.Close();
        }
    }
}