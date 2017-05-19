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
    public partial class RecieveFG : System.Web.UI.Page
    {
        clsDatabase dbconn = new clsDatabase();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            String FindJobOrder = "Select * from JobOrders where JobStatus = 'กำลังผลิต' And (JobID Like '%" + txtFindJO.Text + "%' or CusName like '%" + txtFindJO.Text + "%');";
            DataTable dt = dbconn.QueryExecuteScalar(FindJobOrder);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            dbconn.Close();
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblJobID.Text = GridView1.SelectedRow.Cells[0].Text;
            lblJobItemID.Text = GridView2.SelectedRow.Cells[0].Text;
            lblJobItemDes.Text = GridView2.SelectedRow.Cells[1].Text;
            lblQty.Text = GridView2.SelectedRow.Cells[3].Text;
            lblUnit.Text = "  ชิ้น";

            string findRemainedRecieve = "SELECT Sum(FGQty) as TotalRecieve FROM FG WHERE JobID = '" + GridView1.SelectedRow.Cells[0].Text + "' AND JobItemID = '" + GridView2.SelectedRow.Cells[0].Text + "';";
            DataTable dt = dbconn.QueryExecuteScalar(findRemainedRecieve);
            try
            {
                if (dt.Rows[0]["TotalRecieve"].ToString() == null)
                {
                    lblRecieveQty.Text = "0";
                }
                else
                {
                    int RecieveQty = Convert.ToInt32(dt.Rows[0]["TotalRecieve"]);
                    lblRecieveQty.Text = RecieveQty.ToString();
                }

            }
            catch
            {
                lblRecieveQty.Text = "0";
            }
            RadioButtonList1.SelectedValue = "รับสินค้าทั้งหมด";


            CalQty();
            string Deldate = Convert.ToDateTime(GridView1.SelectedRow.Cells[3].Text).ToString("ddMMyyyy");
            string delDay = Deldate.Substring(0, 2);
            string delMonth = Deldate.Substring(2, 2);
            string delYear = Deldate.Substring(4, 4);
            int NewDelDate = Convert.ToInt32(delYear + delMonth + delDay);

            string Curdate = DateTime.Now.Date.ToString("ddMMyyyy");
            string CurDay = Curdate.Substring(0, 2);
            string CurMonth = Curdate.Substring(2, 2);
            string CurYear = Curdate.Substring(4, 4);
            int newCurdate = Convert.ToInt32(CurYear + CurMonth + CurDay);

            if (newCurdate > NewDelDate)
            {
                PanelLateDel.Visible = true;

            }
            else
            {
                PanelLateDel.Visible = false;
            }
            RadioButtonList1.SelectedValue = "รับสินค้าทั้งหมด";
            
            
            
        }
        private void CalQty()
        {
            try
            {
                if (RadioButtonList1.SelectedValue == "รับสินค้าทั้งหมด")
                {
                    txtNewDelQty.Text = (Convert.ToInt32(lblQty.Text) - Convert.ToInt32(lblRecieveQty.Text)).ToString();
                int TotalQtr = Convert.ToInt32(lblQty.Text);
                int DelQty = Convert.ToInt32(lblRecieveQty.Text);
                int NewDel = Convert.ToInt32(txtNewDelQty.Text);
                int Remain;

                Remain = (TotalQtr - DelQty) - NewDel;
                lblRemainedRecieve.Text = Remain.ToString();
                }
                else if (RadioButtonList1.SelectedValue == "รับสินค้าบางส่วน")
                { 
                    if (Convert.ToInt32(txtNewDelQty.Text) >= ((Convert.ToInt32(lblQty.Text) - Convert.ToInt32(lblRecieveQty.Text))))
                    {
                        MessageBox.Show("จำนวนสินค้าควรมีค่าน้อยกว่า "+((Convert.ToInt32(lblQty.Text) - Convert.ToInt32(lblRecieveQty.Text))+"  ชิ้น" ));

                    }
                        else
                    {
                int TotalQtr = Convert.ToInt32(lblQty.Text);
                int DelQty = Convert.ToInt32(lblRecieveQty.Text);
                int NewDel = Convert.ToInt32(txtNewDelQty.Text);
                int Remain;

                Remain = (TotalQtr - DelQty) - NewDel;
                lblRemainedRecieve.Text = Remain.ToString();
                    }
                }

                else
                {
                if (Convert.ToInt32(txtNewDelQty.Text) < ((Convert.ToInt32(lblQty.Text) - Convert.ToInt32(lblRecieveQty.Text))))
                    {
                        MessageBox.Show("จำนวนสินค้าควรมีค่ามากกว่า "+((Convert.ToInt32(lblQty.Text) - Convert.ToInt32(lblRecieveQty.Text))+"  ชิ้น" ));

                    }
                        else
                    {
                int TotalQtr = Convert.ToInt32(lblQty.Text);
                int DelQty = Convert.ToInt32(lblRecieveQty.Text);
                int NewDel = Convert.ToInt32(txtNewDelQty.Text);
                int Remain;

                Remain = (TotalQtr - DelQty) - NewDel;
                lblRemainedRecieve.Text = Remain.ToString();
                    }
                }
                

            }
            catch
            {
                MessageBox.Show("กรุณากรอกจำนวนการรับสินค้าให้ถูกต้อง");
            }
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string findJobItem = "SELECT     dbo.JobOrderItems.JobItemID, dbo.JobOrderItems.JobItemName, dbo.JobOrderItems.JobItemDes, dbo.JobOrderItems.JobItemQty, dbo.JobOrderItems.SizeID, dbo.Sizes.SizeName FROM         dbo.JobOrderItems INNER JOIN dbo.Sizes ON dbo.JobOrderItems.SizeID = dbo.Sizes.SizeID WHERE (JobID = '" + GridView1.SelectedRow.Cells[0].Text + "' and JobItemStatus = 'กำลังผลิต');";
            DataTable dt = dbconn.QueryExecuteScalar(findJobItem);
            GridView2.DataSource = dt;
            GridView2.DataBind();

            dbconn.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            CalQty();

            try
            {

                if (txtNewDelQty.Text == "0" || txtNewDelQty.Text == "")
                {
                    MessageBox.Show("กรุณากรอกจำนวนสินค้า");
                
                }
                else
                {
                if (PanelLateDel.Visible == true)
                {
                    string saveFG = "Insert into FG(JobID,JobItemID,FGQty,FGRecieveDate,FGRemark) VALUES ('" + GridView1.SelectedRow.Cells[0].Text + "', '" + GridView2.SelectedRow.Cells[0].Text + "'," + Convert.ToInt32(txtNewDelQty.Text) + ",GetDate(),'" + TextBox1.Text + "');";
                    dbconn.QueryExecuteScalar(saveFG);


                }
                else
                {
                    string saveFG = "Insert into FG(JobID,JobItemID,FGQty,FGRecieveDate) VALUES ('" + GridView1.SelectedRow.Cells[0].Text + "', '" + GridView2.SelectedRow.Cells[0].Text + "'," + Convert.ToInt32(txtNewDelQty.Text) + ",Getdate());";
                    dbconn.QueryExecuteScalar(saveFG);

                }

                if (Convert.ToInt32(lblRemainedRecieve.Text) <= 0)
                {
                    string UpdateJobItemStatus = "Update JobOrderItems SET JobItemStatus = 'ผลิตสินค้าครบแล้ว' WHERE JobItemID = '" + GridView2.SelectedRow.Cells[0].Text + "' AND JobID = '" + GridView1.SelectedRow.Cells[0].Text + "';";
                    dbconn.QueryExecuteScalar(UpdateJobItemStatus);

                }
                else
                {
                    string UpdateJobItemStatus = "Update JobOrderItems SET JobItemStatus = 'ผลิตสินค้าเสร็จแล้วบางส่วน' WHERE JobItemID = '" + GridView2.SelectedRow.Cells[0].Text + "' AND JobID = '" + GridView1.SelectedRow.Cells[0].Text + "';";
                    dbconn.QueryExecuteScalar(UpdateJobItemStatus);
                }
                dbconn.Close();
            }
            }
            catch
            {
                MessageBox.Show("กรุณากรอกจำนวนรับสินค้าให้ถูกต้อง");
            }
        }
        
    

        protected void btnCal_Click(object sender, EventArgs e)
        {
            CalQty();
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RadioButtonList1.SelectedValue == "รับสินค้าทั้งหมด")
            {
                txtNewDelQty.Text = (Convert.ToInt32(lblQty.Text) - Convert.ToInt32(lblRecieveQty.Text)).ToString();
                txtNewDelQty.Enabled = false;
            }
            else if (RadioButtonList1.SelectedValue == "รับสินค้าบางส่วน")
            {
                txtNewDelQty.Text = "0";
                txtNewDelQty.Enabled = true;
            }
            else 
            {
                txtNewDelQty.Text = "0";
                txtNewDelQty.Enabled = true;
            }

        }
    }
}