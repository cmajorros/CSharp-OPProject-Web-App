using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace OPProject.Purchasing
{
    public partial class CheckJobMat : System.Web.UI.Page
    {
        clsDatabase dbconn = new clsDatabase();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            String FindJobOrder = "Select * from JobOrders where JobID Like '%" + txtFindJO.Text + "%' or CusName like '%" + txtFindJO.Text + "%' and JobStatus = 'กำลังจัดซื้อวัตถุดิบ';";
            DataTable dt = dbconn.QueryExecuteScalar(FindJobOrder);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            dbconn.Close();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string findMat = "SELECT     RawID, RawName, TotalQuantity, RawUnitName, RawQty, CASE WHEN (TotalQuantity - RawQty) < 0.00 THEN 0.00 ELSE CAST(TotalQuantity - RawQty AS decimal)         END AS PURCH, RawMatTypeID, RawMatTypeName FROM (SELECT     dbo.JobItemMaterials.RawID, dbo.RawMaterials.RawName, SUM(dbo.JobItemMaterials.JobItemMatQty * dbo.JobOrderItems.JobItemQty) AS TotalQuantity, dbo.JobItemMaterials.RawUnitName, dbo.RawMaterials.RawQty, dbo.RawMatTypes.RawMatTypeID, dbo.RawMatTypes.RawMatTypeName FROM  dbo.JobOrderItems INNER JOIN dbo.JobItemMaterials ON dbo.JobOrderItems.JobItemID = dbo.JobItemMaterials.JobItemID INNER JOIN dbo.JobOrders ON dbo.JobOrderItems.JobID = dbo.JobOrders.JobID INNER JOIN dbo.RawMaterials ON dbo.JobItemMaterials.RawID COLLATE SQL_Latin1_General_CP1_CI_AS = dbo.RawMaterials.RawID INNER JOIN dbo.RawMatTypes ON dbo.RawMaterials.RawMatTypeID = dbo.RawMatTypes.RawMatTypeID                       WHERE (dbo.JobOrderItems.JobID = '" + GridView1.SelectedRow.Cells[0].Text + "') GROUP BY dbo.JobItemMaterials.RawID, dbo.RawMaterials.RawName, dbo.JobItemMaterials.RawUnitName, dbo.RawMaterials.RawQty,dbo.RawMatTypes.RawMatTypeID, dbo.RawMatTypes.RawMatTypeName) AS subQr";

            DataTable dt = dbconn.QueryExecuteScalar(findMat);
            GridView2.DataSource = dt;
            GridView2.DataBind();
            dbconn.Close();
            Panel2.Visible = true;
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Panel3.Visible = true;
            string findSelectSup = "SELECT     dbo.ContactSuppliers.ContactSupID, dbo.ContactSuppliers.SupID, dbo.ContactSuppliers.JobID,dbo.ContactSuppliers.ContactSupCost, dbo.ContactSuppliers.RawID, dbo.ContactSuppliers.SelectSup, dbo.ContactSuppliers.RawUnit, dbo.ContactSuppliers.CurrencyUnit, dbo.ContactSuppliers.RawQty, dbo.ContactSuppliers.RawQty * dbo.ContactSuppliers.UnitPrice As TotalPrice,dbo.ContactSuppliers.UnitPrice, dbo.ContactSuppliers.VAT, dbo.ContactSuppliers.NetTotal, dbo.ContactSuppliers.OriginOfItem, dbo.Suppliers.SupName, dbo.Suppliers.SupTel, dbo.Suppliers.SupFax,dbo.Suppliers.SupEmail FROM  dbo.ContactSuppliers INNER JOIN dbo.Suppliers ON dbo.ContactSuppliers.SupID = dbo.Suppliers.SupID WHERE     (dbo.ContactSuppliers.RawID = '" + GridView2.SelectedRow.Cells[0].Text + "') AND (dbo.ContactSuppliers.SelectSup = 'Yes') AND (dbo.ContactSuppliers.JobID = '" + GridView1.SelectedRow.Cells[0].Text + "');";

            DataTable dt = dbconn.QueryExecuteScalar(findSelectSup);
            GridView3.DataSource = dt;
            GridView3.DataBind();

            if (GridView3.Rows.Count == 0)
            {
                Label3.Text = "การจัดซื้อวัตถุดิบอยู่ในระหว่างการเสนอราคาหรือยังไม่ได้ทำการจัดซื้อ";
                Label3.Visible = true;
            }
            else
            {
                Label3.Visible = false;
            }
        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}