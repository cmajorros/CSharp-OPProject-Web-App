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
    public partial class RecieveRawMat : System.Web.UI.Page
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
            string findMat = "SELECT     dbo.ContactSuppliers.SupID, dbo.ContactSuppliers.RecieveMatStatus,dbo.ContactSuppliers.JobID, dbo.ContactSuppliers.ContactSupCost, dbo.ContactSuppliers.RawID, dbo.ContactSuppliers.SelectSup, dbo.ContactSuppliers.RawUnit, dbo.ContactSuppliers.CurrencyUnit, dbo.ContactSuppliers.RawQty, dbo.ContactSuppliers.UnitPrice, dbo.ContactSuppliers.VAT,  dbo.ContactSuppliers.NetTotal, dbo.RawMaterials.RawName,(SELECT  PRID FROM dbo.PR WHERE      (JobID = '" + GridView1.SelectedRow.Cells[0].Text + "')) AS PR,(SELECT     PRDelDate FROM          dbo.PR AS PR_1 WHERE      (JobID = '" + GridView1.SelectedRow.Cells[0].Text + "')) AS PRDelDate, dbo.Suppliers.SupName FROM   dbo.ContactSuppliers INNER JOIN dbo.RawMaterials ON dbo.ContactSuppliers.RawID = dbo.RawMaterials.RawID AND dbo.ContactSuppliers.SelectSup = 'Yes'  INNER JOIN dbo.Suppliers ON dbo.ContactSuppliers.SupID = dbo.Suppliers.SupID WHERE     (dbo.ContactSuppliers.JobID = '" + GridView1.SelectedRow.Cells[0].Text + "');";

            DataTable dt = dbconn.QueryExecuteScalar(findMat);
            GridView2.DataSource = dt;
            GridView2.DataBind();
            dbconn.Close();
            Panel2.Visible = true;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
           
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            string findMat = "SELECT * FROM  RawMaterials WHERE RawID = '" + GridView2.SelectedRow.Cells[0].Text + "';";
            DataTable dt = dbconn.QueryExecuteScalar(findMat);

            lblRawID.Text = dt.Rows[0]["RawID"].ToString();
            lblRawName.Text = dt.Rows[0]["RawName"].ToString();
            lblInStockQTY.Text = dt.Rows[0]["RawQty"].ToString();
            lblOrderQty.Text = GridView2.SelectedRow.Cells[5].Text;
            lblUnit.Text = GridView2.SelectedRow.Cells[6].Text;
            lblUnit1.Text = GridView2.SelectedRow.Cells[6].Text;
            lblUnit2.Text = GridView2.SelectedRow.Cells[6].Text;
            lblUnit3.Text = GridView2.SelectedRow.Cells[6].Text;
            
            

            // 
            string CheckRecieveHistory = "select * FROM RecieveMats WHERE JobID = '"+GridView1.SelectedRow.Cells[0].Text+"' AND SupId = '"+GridView2.SelectedRow.Cells[1].Text+"' AND RawId = '"+GridView2.SelectedRow.Cells[0].Text+"' ;";

            DataTable dt2 = dbconn.QueryExecuteScalar(CheckRecieveHistory);
            int Row = dt2.Rows.Count;
            try
            {
                string findRemainedQty = "Select Sum(RecieveQty) As Sum FROM RecieveMats WHERE JobID = '" + GridView1.SelectedRow.Cells[0].Text + "' AND RawID = '" + GridView2.SelectedRow.Cells[0].Text + "' AND SupId = '" + GridView2.SelectedRow.Cells[1].Text + "' ; ";
                DataTable dtRemained = dbconn.QueryExecuteScalar(findRemainedQty);
                double Recieve = Convert.ToDouble(dtRemained.Rows[0]["Sum"]);
                double TotalRequire = Convert.ToDouble(GridView2.SelectedRow.Cells[5].Text);
                double Remain = TotalRequire - Recieve;

                if (Row > 0)
                {
                    
                    txtRecieveQty.Text = Remain.ToString();
                    RadioButtonList1.SelectedValue = "สินค้าค้างรับ";
                }
                    
                else
                {
                    txtRecieveQty.Text = GridView2.SelectedRow.Cells[5].Text;
                    RadioButtonList1.SelectedValue = "รับสินค้าทั้งหมด";
                }
            }
            catch
            {
                RadioButtonList1.SelectedValue = "รับสินค้าทั้งหมด";
                txtRecieveQty.Text = GridView2.SelectedRow.Cells[5].Text;
            }
 
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RadioButtonList1.SelectedValue == "รับสินค้าทั้งหมด")
            {
                txtRecieveQty.Text = GridView2.SelectedRow.Cells[5].Text;
                txtRecieveQty.Enabled = true;
            }
            else if (RadioButtonList1.SelectedValue == "รับสินค้าบางส่วน")
            {
                txtRecieveQty.Enabled = true;
                txtRecieveQty.Text = "0.00";
                
            }
            else
            {
                

                string findRemainedQty = "Select Sum(RecieveQty) As Sum FROM RecieveMats WHERE JobID = '"+GridView1.SelectedRow.Cells[0].Text+"' AND RawID = '"+GridView2.SelectedRow.Cells[0].Text+"' ; ";

                DataTable dt =  dbconn.QueryExecuteScalar(findRemainedQty);
                double RemainedMat = 0.00;
                try
                {
                    double RecievedMat = Convert.ToDouble(dt.Rows[0]["Sum"]);
                    double RequiredMat = Convert.ToDouble(lblOrderQty.Text);
                    RemainedMat = RequiredMat - RequiredMat;
                    txtRecieveQty.Text = RequiredMat.ToString();
                    
                    double Remain = 0.00;
                    double Recieve = Convert.ToDouble(txtRecieveQty.Text);
                    Remain = Convert.ToDouble(lblOrderQty.Text) - Recieve;
                    lblRemain.Text = Remain.ToString();
                    dbconn.Close();
                }
                catch
                {
                    RemainedMat = 0.00;
                }


            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            CalInStockTotal();
        }
        private void CalInStockTotal()
        {

            try
            {
                double InStock = Convert.ToDouble(lblInStockQTY.Text);
                double Recieve = Convert.ToDouble(txtRecieveQty.Text);
                double Total = 0.00;
                double Remain = 0.00;
                Total = InStock + Recieve;

                lblTotalQty.Text = Total.ToString();
                Remain = Convert.ToDouble(lblOrderQty.Text) - Recieve;
                lblRemain.Text = Remain.ToString();

            }
            catch

            {
                MessageBox.Show("กรุณากรอกจำนวนวัตถุดิบให้ถูกต้อง");

            }

        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
           
                          try
                            {
                    double InStock = Convert.ToDouble(lblInStockQTY.Text);
                    double Recieve = Convert.ToDouble(txtRecieveQty.Text);
                    double Total = 0.00;
                    Total = InStock + Recieve;
                    lblTotalQty.Text = Total.ToString();
                            }
                            catch

                            {
                            MessageBox.Show("กรุณากรอกจำนวนวัตถุดิบให้ถูกต้อง");

                            }

            try
            {
                        if (GridView2.SelectedRow.Cells[11].Text != "รับวัตถุดิบแล้วครบถ้วน")
                        {
                            string UpdateDelDate = "Update PR SET RecieveDate = Getdate() WHERE PRID = '" + GridView2.SelectedRow.Cells[9].Text + "';";
                            dbconn.QueryExecuteScalar(UpdateDelDate);

                            string UpdateJobStatus = "Update JobOrders Set JobStatus ='รอการผลิต' WHERE JobID = '" + GridView1.SelectedRow.Cells[0].Text + "';";
                            dbconn.QueryExecuteScalar(UpdateJobStatus);

                            string UpdateRawMatforJobItemDate = "UPdate JobItemMaterials SET RawMatRecieveDate = GetDate() WHERE JobItemID like '%" + GridView1.SelectedRow.Cells[0].Text + "%' AND RawID = '" + GridView2.SelectedRow.Cells[0].Text + "';";

                            dbconn.QueryExecuteScalar(UpdateRawMatforJobItemDate);


                                double InStock = Convert.ToDouble(lblInStockQTY.Text);
                                double Recieve = Convert.ToDouble(txtRecieveQty.Text);
                                double Total = 0.00;
                                Total = InStock + Recieve;                         
                            string UpdateQtyInStock = "Update RawMaterials SET RawQty = " + Total + " WHERE RawID = '" + GridView2.SelectedRow.Cells[0].Text + "';";

                            dbconn.QueryExecuteScalar(UpdateQtyInStock);


                            string RecieveStatus = "";
                                if (RadioButtonList1.SelectedValue == "รับสินค้าทั้งหมด")
                                {
                                    RecieveStatus = "รับวัตถุดิบแล้วครบถ้วน";
                                }
                                else if (RadioButtonList1.SelectedValue == "รับสินค้าบางส่วน")
                                
                                {
                                RecieveStatus = "รับสินค้าบางส่วน";
                                }
                            else 
                                {
                                    RecieveStatus = "รับวัตถุดิบแล้วครบถ้วน";
                                }
                            string UpdateContactSupRecieveMatStatus = "Update ContactSuppliers SET RecieveMatStatus = '"+RecieveStatus+"' WHERE JobID = '" + GridView1.SelectedRow.Cells[0].Text + "' AND RawID = '" + GridView2.SelectedRow.Cells[0].Text + "' AND SupID = '" + GridView2.SelectedRow.Cells[1].Text + "'; ";
                            dbconn.QueryExecuteScalar(UpdateContactSupRecieveMatStatus);

                            string InsertRecieveMat = "Insert INTO RecieveMats(JobID, SupID, RawID,RecieveDate,RecieveQty) VALUES ('" + GridView1.SelectedRow.Cells[0].Text + "','" + GridView2.SelectedRow.Cells[1].Text + "','" + GridView2.SelectedRow.Cells[0].Text + "',GetDate(),"+Convert.ToDouble(txtRecieveQty.Text)+");";
                            dbconn.QueryExecuteScalar(InsertRecieveMat);

                            Response.Redirect("~/Purchasing/RecieveRawMatSuccessfully.aspx");
                            
                        }

                        else if (GridView2.SelectedRow.Cells[11].Text == "รับวัตถุดิบแล้วครบถ้วน")
                        {
                            MessageBox.Show(" ไม่สามารถทำรายการได้ ! เนื่องจากรายการวัตถุดิบนีได้มีการรับสินค้าแล้ว");

                        }
                    }
                    catch
                    {
                       string UpdateDelDate = "Update PR SET RecieveDate = Getdate() WHERE PRID = '" + GridView2.SelectedRow.Cells[9].Text + "';";
                            dbconn.QueryExecuteScalar(UpdateDelDate);

                            string UpdateJobStatus = "Update JobOrders Set JobStatus ='รอการผลิต' WHERE JobID = '" + GridView1.SelectedRow.Cells[0].Text + "';";
                            dbconn.QueryExecuteScalar(UpdateJobStatus);

                            string UpdateRawMatforJobItemDate = "UPdate JobItemMaterials SET RawMatRecieveDate = GetDate() WHERE JobItemID like '%" + GridView1.SelectedRow.Cells[0].Text + "%' AND RawID = '" + GridView2.SelectedRow.Cells[0].Text + "';";

                            dbconn.QueryExecuteScalar(UpdateRawMatforJobItemDate);


                                double InStock = Convert.ToDouble(lblInStockQTY.Text);
                                double Recieve = Convert.ToDouble(txtRecieveQty.Text);
                                double Total = 0.00;
                                Total = InStock + Recieve;                         
                            string UpdateQtyInStock = "Update RawMaterials SET RawQty = " + Total + " WHERE RawID = '" + GridView2.SelectedRow.Cells[0].Text + "';";

                            dbconn.QueryExecuteScalar(UpdateQtyInStock);


                            string RecieveStatus = "";
                                if (RadioButtonList1.SelectedValue == "รับสินค้าทั้งหมด")
                                {
                                    RecieveStatus = "รับวัตถุดิบแล้วครบถ้วน";
                                }
                                else if (RadioButtonList1.SelectedValue == "รับสินค้าบางส่วน")
                                
                                {
                                RecieveStatus = "รับสินค้าบางส่วน";
                                }
                            else 
                                {
                                    RecieveStatus = "รับวัตถุดิบแล้วครบถ้วน";
                                }
                            string UpdateContactSupRecieveMatStatus = "Update ContactSuppliers SET RecieveMatStatus = '"+RecieveStatus+"' WHERE JobID = '" + GridView1.SelectedRow.Cells[0].Text + "' AND RawID = '" + GridView2.SelectedRow.Cells[0].Text + "' AND SupID = '" + GridView2.SelectedRow.Cells[1].Text + "'; ";
                            dbconn.QueryExecuteScalar(UpdateContactSupRecieveMatStatus);

                            string InsertRecieveMat = "Insert INTO RecieveMats(JobID, SupID, RawID,RecieveDate,RecieveQty) VALUES ('" + GridView1.SelectedRow.Cells[0].Text + "','" + GridView2.SelectedRow.Cells[1].Text + "','" + GridView2.SelectedRow.Cells[0].Text + "',GetDate(),"+Convert.ToDouble(txtRecieveQty.Text)+");";
                            dbconn.QueryExecuteScalar(InsertRecieveMat);
                            dbconn.Close();
                            Response.Redirect("~/Purchasing/RecieveRawMatSuccessfully.aspx");
                        }
                    }

                }

            }
        
    
