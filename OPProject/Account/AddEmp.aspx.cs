using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace OPProject.Account
{
    public partial class Register : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand com;
        SqlDataReader dr;
        DataTable dt;
        string strCon = ConfigurationManager.ConnectionStrings["OPGarment"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

       

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            bool c = checkEmpID(TxtEmpID.Text);
            if (c == true)
            {
            c = insertlogin(TxtEmpID.Text,TxtPwd.Text);
                if (c == true)
                {
                    LblStage.Visible = true;
                    LblStage.Text = "Save Completed";
                    cleardata();
                }else {
                         LblStage.Visible = true;
                    LblStage.Text = "Unable to Save";
                }
            }else {
                     LblStage.Visible = true;
                    LblStage.Text = "Invalid Employee ID";
            }
            
        }
        private void cleardata()
        {
            TxtEmpID.Text = "";
            TxtPwd.Text = "";
            TxtConPwd.Text = "";

        }
        private bool insertlogin(string ID,String PWD)
        {
            string Sql = "insert into Login(EmpID,Password) values(@ID,@PWD)";
            
           
            con = new SqlConnection(strCon);
                try{
        
            if (con.State == ConnectionState.Open)
            {
                con.Close ( );
            }
            con.Open();
            com = new SqlCommand(Sql,con);
            com.Parameters.Clear();
            com.Parameters.AddWithValue("@ID",ID);
                com.Parameters.AddWithValue("@PWD",PWD);
            
            int aff = com.ExecuteNonQuery();
            if (aff != 0)
            {
                return true;
                }else 
                {
                    return false;
                }
       } catch  
        {
            return false;
            
        }
            con.Close();
        }
    
        private bool checkEmpID(string ID)
        { string Sql = "select * from Employees where EmpID = @ID";
            con = new SqlConnection(strCon);
        
            if (con.State == ConnectionState.Open)
            {
                con.Close ( );
            }
            con.Open();
            com = new SqlCommand(Sql,con);
            com.Parameters.Clear();
            com.Parameters.AddWithValue("@ID",ID);
            dr = com.ExecuteReader();
            if (dr.HasRows)
            {
                return true;
                }else 
            {
            return false;
            }
        
            dr.Close();
            con.Close();

        }
        
        }
    }

