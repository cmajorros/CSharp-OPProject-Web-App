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
    public partial class WebForm3 : System.Web.UI.Page
    {
        clsDatabase dbconn = new clsDatabase();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            string sqlinsertemp;
            sqlinsertemp = "insert into employees(EmpID,EmpName,EmpCardID,EmpAdd,EmpTel,EmpStatus,EmpRoleID)values('" + TxtEmpID.Text + "','" + TxtName.Text + "','" + TxtEmpID.Text + "','" + TxtAddress.Text + "','" + TxtPhone.Text + "','Active','" + DdlRole.SelectedValue + "');";
            dbconn.QueryExecuteScalar(sqlinsertemp);
            dbconn.Close();

        }

       
       
    }
}