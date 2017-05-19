using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;


namespace OPProject.Purchasing
{
    public partial class ContactVendor : System.Web.UI.Page
    {
        clsDatabase dbconn = new clsDatabase();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            String FindJobOrder = "Select * from JobOrders where JobID Like '%" + txtFindJO.Text + "%' or CusName like '%" + txtFindJO.Text + "%' and JobStatus = 'รอจัดซื้อวัตถุดิบ';";
            DataTable dt = dbconn.QueryExecuteScalar(FindJobOrder);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            dbconn.Close();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string findMat = "SELECT     RawID, RawName, TotalQuantity, RawUnitName, RawQty, CASE WHEN (TotalQuantity - RawQty) < 0.00 THEN 0.00 ELSE CAST(TotalQuantity - RawQty AS decimal)         END AS PURCH, RawMatTypeID, RawMatTypeName FROM (SELECT     dbo.JobItemMaterials.RawID, dbo.RawMaterials.RawName, SUM(dbo.JobItemMaterials.JobItemMatQty * dbo.JobOrderItems.JobItemQty) AS TotalQuantity, dbo.JobItemMaterials.RawUnitName, dbo.RawMaterials.RawQty, dbo.RawMatTypes.RawMatTypeID, dbo.RawMatTypes.RawMatTypeName FROM  dbo.JobOrderItems INNER JOIN dbo.JobItemMaterials ON dbo.JobOrderItems.JobItemID = dbo.JobItemMaterials.JobItemID INNER JOIN dbo.JobOrders ON dbo.JobOrderItems.JobID = dbo.JobOrders.JobID INNER JOIN dbo.RawMaterials ON dbo.JobItemMaterials.RawID COLLATE SQL_Latin1_General_CP1_CI_AS = dbo.RawMaterials.RawID INNER JOIN dbo.RawMatTypes ON dbo.RawMaterials.RawMatTypeID = dbo.RawMatTypes.RawMatTypeID                       WHERE (dbo.JobOrderItems.JobID = '"+GridView1.SelectedRow.Cells[0].Text+"') GROUP BY dbo.JobItemMaterials.RawID, dbo.RawMaterials.RawName, dbo.JobItemMaterials.RawUnitName, dbo.RawMaterials.RawQty,dbo.RawMatTypes.RawMatTypeID, dbo.RawMatTypes.RawMatTypeName) AS subQr";

            DataTable dt = dbconn.QueryExecuteScalar(findMat);
            GridView2.DataSource = dt;
            GridView2.DataBind();
            dbconn.Close();
            Panel2.Visible = true;
        }

        
        protected void GridView2_SelectedIndexChanged1(object sender, EventArgs e)
        {
            string findSup = "SELECT     dbo.SupplierRawMaterials.SupID, dbo.Suppliers.SupName, dbo.Suppliers.SupContact, dbo.Suppliers.SupAdd, dbo.Suppliers.SupTel, dbo.Suppliers.SupFax, dbo.Suppliers.SupEmail FROM dbo.Suppliers INNER JOIN dbo.SupplierRawMaterials ON dbo.Suppliers.SupID = dbo.SupplierRawMaterials.SupID WHERE     (dbo.SupplierRawMaterials.RawMatTypeID = '"+GridView2.SelectedRow.Cells[2].Text+"');";

            DataTable dt = dbconn.QueryExecuteScalar(findSup);
            GridView3.DataSource = dt;
            GridView3.DataBind();
            
            dbconn.Close();
            Panel3.Visible = true;
        }

        protected void btnSendMail_Click(object sender, EventArgs e)
        {
            PanelEmail.Visible = true;
            txtTo.Text = "";
            CheckBox chkbox = new CheckBox();
            foreach (GridViewRow grdRow in GridView3.Rows)
            {
                chkbox = (CheckBox)Convert.ChangeType(((CheckBox)grdRow.FindControl("CheckBox1")), typeof(CheckBox));
                if (chkbox.Checked)
                {
                    string Email = (string)GridView3.Rows[grdRow.RowIndex].Cells[7].Text;

                    string AllEmail = txtTo.Text;

                    
                    txtTo.Text = AllEmail + Email + ",";


                }
            }
            String  ConfirmedDate = DateTime.Now.AddDays(7).ToString("dd/MM/yyyy");
            
            txtSubject.Text = "โอพี การ์เม้น ขอเชิญท่านข้าร่วมเสนอราคาวัตถุดิบ";
            txtMessage.Text = "เรียน ผู้จัดจำหน่าย" + Environment.NewLine+"อ้างอิงถึง คำสั่่งผลิตที่ "+GridView1.SelectedRow.Cells[0].Text +Environment.NewLine+ "ทางบริษัท โอพี การ์เม้น มีความประสงค์ที่จะเชิญท่านเข้าร่วมเสนอราคาวัตถุดิบ โดยมีรายละเอียดสินค้าดังนี้"+Environment.NewLine+"สินค้า "+ GridView2.SelectedRow.Cells[1].Text + "    จำนวน   "+GridView2.SelectedRow.Cells[4].Text + " " +GridView2.SelectedRow.Cells[5].Text + Environment.NewLine+"หากท่านมีความประสงค์ที่จะเข้าร่วมการเสนอราคาวัตถุดิบ  กรุณาส่งใบเสนอราคาสินค้าดังกล่าวมาที่ แผนกจัดซื้อ"+Environment.NewLine+"บริษัท โอพี การ์เม้น โทรศัพท์ 02-6655443 โทรสาร 02-6655443 อีเมล์ OPGarment@hotmail.com  "+Environment.NewLine+"ภายในวันที่ "+ConfirmedDate+Environment.NewLine+ Environment.NewLine+"ขอแสดงความนับถือ"+ Environment.NewLine+"ผู้จัดการผ่ายจัดซื้อ บริษัท โอพี การ์เม้น"+ Environment.NewLine;


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            CheckBox chkbox = new CheckBox();
            foreach (GridViewRow grdRow in GridView3.Rows)
            {
                chkbox = (CheckBox)Convert.ChangeType(((CheckBox)grdRow.FindControl("CheckBox1")), typeof(CheckBox));
                if (chkbox.Checked)
                {
                    string Contact = (string)GridView3.Rows[grdRow.RowIndex].Cells[7].Text;


                    try
                    {

                        MailMessage Email = new MailMessage();
                        Email.From = new MailAddress("opgarment@gmail.com", "บริษัท โอพี การ์เม้น");
                        Email.To.Add(new MailAddress(Contact));
                        Email.Subject = txtSubject.Text;
                        Email.Body = txtMessage.Text;
                        Email.Priority = MailPriority.Normal;
                        SmtpClient MailClient = new SmtpClient("smtp.gmail.com");
                        MailClient.Port = 587;
                        MailClient.Credentials = new System.Net.NetworkCredential("opgarment@gmail.com", "Nan04111984");
                        MailClient.EnableSsl = true;
                        MailClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                        MailClient.Send(Email);
                        Panel1.Visible = false;
                        MessageBox.Show("Your Invitation Mail have sent successfully");


                    }
                    catch
                    {
                        MessageBox.Show("Sorry, Your invitation mail cannot sent. Please try again");
                    }

                }
                SaveContact();
            }
        }
        private void SaveContact()
    {
             CheckBox chkbox = new CheckBox();
            foreach (GridViewRow grdRow in GridView3.Rows)
            {
                chkbox = (CheckBox)Convert.ChangeType(((CheckBox)grdRow.FindControl("CheckBox1")), typeof(CheckBox));
                if (chkbox.Checked)
                {
                    string Contact = (string)GridView3.Rows[grdRow.RowIndex].Cells[1].Text;
                    string insertContact = "INSERT INTO ContactSuppliers (SupID, JobID,RawID,RawUnit,RawQty) VALUES (" + Contact + ",'" + GridView1.SelectedRow.Cells[0].Text + "'," + GridView2.SelectedRow.Cells[0].Text + ",'" + GridView2.SelectedRow.Cells[7].Text + "'," + GridView2.SelectedRow.Cells[6].Text + ");";
                    dbconn.QueryExecuteScalar(insertContact);
                }
            }
            
            dbconn.Close();
    }
    }
}