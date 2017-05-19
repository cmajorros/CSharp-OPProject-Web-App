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
    public partial class ApprovedPR : System.Web.UI.Page
    {
        clsDatabase dbconn = new clsDatabase();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            string findPR = "SELECT     dbo.PerchaseRequests.PCRID, dbo.PerchaseRequests.PCRQty, dbo.PerchaseRequests.PCRDate, dbo.PerchaseRequests.PCRStatus, dbo.PerchaseRequests.RawID,            dbo.PerchaseRequests.JobItemID, dbo.PerchaseRequests.JobID, dbo.PerchaseRequests.PCRReason, dbo.PerchaseRequests.PCRUnit, dbo.RawMaterials.RawName FROM         dbo.PerchaseRequests INNER JOIN dbo.RawMaterials ON dbo.PerchaseRequests.RawID COLLATE SQL_Latin1_General_CP1_CI_AS = dbo.RawMaterials.RawID WHERE     (dbo.PerchaseRequests.PCRID LIKE '%"+TextBox1.Text+"%') ;";
            DataTable dt = dbconn.QueryExecuteScalar(findPR);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            dbconn.Close();
            Panel2.Visible = true;
            Panel1.Visible = false;

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string findPR = "SELECT     dbo.PerchaseRequests.PCRID, dbo.PerchaseRequests.PCRQty, dbo.PerchaseRequests.PCRDate, dbo.PerchaseRequests.PCRStatus, dbo.PerchaseRequests.RawID,            dbo.PerchaseRequests.JobItemID, dbo.PerchaseRequests.JobID, dbo.PerchaseRequests.PCRReason, dbo.PerchaseRequests.PCRUnit, dbo.RawMaterials.RawName FROM         dbo.PerchaseRequests INNER JOIN dbo.RawMaterials ON dbo.PerchaseRequests.RawID COLLATE SQL_Latin1_General_CP1_CI_AS = dbo.RawMaterials.RawID WHERE     (dbo.PerchaseRequests.PCRID LIKE '%" + TextBox1.Text + "%') ;";
            DataTable dt = dbconn.QueryExecuteScalar(findPR);
           DetailsView1.DataSource = dt;
            DetailsView1.DataBind();
            if (dt.Rows[0]["PCRStatus"].ToString() == "รออนุมัติ")
            {
                btnApprove.Enabled = true;
                btnNotApprove.Enabled = true;
                btnEditQty.Enabled = true;
            }
            else if (dt.Rows[0]["PCRStatus"].ToString() == "อนุมัติ")
            {
                btnEditQty.Enabled = false;
                btnApprove.Enabled = false;
                btnNotApprove.Enabled = false;
            }
            else
            {
                btnNotApprove.Enabled = false;
                btnApprove.Enabled = false;
                btnEditQty.Enabled = false;
            }
            dbconn.Close();
            lblUnit.Text = GridView1.SelectedRow.Cells[4].Text;
            PanelApprove.Visible = true;
            Panel2.Visible = false;

        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            string UpdatePCR = "Update PerchaseRequests SET PCRStatus = 'อนุมัติ' WHERE PCRID = '" + GridView1.SelectedRow.Cells[0].Text + "';";

            dbconn.QueryExecuteScalar(UpdatePCR);

            dbconn.Close();
            Panel3.Visible = false;
            Panel4.Visible = false;
        }

        protected void btnNotApprove_Click(object sender, EventArgs e)
        {
            Panel3.Visible = true;
            Panel4.Visible = false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string UpdatePCR = "Update PerchaseRequests SET PCRStatus = 'ไม่อนุมัติ', PCRRemark = '"+txtRemark.Text+"' WHERE PCRID = '" + GridView1.SelectedRow.Cells[0].Text + "';";

            dbconn.QueryExecuteScalar(UpdatePCR);

            dbconn.Close();
            Panel3.Visible = false;
        }

        protected void btnCancelUnApp_Click(object sender, EventArgs e)
        {
            Panel3.Visible = false;
        }

        protected void btnEditQty_Click(object sender, EventArgs e)
        {
            Panel4.Visible = true;
        }

        protected void btnSaveEdit_Click(object sender, EventArgs e)
        {
            try
            {
                string UpdatePCR = "Update PerchaseRequests SET PCRQty = " + Convert.ToDouble(TextBox2.Text) + " WHERE PCRID = '" + GridView1.SelectedRow.Cells[0].Text + "';";
                dbconn.QueryExecuteScalar(UpdatePCR);
                dbconn.Close();
                Panel4.Visible = false;
            }
            catch
            {
                MessageBox.Show("กรุณากรอกจำนวนวัตถุดิบให้ถูกต้อง");
            }
            
        }
    }
}