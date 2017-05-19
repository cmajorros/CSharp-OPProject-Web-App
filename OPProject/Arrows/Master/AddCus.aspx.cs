using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace OPProject.Master
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        clsDatabase dbconn = new clsDatabase();

        protected void Page_Load(object sender, EventArgs e)
        {
            string Cus = "C";
            string FULLCusID;
            string CutCusID;
            int CUSID;
            int newCUSID;
            string TransCUSID;
            string NewFullID;

            string findCus = "SELECT MAX(CusID) AS MAXCUS FROM Customers ;";
            DataTable dt3 = dbconn.QueryExecuteScalar(findCus);
            try
            {
                FULLCusID = dt3.Rows[0]["MAXCUS"].ToString();
                CutCusID = FULLCusID.Substring(1, 4);
                CUSID = Convert.ToInt32(CutCusID);
                newCUSID = CUSID + 1;
                TransCUSID = newCUSID.ToString("0000");
                NewFullID = Cus + TransCUSID;
                lblID.Text = NewFullID;
            }
            catch
            {
                NewFullID = "C0001";
                lblID.Text = NewFullID;
            }

           

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void TextBox4_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TxtCusID_TextChanged(object sender, EventArgs e)
        {

        }

        protected void BtnSaveCus_Click(object sender, EventArgs e)
        {
            string today = DateTime.Now.Date.ToString("yyyy-MM-dd");

            string insertcus = "insert into Customers(CusID,CusName,CusAdd,CusTel,CusEmail,CusDate) values ('"+lblID.Text+"','" + TxtCusName.Text + "','" + TxtCusAdd.Text + "', '" + TxtCusTel.Text + "','" + TxtCusEmail.Text + "','"+today+"') ;";

            dbconn.QueryExecuteScalar(insertcus);
            dbconn.Close();

            Response.Redirect("~/Master/CompleteSave.aspx");    
        }
    }
}