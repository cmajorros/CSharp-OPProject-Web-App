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
    public partial class ConfirmedAndPrintPR : System.Web.UI.Page
    {
        clsDatabase dbconn = new clsDatabase();
        protected void Page_Load(object sender, EventArgs e)
        {
            string RawID = Session["RawID"].ToString();
            string PRID = Session["PRID"].ToString();
            string findPR = "SELECT * FROM PR WHERE PRID = '"+PRID+"';";
            DataTable dt = dbconn.QueryExecuteScalar(findPR);
            lblPRNo.Text = dt.Rows[0]["PRID"].ToString();
            lblPrintDate.Text = DateTime.Now.Date.ToString("dd/MM/yyyy");
            lblDelDate.Text = Convert.ToDateTime(dt.Rows[0]["PRDelDate"]).ToString("dd/MM/yyyy");
            lblJobID.Text = dt.Rows[0]["JobID"].ToString();
            lblNetTotal.Text = dt.Rows[0]["NetMatPrice"].ToString();
            lblTax.Text = dt.Rows[0]["VAT"].ToString();
            lblTotal.Text = dt.Rows[0]["MatPrice"].ToString();
            Label15.Text = dt.Rows[0]["CurrencyUnit"].ToString();
            Label16.Text = Label15.Text;
            Label17.Text = Label15.Text;
           string findSup = "SELECT * FROM Suppliers WHERE SupID = " + dt.Rows[0]["SupID"].ToString() + ";";

            DataTable dtSup = dbconn.QueryExecuteScalar(findSup);

            lblSupName.Text = dtSup.Rows[0]["SupName"].ToString();
            lblSupAdd.Text = dtSup.Rows[0]["SupAdd"].ToString();
            lblSupTel.Text = dtSup.Rows[0]["SupTel"].ToString();
            lblFax.Text = dtSup.Rows[0]["SupFax"].ToString();
            lblSupEmail.Text = dtSup.Rows[0]["SupEmail"].ToString();

            string findItemOrder = "SELECT dbo.ContactSuppliers.RawID, dbo.ContactSuppliers.ContactSupCost, dbo.RawMaterials.RawName, dbo.ContactSuppliers.RawUnit, dbo.ContactSuppliers.CurrencyUnit,  dbo.ContactSuppliers.UnitPrice, dbo.ContactSuppliers.RawQty FROM dbo.ContactSuppliers INNER JOIN dbo.PR ON dbo.ContactSuppliers.ContactSupID = dbo.PR.ContactSupID INNER JOIN  dbo.RawMaterials ON dbo.ContactSuppliers.RawID = dbo.RawMaterials.RawID WHERE     (dbo.ContactSuppliers.ContactSupID = '" + dt.Rows[0]["ContactSupID"].ToString() + "') AND (dbo.ContactSuppliers.SelectSup = 'Yes') AND (dbo.ContactSuppliers.JobID = '" + lblJobID.Text + "' AND dbo.ContactSuppliers.RawID = '"+RawID+"');";
            DataTable dtItem = dbconn.QueryExecuteScalar(findItemOrder);
            GridView1.DataSource = dtItem;
            GridView1.DataBind();
            dbconn.Close();
           
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Panel2.Visible = true;
            Panel1.Visible = false;
            Panel3.Visible = true;
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            PanelEmail.Visible = true;
            EmailVendor();
        }
        private void EmailVendor()
        { 

            string RawID = Session["RawID"].ToString();
            string searchVendor = "SELECT SupEmail FROM Suppliers WHERE SupID IN (SELECT SupID FROM ContactSuppliers WHERE JobID = '" + lblJobID.Text + "' AND SelectSup IS NULL AND RawID = '" + RawID + "' );";

            DataTable dt = dbconn.QueryExecuteScalar(searchVendor);
            int numRow = dt.Rows.Count; 
            string To = "";
            for (int i = 0; i < numRow; i++)
            {
                string Reciever = dt.Rows[i]["SupEmail"].ToString()+",";
                To += Reciever;
          
            }
            txtTo.Text = To;

            txtSubject.Text = "ผลการเสนอราคาวัตถุดิบ บริษัท โอพี การ์เม้น";
            txtMessage.Text = "เรียน ท่านผู้ประกอบการ" + Environment.NewLine + Environment.NewLine + "อ้างอิงจาก การเสนอราคาวัตุดิบ เลขที่ " + lblJobID.Text + " รายการวัตถุดิบ " + GridView1.Rows[0].Cells[1].Text +  " จำนวน " + GridView1.Rows[0].Cells[2].Text + " " +
 GridView1.Rows[0].Cells[3].Text +"   ทาง บริษัท โอพี การ์เม้น มีความประสงค์ที่จะแจ้งผลการเสนอราคาวัตถุดิบราคา ทางบริษัทผู้ที่ชนะการสนอราคาแล้ว " + Environment.NewLine + "ทางบริษัทจึงขอขอบพระคุณท่านที่ให้ความร่วมมือ และเข้าร่วมเสนอราคาวัตถุดิบ ด้วยดีเสมอมา " + Environment.NewLine + Environment.NewLine + "ขอแสดงความนับถือ" + Environment.NewLine + "บริษัท โอพี การ์เม้น" + Environment.NewLine;

        }
        private void SendMail()
        {

            //SendEmail 
            string RawID = Session["RawID"].ToString();
            string searchVendor = "SELECT SupEmail FROM Suppliers WHERE SupID IN (SELECT SupID FROM ContactSuppliers WHERE JobID = '" + lblJobID.Text + "' AND SelectSup IS NULL AND RawID = '" + RawID + "' );";

            DataTable dt = dbconn.QueryExecuteScalar(searchVendor);
            int numRow = dt.Rows.Count;
            try
            {
                for (int i = 0; i < numRow; i++)
                {

                MailMessage Email = new MailMessage();
                Email.From = new MailAddress("opgarment@gmail.com", "บริษัท โอพี การ์เม้น");
                Email.To.Add(new MailAddress(dt.Rows[i]["SupEmail"].ToString()));
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
                
            }
            catch
            {
                MessageBox.Show("Sorry, Your invitation mail cannot sent. Please try again");
            }

            dbconn.Close();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SendMail();
        }

        
    }
}