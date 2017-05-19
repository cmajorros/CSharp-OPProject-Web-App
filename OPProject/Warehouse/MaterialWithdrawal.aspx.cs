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
    public partial class MaterialWithdrawal : System.Web.UI.Page
    {
        clsDatabase dbconn = new clsDatabase();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            String FindJobOrder = "Select * from JobOrders where (JobID Like '%" + txtFindJO.Text + "%' or CusName like '%" + txtFindJO.Text + "%') and JobStatus = 'รอการผลิต';";
            DataTable dt = dbconn.QueryExecuteScalar(FindJobOrder);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            dbconn.Close();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string findJobItem = "SELECT     dbo.JobOrderItems.JobItemID, dbo.JobOrderItems.JobItemName, dbo.JobOrderItems.JobItemDes, dbo.JobOrderItems.JobItemQty, dbo.JobOrderItems.SizeID, dbo.Sizes.SizeName FROM         dbo.JobOrderItems INNER JOIN dbo.Sizes ON dbo.JobOrderItems.SizeID = dbo.Sizes.SizeID WHERE (JobID = '"+GridView1.SelectedRow.Cells[0].Text+"');";
            DataTable dt = dbconn.QueryExecuteScalar(findJobItem);
            GridView2.DataSource = dt;
            GridView2.DataBind();

            dbconn.Close();
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            string findMat = "SELECT     dbo.JobOrderItems.JobItemQty, dbo.JobItemMaterials.RawID, dbo.JobItemMaterials.JobItemMatQty, dbo.JobItemMaterials.RawUnitName, dbo.JobItemMaterials.RawMatRecieveDate, dbo.JobItemMaterials.JobItemMatQty * dbo.JobOrderItems.JobItemQty AS TotalQuantity, dbo.RawMaterials.RawName, dbo.JobItemMaterials.JobItemMatID FROM  dbo.JobOrderItems INNER JOIN  dbo.JobItemMaterials ON dbo.JobOrderItems.JobItemID = dbo.JobItemMaterials.JobItemID INNER JOIN    dbo.RawMaterials ON dbo.JobItemMaterials.RawID COLLATE SQL_Latin1_General_CP1_CI_AS = dbo.RawMaterials.RawID WHERE     (dbo.JobOrderItems.JobItemID = '"+GridView2.SelectedRow.Cells[0].Text+"');";

            DataTable dt = dbconn.QueryExecuteScalar(findMat);
            GridView3.DataSource = dt;
            GridView3.DataBind();

        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblJobItemID.Text = GridView2.SelectedRow.Cells[0].Text;
            lblRawID.Text = GridView3.SelectedRow.Cells[1].Text;
            lblRawName.Text = GridView3.SelectedRow.Cells[2].Text;
            lblTotalQty.Text = GridView3.SelectedRow.Cells[5].Text;
            lblUnit1.Text = GridView3.SelectedRow.Cells[6].Text;
            lblUnit2.Text = GridView3.SelectedRow.Cells[6].Text;
            lblUnit3.Text = GridView3.SelectedRow.Cells[6].Text;
            lblUnit4.Text = GridView3.SelectedRow.Cells[6].Text;
            lblUnit5.Text = GridView3.SelectedRow.Cells[6].Text;
            lblUnit6.Text = GridView3.SelectedRow.Cells[6].Text;

            txtWithdrawQty.Text = "0.00";
            lblDate.Text = DateTime.Now.Date.ToString("dd/MM/yyyy");

            string findWithdrawQty = "Select SUM(MatWithdrawQty) AS SumWithdrawMat FROM MaterialWithdrawals WHERE JobItemID = '" + GridView2.SelectedRow.Cells[0].Text + "' AND JobItemMatID = '" + GridView3.SelectedRow.Cells[0].Text + "';";
            DataTable dt = dbconn.QueryExecuteScalar(findWithdrawQty);
            try
            {
                
                if (Convert.ToDouble(GridView3.SelectedRow.Cells[5].Text) > Convert.ToDouble(dt.Rows[0]["SumWithdrawMat"]))
                {
                   
                    txtWithdrawQty.Text = "0.00";
                    txtWithdrawQty.Enabled = false;
                    lblWithdrawQty.Text = dt.Rows[0]["SumWithdrawMat"].ToString();
                    


                }
                else if (Convert.ToDouble(GridView3.SelectedRow.Cells[5].Text) == Convert.ToDouble(dt.Rows[0]["SumWithdrawMat"]))
                {
                    txtWithdrawQty.Enabled = false;
                    lblWithdrawQty.Text = Convert.ToDouble(dt.Rows[0]["SumWithdrawMat"]).ToString();

                }
                else
                {
                   
                    txtWithdrawQty.Enabled = true;
                    lblWithdrawQty.Text = Convert.ToDouble(dt.Rows[0]["SumWithdrawMat"]).ToString();
                }
            }

            catch
            {
                lblWithdrawQty.Text = "0.00";
            }

            
            double RequireQty = Convert.ToDouble(lblTotalQty.Text);
            double WithdrawQty = Convert.ToDouble(lblWithdrawQty.Text);
            double Remain;
            Remain = RequireQty - WithdrawQty;
            lblRemainQty.Text = Remain.ToString("#,###.00");
            
            if (Remain >= 0)
            {
                
                RadioButtonList1.SelectedValue = "ยังเบิกสินค้ายังไม่ครบ";
            }
            else
            {
                RadioButtonList1.SelectedValue = "เบิกสินค้าครบแล้ว";
            }

            if (RadioButtonList1.SelectedValue == "เบิกสินค้าครบแล้ว")
            {
                txtWithdrawQty.Text = "0.00";
                txtWithdrawQty.Enabled = false;
            }
            else
            {
                txtWithdrawQty.Enabled = true;
            }

            string Stock = "SELECT * FROM RawMaterials WHERE RawID = '" + GridView3.SelectedRow.Cells[0].Text + "';";

            DataTable dtStock = dbconn.QueryExecuteScalar(Stock);

            try
            {
                string stockQty = dtStock.Rows[0]["RawQty"].ToString();
                lblStock.Text = stockQty;
            }
            catch
            {
                lblStock.Text = "0.00";
            }

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            CalculateNewRemain();


        }
        private void CalculateNewRemain()
        {
            try
            {
                double Remain = Convert.ToDouble(lblRemainQty.Text);
                double NewWithdraw = Convert.ToDouble(txtWithdrawQty.Text);
                lblNewRemain.Text = (Remain - NewWithdraw).ToString();
                lblRemainStock.Text = (Convert.ToDouble(lblStock.Text) - NewWithdraw).ToString();

               
            }
            catch
            {
                MessageBox.Show("กรุณากรอกจำนวนสินค้าที่ต้องการเบิกให้ถูกต้อง");
            }


        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                double Remain = Convert.ToDouble(lblRemainQty.Text);
                double NewWithdraw = Convert.ToDouble(txtWithdrawQty.Text);
                lblNewRemain.Text = (Remain - NewWithdraw).ToString();


            }
            catch
            {
                MessageBox.Show("กรุณากรอกจำนวนสินค้าที่ต้องการเบิกให้ถูกต้อง");
            }


            if (Convert.ToDouble(lblNewRemain.Text) < 0)
            {
                MessageBox.Show("ไม่สามารถเบิกวัตถุดิบเกินจำนวนวัตถุดิบที่ใช้จริงได้");
            }
            else if (Convert.ToDouble(txtWithdrawQty.Text) == 0)
            {
                MessageBox.Show("ปริมาณสินค้าที่ต้องการเบิกควรมีค่ามากกว่า 0 ");
            }

            else
            { 
            //Withdraw and adjust stock balance

                string withdrawRawMat = "UPDATE RawMaterials SET RawQty = RawQty-" + Convert.ToDouble(txtWithdrawQty.Text) + " WHERE RawID = '" + lblRawID.Text + "';";

                dbconn.QueryExecuteScalar(withdrawRawMat);

                string SaveWithdrawItem = "INSERT INTO MaterialWithdrawals(JobItemID,RawID,MatWithdrawQty,MatWithdrawDate,MatWithdrawRemain,JobItemMatID,JobID) VALUES ('" + GridView2.SelectedRow.Cells[0].Text + "','" + lblRawID.Text + "'," + Convert.ToDouble(txtWithdrawQty.Text) + ",'" + DateTime.Now.Date.ToString("yyyy-MM-dd") + "'," + Convert.ToDouble(lblNewRemain.Text) + ",'" + GridView3.SelectedRow.Cells[0].Text + "','" + GridView1.SelectedRow.Cells[0].Text + "');";
                dbconn.QueryExecuteScalar(SaveWithdrawItem);

                string UpdateJobItemStatus = "UPDATE JobOrderItems SET JobItemStatus = 'กำลังผลิต' WHERE JobItemID = '"+GridView2.SelectedRow.Cells[0].Text+"';";
                dbconn.QueryExecuteScalar(UpdateJobItemStatus);

                string UpdateJobStatus = "Update JobOrders Set JobStatus = 'กำลังผลิต' WHERE JobID = '" + GridView1.SelectedRow.Cells[0].Text + "';";
                dbconn.QueryExecuteScalar(UpdateJobStatus);


                dbconn.Close();

                // check สินค้าที่มีอยูุในคลังแล้ว มาเบิกยังไง 
            }
        }
    }
}