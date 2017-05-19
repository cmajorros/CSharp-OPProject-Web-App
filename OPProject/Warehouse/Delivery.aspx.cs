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
    public partial class Delivery : System.Web.UI.Page
    {
        clsDatabase dbconn = new clsDatabase();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            String FindJobOrder = "Select * from JobOrders where JobID Like '%" + txtFindJO.Text + "%' or CusName like '%" + txtFindJO.Text + "%' and JobStatus = 'ผลิตสินค้าเสร็จแล้ว';";
            DataTable dt = dbconn.QueryExecuteScalar(FindJobOrder);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            dbconn.Close();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string findJobItem = "SELECT     dbo.JobOrderItems.JobItemID, dbo.JobOrderItems.JobItemName, dbo.JobOrderItems.JobItemDes, dbo.JobOrderItems.JobItemQty, dbo.JobOrderItems.SizeID, dbo.Sizes.SizeName FROM         dbo.JobOrderItems INNER JOIN dbo.Sizes ON dbo.JobOrderItems.SizeID = dbo.Sizes.SizeID WHERE (JobID = '" + GridView1.SelectedRow.Cells[0].Text + "' and JobItemStatus = 'ผลิตเสร็จแล้ว');";
            DataTable dt = dbconn.QueryExecuteScalar(findJobItem);
            GridView2.DataSource = dt;
            GridView2.DataBind();

            dbconn.Close();
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblJobID.Text = GridView1.SelectedRow.Cells[0].Text;
            lblJobItemID.Text = GridView2.SelectedRow.Cells[0].Text;
            lblJobItemDes.Text = GridView2.SelectedRow.Cells[1].Text;
            lblQty.Text = GridView2.SelectedRow.Cells[3].Text;
            lblUnit.Text = "  ชิ้น";
            
            string sumDelQty = "SELECT SUM(DelivertQty) AS SumDel FROM  dbo.Delivery WHERE (JobItemID = '" + GridView2.SelectedRow.Cells[0].Text + "');";
            DataTable dt = dbconn.QueryExecuteScalar(sumDelQty);
            try
            {
                lblDelQty.Text = dt.Rows[0]["SumDel"].ToString();
            }
            catch
            {
                lblDelQty.Text = "0.00";
            }
            dbconn.Close();

            RadioButtonList1.SelectedValue = "ส่งมอบทั้งหมด";
            CalQty();
            txtNewDelQty.Text = (Convert.ToDouble(lblQty.Text) - Convert.ToDouble(lblDelQty.Text)).ToString();
            CalQty();
            txtNewDelQty.Enabled = false;

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


        }
        private void CalQty()
        {
            try
            {
                double TotalQtr = Convert.ToDouble(lblQty.Text);
                double DelQty = Convert.ToDouble(lblDelQty.Text);
                double NewDel = Convert.ToDouble(txtNewDelQty.Text);
                double Remain;

                Remain = (TotalQtr - DelQty) - NewDel;
                lblRemainDel.Text = Remain.ToString();
               


            }
            catch
            {
                MessageBox.Show("กรุณากรอกจำนวนการส่งสินค้าให้ถูกต้อง");
            }
        }

        protected void btnCal_Click(object sender, EventArgs e)
        {
            CalQty();
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RadioButtonList1.SelectedValue == "ส่งมอบทั้งหมด")
            {
                txtNewDelQty.Enabled = false;
                double TotalQtr = Convert.ToDouble(lblQty.Text);
                double DelQty = Convert.ToDouble(lblDelQty.Text);
                txtNewDelQty.Text = (TotalQtr - DelQty).ToString();
                CalQty();
            }
            else
            {
                txtNewDelQty.Enabled = true;
                txtNewDelQty.Text = "0.00";
                CalQty();

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            CalQty();
            if (Convert.ToDouble(txtNewDelQty.Text) <= 0.00)
            {
                MessageBox.Show("กรุณาระบุุจำนวนสินค้าที่ต้องการส่งมอบด้วยค่ะ");
            }
            else
            {
                if (PanelLateDel.Visible == false)
                {
                    string SaveDelivery = "INSERT INTO Delivery(RealDeliveryDate,JobItemID,JobID,DeliveryQty) VALUES (Getdate(),'" + GridView2.SelectedRow.Cells[0].Text + "','" + GridView1.SelectedRow.Cells[0].Text + "', '" + Convert.ToDouble(txtNewDelQty.Text) + "');";
                    dbconn.QueryExecuteScalar(SaveDelivery);
                }
                else
                {
                    // Remark for LateDel 
                    string SaveDelivery = "INSERT INTO Delivery(RealDeliveryDate,JobItemID,JobID,DeliveryQty,RemarkLateDelivery) VALUES (Getdate(),'" + GridView2.SelectedRow.Cells[0].Text + "','" + GridView1.SelectedRow.Cells[0].Text + "', '" + Convert.ToDouble(txtNewDelQty.Text) + "','"+TextBox1.Text+"');";
                    dbconn.QueryExecuteScalar(SaveDelivery);
                }

               string status;

                if (Convert.ToDouble(lblRemainDel.Text) <= 0)
                { 
                    status = "จัดส่งสินค้าครบถ้วน";
                
                }
                else
                {
                    status = "ยังส่งสิยค้าไม่ครบ";
                }
                string UpdateJobItemStatus = "Update JobOrderItems SET JobItemStatus = '"+status+"' WHERR JobItemID ='"+GridView2.SelectedRow.Cells[0].Text+"' ;";
                dbconn.QueryExecuteScalar(UpdateJobItemStatus);

                // Checkว่าครบทุก Item ยัง
                string CheckDeliveryall = "Select JobItemStatus FROM JobOrderItems WHERE JobID = '" + GridView1.SelectedRow.Cells[0].Text + "';";
                DataTable dt = dbconn.QueryExecuteScalar(CheckDeliveryall);
                int Row = dt.Rows.Count;



                if ((Row == 1) && (dt.Rows[0]["JobItemStatus"].ToString() != "จัดส่งสินค้าครบถ้วน"))
                    {
                        string CloseJobOrder = "Update JobOrders Set JobStatus = 'จัดส่งสินค้าครบเรียบร้อยแล้ว' WHERE JobID = '"+GridView1.SelectedRow.Cells[0].Text+"';";
                        dbconn.QueryExecuteScalar(CloseJobOrder);
                    }
                    else
                    {
                        
                    }


               
            }

            dbconn.Close();
        }
    }
}