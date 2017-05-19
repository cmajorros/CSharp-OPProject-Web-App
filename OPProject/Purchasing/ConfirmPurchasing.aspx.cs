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
    public partial class ConfirmPurchasing : System.Web.UI.Page
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
            string findMat = "SELECT     RawID, RawName, TotalQuantity, RawUnitName, RawQty, CASE WHEN (TotalQuantity - RawQty) < 0.00 THEN 0.00 ELSE CAST(TotalQuantity - RawQty AS decimal)         END AS PURCH, RawMatTypeID, RawMatTypeName FROM (SELECT     dbo.JobItemMaterials.RawID, dbo.RawMaterials.RawName, SUM(dbo.JobItemMaterials.JobItemMatQty * dbo.JobOrderItems.JobItemQty) AS TotalQuantity, dbo.JobItemMaterials.RawUnitName, dbo.RawMaterials.RawQty, dbo.RawMatTypes.RawMatTypeID, dbo.RawMatTypes.RawMatTypeName FROM  dbo.JobOrderItems INNER JOIN dbo.JobItemMaterials ON dbo.JobOrderItems.JobItemID = dbo.JobItemMaterials.JobItemID INNER JOIN dbo.JobOrders ON dbo.JobOrderItems.JobID = dbo.JobOrders.JobID INNER JOIN dbo.RawMaterials ON dbo.JobItemMaterials.RawID COLLATE SQL_Latin1_General_CP1_CI_AS = dbo.RawMaterials.RawID INNER JOIN dbo.RawMatTypes ON dbo.RawMaterials.RawMatTypeID = dbo.RawMatTypes.RawMatTypeID                       WHERE (dbo.JobOrderItems.JobID = '" + GridView1.SelectedRow.Cells[0].Text + "') GROUP BY dbo.JobItemMaterials.RawID, dbo.RawMaterials.RawName, dbo.JobItemMaterials.RawUnitName, dbo.RawMaterials.RawQty,dbo.RawMatTypes.RawMatTypeID, dbo.RawMatTypes.RawMatTypeName) AS subQr";

            DataTable dt = dbconn.QueryExecuteScalar(findMat);
            GridView2.DataSource = dt;
            GridView2.DataBind();
            dbconn.Close();
            Panel2.Visible = true;
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            string SearchDealSup = "SELECT     dbo.ContactSuppliers.SupID, dbo.Suppliers.SupName, dbo.Suppliers.SupContact, dbo.Suppliers.SupAdd, dbo.Suppliers.SupTel, dbo.Suppliers.SupFax, dbo.Suppliers.SupEmail, dbo.ContactSuppliers.ContactSupID FROM  dbo.Suppliers INNER JOIN dbo.ContactSuppliers ON dbo.Suppliers.SupID = dbo.ContactSuppliers.SupID WHERE     (dbo.ContactSuppliers.JobID = '" + GridView1.SelectedRow.Cells[0].Text + "');";
            DataTable dt = dbconn.QueryExecuteScalar(SearchDealSup);
            GridView3.DataSource = dt;
            GridView3.DataBind();
            dbconn.Close();
        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {
            string SearchDealSup = "SELECT     dbo.ContactSuppliers.SupID, dbo.Suppliers.SupName, dbo.Suppliers.SupContact, dbo.Suppliers.SupAdd, dbo.Suppliers.SupTel, dbo.Suppliers.SupFax, dbo.Suppliers.SupEmail, dbo.ContactSuppliers.ContactSupID FROM  dbo.Suppliers INNER JOIN dbo.ContactSuppliers ON dbo.Suppliers.SupID = dbo.ContactSuppliers.SupID WHERE     (dbo.ContactSuppliers.JobID = '" + GridView3.SelectedRow.Cells[0].Text + "');";
            DataTable dt = dbconn.QueryExecuteScalar(SearchDealSup);
            DetailsView1.DataSource = dt;
            DetailsView1.DataBind();
            lblRawID.Text = GridView2.SelectedRow.Cells[0].Text;
            lblRawName.Text = GridView2.SelectedRow.Cells[1].Text;
            lblRawQty.Text = GridView2.SelectedRow.Cells[6].Text;
            lblUnit.Text = GridView2.SelectedRow.Cells[7].Text;

        }

        protected void btnConfrim_Click(object sender, EventArgs e)
        {
            string ConfirmSuppiler = "UPDATE ContactSuppliers SET SelectSup = 'Yes', ContactSupCost = " +Convert.ToDouble(txtConfirmedPrice.Text) + ",CurrencyUnit = '" + lblCurUnit2.Text+ "', unitprice = " + Convert.ToDouble(txtUnitPrice.Text) + ",VAT = " + Convert.ToDouble(txtVAT.Text) + ", NetTotal = " + Convert.ToDouble(txtNetTotal.Text) + ",OriginOfItem = '"+RadioButtonList1.SelectedValue+"' WHERE SupID = " + GridView3.SelectedRow.Cells[1].Text + ";";
            dbconn.QueryExecuteScalar(ConfirmSuppiler);



            SavePR();

            string UPDateJobStatus = "Update JobOrders SET JobStatus = 'กำลังจัดซื้อวัตถุดิบ' WHERE JobID = '"+GridView1.SelectedRow.Cells[0].Text+"';";

            dbconn.QueryExecuteScalar(UPDateJobStatus);

            Session["RawID"] = GridView2.SelectedRow.Cells[0].Text;
           
            Response.Redirect("~/Purchasing/ConfirmedAndPrintPR.aspx");

            dbconn.Close();
        }
        private void SavePR()
        { 
          //RunID
             string RunID = "SELECT MAX(PRID) AS MAXPR From PR ; ";
            DataTable dt = dbconn.QueryExecuteScalar(RunID);
            string fullPR = "";
            try
            {
                string PRNo = dt.Rows[0]["MAXPR"].ToString();
                int CurYear = Convert.ToInt32(DateTime.Now.Year);
                int DBYear = Convert.ToInt32(PRNo.Substring(3, 4));
                
               
                if (CurYear > DBYear)
                {
                    fullPR = "PO-" + CurYear.ToString() + "00001";

                }
                else
                {
                    int CurRunID = Convert.ToInt32(PRNo.Substring(7, 5));
                    int NewID = CurRunID + 1;
                    string NewRunID = NewID.ToString("00000");
                    fullPR = "PO-" + DBYear.ToString() + NewRunID;

                }
            }
            catch
            {
                fullPR = "PO-" +DateTime.Now.Year.ToString() + "00001";
            }

            //Save PR

          /*  double ConfirmedPrice = Convert.ToDouble(txtConfirmedPrice.Text); 
            double VAT = ConfirmedPrice*0.07;
            double NetTotal = ConfirmedPrice+VAT;*/
                
            string DelDate = TextBox1.Text.Substring(6,4) +"-"+ TextBox1.Text.Substring(3,2)+"-"+TextBox1.Text.Substring(0,2);
            string insertNewPR = "INSERT INTO PR(PRID,PRAppliedDate,SupID,JobID,ContactSupID,PRDelDate,MatPrice,VAT,NetMatPrice,UnitPrice,CurrencyUnit) VALUES ('" + fullPR + "',GetDate()," + GridView3.SelectedRow.Cells[1].Text + ",'" + GridView1.SelectedRow.Cells[0].Text + "'," + GridView3.SelectedRow.Cells[8].Text + ",'" + DelDate + "'," + Convert.ToDouble(txtConfirmedPrice.Text) + "," + Convert.ToDouble(txtVAT.Text) + "," +Convert.ToDouble(txtNetTotal.Text)+","+Convert.ToDouble(txtUnitPrice.Text)+ ",'"+lblCurUnit2.Text+"');";
            dbconn.QueryExecuteScalar(insertNewPR);
            dbconn.Close();
            Session["PRID"] = fullPR.ToString();
            
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Calendar1.Visible = true;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            TextBox1.Text = Calendar1.SelectedDate.Date.ToString("dd/MM/yyyy");
            if (Calendar1.SelectedDate.Date <= DateTime.Now.Date)
            {
                lblErrorDate.Visible = true;
            }
            else
            {
            lblErrorDate.Visible = false;
            }
            Calendar1.Visible = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Double UnitPrice = Convert.ToDouble(txtUnitPrice.Text);
            Double Qty = Convert.ToDouble(lblRawQty.Text);
           // double VAT = 0.00;
            if (RadioButtonList1.SelectedValue == "1")
            {
                txtConfirmedPrice.Text = (UnitPrice * Qty).ToString("#,###.00");
                txtVAT.Text = (Convert.ToDouble(txtConfirmedPrice.Text) * 0.07).ToString("#,###.00");
                txtNetTotal.Text = (Convert.ToDouble(txtConfirmedPrice.Text) + Convert.ToDouble(txtVAT.Text)).ToString("#,###.00");
            }
            else
            {
                txtConfirmedPrice.Text = (UnitPrice * Qty).ToString("#,###.00");
                txtVAT.Text = "";
                txtVAT.Text = "0.00";
                txtVAT.Enabled = false;
                txtNetTotal.Text = (Convert.ToDouble(txtConfirmedPrice.Text) + Convert.ToDouble(txtVAT.Text)).ToString("#,###.00");
            }
            
            //txtConfirmedPrice.Text = (UnitPrice * Qty).ToString(); 
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {

            txtNetTotal.Text = "0.00";
            txtUnitPrice.Text = "";
            txtVAT.Text = "0.00";
            txtConfirmedPrice.Text = "0.00";
            if (RadioButtonList1.SelectedValue == "1")
            {
                DdlCurrencyunit.Visible = false;
                lblCurUnit1.Visible = true;
                lblCurUnit1.Text = "THB";
                lblCurUnit2.Text = "THB";
                lblCurUnit3.Text = "THB";
                lblCurUnit4.Text = "THB";
            }
            else

            {
                DdlCurrencyunit.Visible = true;
                lblCurUnit1.Visible = false;
                lblCurUnit2.Text = DdlCurrencyunit.SelectedValue;
                lblCurUnit3.Text = DdlCurrencyunit.SelectedValue;
                lblCurUnit4.Text = DdlCurrencyunit.SelectedValue;
            }

        }

        protected void DdlCurrencyunit_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblCurUnit2.Text = DdlCurrencyunit.SelectedValue;
            lblCurUnit3.Text = DdlCurrencyunit.SelectedValue;
            lblCurUnit4.Text = DdlCurrencyunit.SelectedValue;
        }
        
    }
}