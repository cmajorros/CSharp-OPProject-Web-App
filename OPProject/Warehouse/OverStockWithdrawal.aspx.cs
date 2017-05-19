using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace OPProject.Warehouse
{
    public partial class OverStockWithdrawal : System.Web.UI.Page
    {
        clsDatabase dbconn = new clsDatabase();
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            String FindJobOrder = "Select * from JobOrders where (JobID Like '%" + txtFindJO.Text + "%' or CusName like '%" + txtFindJO.Text + "%') and JobStatus = 'กำลังผลิต';";
            DataTable dt = dbconn.QueryExecuteScalar(FindJobOrder);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            dbconn.Close();
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            string findJobItem = "SELECT     dbo.JobOrderItems.JobItemID, dbo.JobOrderItems.JobItemName, dbo.JobOrderItems.JobItemDes, dbo.JobOrderItems.JobItemQty, dbo.JobOrderItems.SizeID, dbo.Sizes.SizeName FROM  dbo.JobOrderItems INNER JOIN dbo.Sizes ON dbo.JobOrderItems.SizeID = dbo.Sizes.SizeID WHERE (JobID = '" + GridView1.SelectedRow.Cells[0].Text + "' AND JobItemStatus = 'กำลังผลิต');";
            DataTable dt = dbconn.QueryExecuteScalar(findJobItem);
            GridView2.DataSource = dt;
            GridView2.DataBind();

            dbconn.Close();
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            string findMat = "SELECT     dbo.JobOrderItems.JobItemQty, dbo.JobItemMaterials.RawID, dbo.JobItemMaterials.JobItemMatQty, dbo.JobItemMaterials.RawUnitName, dbo.JobItemMaterials.RawMatRecieveDate, dbo.JobItemMaterials.JobItemMatQty * dbo.JobOrderItems.JobItemQty AS TotalQuantity, dbo.RawMaterials.RawName, dbo.JobItemMaterials.JobItemMatID FROM  dbo.JobOrderItems INNER JOIN  dbo.JobItemMaterials ON dbo.JobOrderItems.JobItemID = dbo.JobItemMaterials.JobItemID INNER JOIN    dbo.RawMaterials ON dbo.JobItemMaterials.RawID COLLATE SQL_Latin1_General_CP1_CI_AS = dbo.RawMaterials.RawID WHERE     (dbo.JobOrderItems.JobItemID = '" + GridView2.SelectedRow.Cells[0].Text + "');";

            DataTable dt = dbconn.QueryExecuteScalar(findMat);
            GridView3.DataSource = dt;
            GridView3.DataBind();

        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {
            string checkPreviousWithdraw = "Select SUM(MatWithdrawQty)As SumWithdraw FROM MaterialWithdrawals WHERE JobItemID = '" + GridView2.SelectedRow.Cells[0].Text + "' And RawID = '" + GridView3.SelectedRow.Cells[1].Text + "' AND JobItemMatID = '"+GridView3.SelectedRow.Cells[0].Text+"'; ";
            DataTable dtCheckPreWithdraw = dbconn.QueryExecuteScalar(checkPreviousWithdraw);
            try
            {
               
                
                double TotalQty = Convert.ToDouble(GridView3.SelectedRow.Cells[5].Text);
                if (TotalQty > Convert.ToDouble(dtCheckPreWithdraw.Rows[0]["SumWithdraw"]))
                {
                    Panel4.Visible = false;
                    lblUnableWithdraw.Visible = true;
                }
                else
                {
                    Panel4.Visible = true;
                    lblUnableWithdraw.Visible = false;
                    lblJobItemID.Text = GridView2.SelectedRow.Cells[0].Text;
                    lblJobItemID.Text = GridView2.SelectedRow.Cells[0].Text;
                    lblRawID.Text = GridView3.SelectedRow.Cells[1].Text;
                    lblRawName.Text = GridView3.SelectedRow.Cells[2].Text;
                    lblTotalQty.Text = GridView3.SelectedRow.Cells[5].Text;
                    lblUnit1.Text = GridView3.SelectedRow.Cells[6].Text;
                    lblUnit2.Text = GridView3.SelectedRow.Cells[6].Text;

                    lblUnit4.Text = GridView3.SelectedRow.Cells[6].Text;

                    txtWithdrawQty.Text = "0.00";
                    lblDate.Text = DateTime.Now.Date.ToString("dd/MM/yyyy");

                    //findInstock 
                    string findInstockQty = "Select RawQty From RawMaterials Where RawID = '" + GridView3.SelectedRow.Cells[0].Text + "';";
                    DataTable dt = dbconn.QueryExecuteScalar(findInstockQty);
                    lblStock.Text = dt.Rows[0]["RawQty"].ToString();


                    string findWithdrawQty = "Select Sum(MatwithdrawQty) as sumWithdraw From MaterialWithdrawals WHERE JobId = '" + GridView1.SelectedRow.Cells[0].Text + "' AND JobItemID = '" + GridView2.SelectedRow.Cells[0].Text + "' AND  RawId = '" + GridView3.SelectedRow.Cells[1].Text + "';";

                    DataTable dtWithDrawQty = dbconn.QueryExecuteScalar(findWithdrawQty);

                    try
                    {
                        lblWithdrawQty.Text = dtWithDrawQty.Rows[0]["sumWithdraw"].ToString();
                    }
                    catch
                    {
                        lblWithdrawQty.Text = "0.00";
                    }
                    CalRemainedMat();
                    enablePurchasing();
                }
            }
            catch
            {
                Panel4.Visible = false;
                lblUnableWithdraw.Visible = true;
                
            }
        }

        private void CalRemainedMat()
        {
            try
            {
                double instock = Convert.ToDouble(lblStock.Text);
                double OverWithdraw = Convert.ToDouble(txtWithdrawQty.Text);
                lblRemainStock.Text = (instock - OverWithdraw).ToString();
            }
            catch
            {
                MessageBox.Show("กรุณาระบุจำนวนที่ต้องการเบิกวัตถุดิบให้ถูกต้อง");
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            CalRemainedMat();
            if (Convert.ToDouble(lblRemainStock.Text) >= 0)
            {
                string saveOverstock = "Insert Into MaterialWithdrawals(JobItemID,RawID,MatWithdrawQty,MatWithdrawDate,JobItemMatID,JobID,MatWithDrawRemark) VALUES ('" + GridView2.SelectedRow.Cells[0].Text + "', '" + GridView3.SelectedRow.Cells[1].Text + "',Getdate()," + GridView3.SelectedRow.Cells[0].Text + ",'" + GridView1.SelectedRow.Cells[0].Text + "', '" + TextBox1.Text + "');";
                dbconn.QueryExecuteScalar(saveOverstock);
                
                string deductStock = "Update RawMaterials SET Rawqty = " + lblRemainStock.Text + " WHERE RawID = '" + GridView3.SelectedRow.Cells[1].Text + "';";

                dbconn.QueryExecuteScalar(deductStock);

                dbconn.Close();

            }
            else
            {
                MessageBox.Show("ไม่สามารถเบิกสินค้าเกินจำนวนที่มีอยู่ในคลังได้");

            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            CalRemainedMat();
            enablePurchasing();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            //RunID
            string RunID = "SELECT MAX(PCRID) AS MAXPR From PerchaseRequests ; ";
            DataTable dt = dbconn.QueryExecuteScalar(RunID);
            string fullPR = "";
            try
            {
                string PRNo = dt.Rows[0]["MAXPR"].ToString();
                int CurYear = Convert.ToInt32(DateTime.Now.Year);
                int DBYear = Convert.ToInt32(PRNo.Substring(3, 4));


                if (CurYear > DBYear)
                {
                    fullPR = "PR-" + CurYear.ToString() + "00001";

                }
                else
                {
                    int CurRunID = Convert.ToInt32(PRNo.Substring(7, 5));
                    int NewID = CurRunID + 1;
                    string NewRunID = NewID.ToString("00000");
                    fullPR = "PR-" + DBYear.ToString() + NewRunID;

                }
            }
            catch
            {
                fullPR = "PR-" + DateTime.Now.Year.ToString() + "00001";
            }
            
            double PurchaseQty = (Convert.ToDouble(lblRemainStock.Text)*(-1));
            string SavePR = "Insert into PerchaseRequests(PCRID,PCRQty,PCRDate,PCRStatus,RawID,JobItemID,JobID,PCRReason,PCRUnit) VALUES ('" + fullPR + "'," + PurchaseQty + ", Getdate(),'รออนุมัติ', '" + lblRawID.Text + "', '" + lblJobItemID.Text + "','" + GridView1.SelectedRow.Cells[0].Text + "','"+TextBox1.Text+"','"+lblUnit1.Text+"');";
            dbconn.QueryExecuteScalar(SavePR);

            dbconn.Close();

            Session["PCRID"] = fullPR.ToString();
            Response.Redirect("~/Purchasing/PurchaseRequest.aspx");
           
                
        }
        private void RunPR()
        {
            //RunID
            string RunID = "SELECT MAX(PCRID) AS MAXPR From PerchaseRequests ; ";
            DataTable dt = dbconn.QueryExecuteScalar(RunID);
            string fullPR = "";
            try
            {
                string PRNo = dt.Rows[0]["MAXPR"].ToString();
                int CurYear = Convert.ToInt32(DateTime.Now.Year);
                int DBYear = Convert.ToInt32(PRNo.Substring(3, 4));


                if (CurYear > DBYear)
                {
                    fullPR = "PR-" + CurYear.ToString() + "00001";

                }
                else
                {
                    int CurRunID = Convert.ToInt32(PRNo.Substring(7, 5));
                    int NewID = CurRunID + 1;
                    string NewRunID = NewID.ToString("00000");
                    fullPR = "PR-" + DBYear.ToString() + NewRunID;

                }
            }
            catch
            {
                fullPR = "PR-" + DateTime.Now.Year.ToString() + "00001";
            }
            
        }
        private void enablePurchasing()
        {
            if (Convert.ToDouble(lblRemainStock.Text) < 0)
            {
                Button4.Enabled = true;
                Button2.Enabled = false;

            }
            else
            {
                Button4.Enabled = false;
                Button2.Enabled = true;
            }
        }
    }
}