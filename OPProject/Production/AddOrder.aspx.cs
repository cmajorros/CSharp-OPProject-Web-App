using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
namespace OPProject.Production
{
    public partial class Order : System.Web.UI.Page
    {
        clsDatabase dbconn = new clsDatabase();
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            RunID();
            TxtOrderDate.Text = DateTime.Now.Date.ToString("dd/MM/yyyy");
            RunItemID();
            if (!Page.IsPostBack)
            {
                dt = new DataTable();
                MakeDataTable();
            }
            else {
                dt = (DataTable)ViewState["DataTable"];
            }
            ViewState["DataTable"] = dt;
        }
        private void RunID()
        {

            string findmax = "SELECT MAX(JobID) As MAXID FROM JobOrders;";
            DataTable dt = dbconn.QueryExecuteScalar(findmax);
            int CurYear = DateTime.Now.Year;
            string NewID = "";

            try
            {

                string DBYear = dt.Rows[0]["MAXID"].ToString().Substring(3, 4);
                int DBID = Convert.ToInt32(dt.Rows[0]["MAXID"].ToString().Substring(7, 4));



                if (Convert.ToInt32(DBYear) < CurYear)
                {

                    NewID = "JO-" + Convert.ToString(CurYear) + "0001";
                    LblJobID.Text = NewID;

                }
                else if (Convert.ToInt32(DBYear) == CurYear)
                {
                    int CurID = Convert.ToInt32(dt.Rows[0]["MAXID"].ToString().Substring(3, 8));
                    int AddNewID = Convert.ToInt32(CurID) + 1;
                    NewID = "JO-" + AddNewID.ToString();
                    LblJobID.Text = NewID;
                }
            }

            catch
            {
                NewID = "JO-" + Convert.ToString(CurYear) + "0001";
                LblJobID.Text = NewID;
            }
            dbconn.Close();
        }

        protected void BtnOrderDate_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void BtnDelDate_Click(object sender, ImageClickEventArgs e)
        {
            CalendarDelivery.Visible = true;
        }

        protected void CalendarDelivery_SelectionChanged(object sender, EventArgs e)
        {
            TxtDelDate.Text = CalendarDelivery.SelectedDate.Date.ToString("dd/MM/yyyy");
            CalendarDelivery.Visible = false;
            CheckDate();
        }

        private void CheckDate()
        {

            string DelDay = TxtDelDate.Text.Substring(0, 2);
            string DelMonth = TxtDelDate.Text.Substring(3, 2);
            string DelYear = TxtDelDate.Text.Substring(6, 4);
            int DelDate = Convert.ToInt32(DelYear + DelMonth + DelDay);

            string OrderDay = TxtOrderDate.Text.Substring(0, 2);
            string OrderMonth = TxtOrderDate.Text.Substring(3, 2);
            string OrderYear = TxtOrderDate.Text.Substring(6, 4);
            int OrderDate = Convert.ToInt32(OrderYear + OrderMonth + OrderDay);


            if (DelDate - OrderDate <= 60)
            {

                lblDateErr.Visible = true;
            }
            else
            {
                lblDateErr.Visible = false;

            }



        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RadioButtonList1.SelectedValue == "0")
            {
                Panel4.Visible = true;
                PanelNewModel.Visible = false;
            }
            else if (RadioButtonList1.SelectedValue == "1")
            {
                PanelNewModel.Visible = true;
                Panel4.Visible = false;
            }
            else
            {
                Panel4.Visible = false;
                PanelNewModel.Visible = false;
            }

        }
        private void RunItemID()
        {
            string JI = "";
            string JO = LblJobID.Text;
            if (GridView1.Rows.Count == 0)
            {
                JI = JO + "-01";
                lblJIID.Text = JI;
            }
            else 

            {
            JI = JO+"-"+((GridView1.Rows.Count + 1).ToString("00"));
            lblJIID.Text = JI;
            }

        }

        protected void BtnAddSize_Click(object sender, EventArgs e)
        {

        }

        protected void DdlModel_SelectedIndexChanged(object sender, EventArgs e)
        {

            try
            {
                string FindPic = "SELECT Image FROM Styles WHERE StyleID = '" + DdlModel.SelectedValue + "';";
                DataTable dt = dbconn.QueryExecuteScalar(FindPic);
                Image1.ImageUrl = "~/Model Picture/" + dt.Rows[0]["Image"].ToString();
                dbconn.Close();
            }
            catch
            {
                Image1.ImageUrl = "";
            }
        }

        protected void DdlCusName_SelectedIndexChanged(object sender, EventArgs e)
        {
            DdlModel.SelectedValue = "0";
            
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {


            if (RadioButtonList1.SelectedValue == "0")
            {
                if (FileUpload1.HasFile)
                {
                    string fileext = System.IO.Path.GetExtension(FileUpload1.FileName);

                    if (fileext == ".jpg" || fileext == ".gif" || fileext == ".jpeg")
                    {
                        lblImageError.Visible = false;
                    }
                    else
                    {
                        lblImageError.Visible = true;
                    }
                }
                else
                {
                    lblImageError.Visible = true;
                }
            
            }

            SaveAll();
            SaveOrderItem();
        }

        private void MakeDataTable()
        {
            dt.Columns.Add("รหัสใบสั่งผลิตย่อย");
            dt.Columns.Add("รหัสประเภทสินค้า");
            dt.Columns.Add("ประเภทสินค้า");
            dt.Columns.Add("รายละเอียดสินค้า");
            dt.Columns.Add("รหัสขนาด");
            dt.Columns.Add("ขนาด");
            dt.Columns.Add("ราคาต่อหน่วย");
            dt.Columns.Add("สกุลเงิน");
            dt.Columns.Add("จำนวน");          

        }

        private void AddToDataTable()
        {
            DataRow dr = dt.NewRow();
            dr["รหัสใบสั่งผลิตย่อย"] = lblJIID.Text;
            dr["รหัสประเภทสินค้า"] = DdlProType.SelectedValue;
            dr["ประเภทสินค้า"] = DdlProType.SelectedItem.Text;
            dr["รายละเอียดสินค้า"] = txtJobDes.Text;
            dr["รหัสขนาด"] = DdlSize.SelectedValue;
            dr["ขนาด"] = DdlSize.SelectedItem.Text;
            dr["ราคาต่อหน่วย"] = TxtPrice.Text;
            dr["สกุลเงิน"] = DdlCurrency.SelectedItem.Text;
            dr["จำนวน"] =  TxtAmount.Text;
            dt.Rows.Add(dr);
        }

        private void BindGrid()
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            AddToDataTable();
            BindGrid();
            RunItemID();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
         dt.Rows.RemoveAt(e.RowIndex);
            GridView1.DataSource = dt;
            BindGrid();
          
        }
        private void SaveAll()
        { 
            string StyleID = "";
            if (RadioButtonList1.SelectedValue == "0")
            {
            StyleID = DdlModel.SelectedValue;
            }else
            {
            StyleID = txtStyle.Text;
            }
            string Day = TxtDelDate.Text.Substring (0,2);
            string Month = TxtDelDate.Text.Substring (3, 2);
            string Year = TxtDelDate.Text.Substring (6, 4);
            string Date = Year + "-" + Month + "-" + Day;

            string SaveJobOrder = "Insert into JobOrders (JobID, JobStatus ,CusID, CusName, OrderDate, DeliveryDate, StyleID) Values('" + LblJobID.Text + "', 'รอจัดซื้อวัตถุดิบ', '" + DdlCusName.SelectedValue + "', '" + DdlCusName.SelectedItem.Text + "', getDate(), '" + Date + "', '" + StyleID + "');";

            dbconn.QueryExecuteScalar(SaveJobOrder);
            if (RadioButtonList1.SelectedValue == "1")
            {

                string CurrenFileName = FileUpload1.FileName;
                string CurrentPath = Server.MapPath("~/ModelPicture/");
                string FullPath = "ModelPicture/" + CurrenFileName;

            string SaveNewStyle = "Insert Into Styles (StyleID, CusID, Image) values ('"+txtStyle.Text+"', '"+DdlCusName.SelectedValue+"','"+FullPath+"');";
            dbconn.QueryExecuteScalar(SaveNewStyle);
            dbconn.Close();

           
         
            }
        }
        private void SaveOrderItem()
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                string InsertJobOrderItem = "Insert Into JobOrderItems (JobItemID, JobID, JobItemStatus,JobPrice, JobItemName, JobItemDes, JobItemQty,SizeID) Values ('" + Convert.ToString(dt.Rows[i]["รหัสใบสั่งผลิตย่อย"]) + "','" + LblJobID.Text + "', 'รอจัดซื้อวัตถุดิบ','" + Convert.ToDouble(dt.Rows[i]["ราคาต่อหน่วย"]) + "', '" + Convert.ToString(dt.Rows[i]["ประเภทสินค้า"]) + "','" + Convert.ToString(dt.Rows[i]["รหัสขนาด"]) + "','" + Convert.ToInt32(dt.Rows[i]["จำนวน"]) + "'," + Convert.ToInt32(dt.Rows[i]["จำนวน"]) + ");";
                
                dbconn.QueryExecuteScalar(InsertJobOrderItem);
            }
            dbconn.Close();
        }
       
    }
}