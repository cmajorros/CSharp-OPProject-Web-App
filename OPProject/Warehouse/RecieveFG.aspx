<%@ Page Title="" Language="C#" MasterPageFile="~/OP.Master" AutoEventWireup="true" CodeBehind="RecieveFG.aspx.cs" Inherits="OPProject.Warehouse.RecieveFG" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style9
        {
            width: 1100px;
        }
        .style10
        {
            width: 129px;
        }
        .style11
        {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table cellpadding="0" cellspacing="0" class="style9">
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td>
            <asp:Panel ID="Panel1" runat="server">
                ค้นหาคำสั่งผลิต&nbsp;
                <asp:TextBox ID="txtFindJO" runat="server" Width="211px"></asp:TextBox>
                &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" 
                    ImageUrl="~/Very_Basic/search.png" onclick="ImageButton1_Click" />
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="JobID" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="JobID" HeaderText="เลขที่คำสั่งผลิต" />
                        <asp:BoundField DataField="JobStatus" HeaderText="สถานะ" />
                        <asp:BoundField DataField="CusName" HeaderText="ชื่อลูกค้า" />
                        <asp:BoundField DataField="OrderDate" DataFormatString="{0:d}" 
                            HeaderText="วันที่รับคำสั่งผลิต" />
                        <asp:BoundField DataField="DeliveryDate" HeaderText="วันที่ส่งสินค้า" />
                        <asp:CommandField SelectText="รายละเอียดวัตถุดิบ" ShowSelectButton="True" />
                    </Columns>
                </asp:GridView>
                <br />
            </asp:Panel>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td>
                <asp:Panel ID="Panel2" runat="server" Width="845px">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                        onselectedindexchanged="GridView2_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="JobItemID" HeaderText="รหัสคำสั่่งผลิตย่อย" />
                            <asp:BoundField DataField="JobItemName" HeaderText="ชื่อรายการคำสั่งผลิตย่อย" />
                            <asp:BoundField DataField="JobItemDes" HeaderText="รายละเอียด" />
                            <asp:BoundField DataField="JobItemQty" HeaderText="จำนวน (ชิ้น)" />
                            <asp:BoundField DataField="SizeName" HeaderText="ขนาด" />
                            <asp:CommandField SelectText="บันทึกการรับสินค้าสำเร็จรูป" 
                                ShowSelectButton="True" />
                        </Columns>
                    </asp:GridView>
                </asp:Panel>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td>
                <asp:Panel ID="Panel3" runat="server">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                รหัสคำสั่งผลิต</td>
                            <td>
                                <asp:Label ID="lblJobID" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                รหัสคำสั่งผลิตย่อย</td>
                            <td>
                                <asp:Label ID="lblJobItemID" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                รายละเอียดสินค้า</td>
                            <td>
                                <asp:Label ID="lblJobItemDes" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                จำนวนสั่งซื้อ</td>
                            <td>
                                <asp:Label ID="lblQty" runat="server" Text="Label"></asp:Label>
                                &nbsp;<asp:Label ID="lblUnit" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                จำนวนสินค้าทีรับไปแล้ว&nbsp;</td>
                            <td>
                                <asp:Label ID="lblRecieveQty" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                รายละเอียดการรับสินค้า
                            </td>
                            <td>
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
                                    onselectedindexchanged="RadioButtonList1_SelectedIndexChanged">
                                    <asp:ListItem>รับสินค้าทั้งหมด</asp:ListItem>
                                    <asp:ListItem>รับสินค้าบางส่วน</asp:ListItem>
                                    <asp:ListItem>รับสินค้าเกินจำนวน</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                จำนวนที่รับ</td>
                            <td>
                                <asp:TextBox ID="txtNewDelQty" runat="server">0.00</asp:TextBox>
                                &nbsp;<asp:Button ID="btnCal" runat="server" onclick="btnCal_Click" 
                                    Text="คำนวณสินค้าที่ค้างรับ" />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                จำนวนที่ค้างรับ</td>
                            <td>
                                <asp:Label ID="lblRemainedRecieve" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:Panel ID="PanelLateDel" runat="server">
                                    <span class="style11">*สินค้ามีการส่งช้ากว่ากำหนดกรุณาระบุสาเหตุ</span><br />
                                    <br />
                                    <asp:TextBox ID="TextBox1" runat="server" Height="22px" Width="253px"></asp:TextBox>
                                </asp:Panel>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:Button ID="Button1" runat="server" Text="บันทึก" onclick="Button1_Click" />
                                &nbsp;
                                <asp:Button ID="Button2" runat="server" Text="ยกเลิก" />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
