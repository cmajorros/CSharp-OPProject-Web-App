<%@ Page Title="" Language="C#" MasterPageFile="~/OP.Master" AutoEventWireup="true" CodeBehind="OverStockWithdrawal.aspx.cs" Inherits="OPProject.Warehouse.OverStockWithdrawal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style9
        {
            width: 1100px;
        }
        .style10
        {
            width: 105px;
        }
        .style11
        {
            width: 865px;
        }
        .style12
        {
            margin-bottom: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table cellpadding="0" cellspacing="0" class="style9">
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td class="style11">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td class="style11">
            <asp:Panel ID="Panel1" runat="server">
                ค้นหาคำสั่งผลิต&nbsp;
                <asp:TextBox ID="txtFindJO" runat="server" Width="211px"></asp:TextBox>
                &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" 
                    ImageUrl="~/Very_Basic/search.png" onclick="ImageButton1_Click" />
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="JobID" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged1">
                    <Columns>
                        <asp:BoundField DataField="JobID" HeaderText="เลขที่คำสั่งผลิต" />
                        <asp:BoundField DataField="JobStatus" HeaderText="สถานะ" />
                        <asp:BoundField DataField="CusName" HeaderText="ชื่อลูกค้า" />
                        <asp:BoundField DataField="OrderDate" DataFormatString="{0:d}" 
                            HeaderText="วันที่รับคำสั่งผลิต" />
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
            <td class="style11">
                <asp:Panel ID="Panel2" runat="server">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                        onselectedindexchanged="GridView2_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="JobItemID" HeaderText="รหัสคำสั่่งผลิตย่อย" />
                            <asp:BoundField DataField="JobItemName" HeaderText="ชื่อรายการคำสั่งผลิตย่อย" />
                            <asp:BoundField DataField="JobItemDes" HeaderText="รายละเอียด" />
                            <asp:BoundField DataField="JobItemQty" HeaderText="จำนวน (ชิ้น)" />
                            <asp:BoundField DataField="SizeName" HeaderText="ขนาด" />
                            <asp:CommandField SelectText="รายละเอียดวัตถุดิบ" ShowSelectButton="True" />
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
            <td class="style11">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td class="style11">
                <asp:Panel ID="Panel3" runat="server">
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                        onselectedindexchanged="GridView3_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="JobItemMatID" 
                                HeaderText=" รหัสวัตถุดิบที่ใช้ในการผลิต" />
                            <asp:BoundField DataField="RawID" HeaderText="รหัสวัตถุดิบ" />
                            <asp:BoundField DataField="RawName" HeaderText="ชื่อวัตถุดิบ" />
                            <asp:BoundField DataField="JobItemMatQty" HeaderText="จำนวนที่ใช้ต่อหน่วย" />
                            <asp:BoundField DataField="JobItemQty" HeaderText="จำนวนชิ้นที่ผลิต" />
                            <asp:BoundField DataField="TotalQuantity" HeaderText="รวม" />
                            <asp:BoundField DataField="RawUnitName" HeaderText="หน่วย" />
                            <asp:BoundField DataField="RawMatRecieveDate" 
                                HeaderText="วันที่รับวัตถุดิบเข้าคลัง" />
                            <asp:CommandField SelectText="รายละเอียดการเบิกวัตถุดิบ" 
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
            <td class="style11">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td class="style11">
                <strong>
                <asp:Label ID="lblUnableWithdraw" runat="server" 
                    Text="ไม่สามารถบิกวัตถุดิบเกินจำนวนได้ในขณะนี้" Visible="False"></asp:Label>
                </strong></td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td class="style11">
                <asp:Panel ID="Panel4" runat="server">
                    <table cellpadding="0" cellspacing="0">
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
                                รหัสวัตถุดิบ</td>
                            <td>
                                <asp:Label ID="lblRawID" runat="server" Text="Label"></asp:Label>
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
                                ชื่อวัตถุดิบ</td>
                            <td>
                                <asp:Label ID="lblRawName" runat="server" Text="Label"></asp:Label>
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
                                จำนวนสินค้าในคลัง</td>
                            <td>
                                <asp:Label ID="lblStock" runat="server"></asp:Label>
                                &nbsp;
                                <asp:Label ID="lblUnit6" runat="server" Text="Label"></asp:Label>
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
                                สถานะการเบิกสินค้า</td>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text="เบิกวัตถุดิบเกินจำนวน"></asp:Label>
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
                                จำนวนวัตถุดิบที่ใช้</td>
                            <td>
                                <asp:Label ID="lblTotalQty" runat="server" Text="Label"></asp:Label>
                                &nbsp;
                                <asp:Label ID="lblUnit1" runat="server" Text="Label"></asp:Label>
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
                                จำนวนที่เบิกสินค้าแล้ว</td>
                            <td>
                                <asp:Label ID="lblWithdrawQty" runat="server" Text="Label"></asp:Label>
                                &nbsp;
                                <asp:Label ID="lblUnit2" runat="server" Text="Label"></asp:Label>
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
                                วันที่เบิกสินค้า</td>
                            <td>
                                <asp:Label ID="lblDate" runat="server" Text="Label"></asp:Label>
                                &nbsp;
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
                                จำนวนวัตถุดิบที่ต้องการเบิกเกินจำนวน&nbsp;&nbsp;&nbsp;
                            </td>
                            <td>
                                <asp:TextBox ID="txtWithdrawQty" runat="server" CssClass="style12"></asp:TextBox>
                                &nbsp;
                                <asp:Label ID="lblUnit4" runat="server" Text="Label"></asp:Label>
                                &nbsp;
                                <asp:Button ID="Button3" runat="server" onclick="Button3_Click" 
                                    Text="คำนวณวัตถุดิบที่สามารถเบิกได้" />
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;&nbsp;</td>
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
                                จำนวนคงเหลือในคลัง</td>
                            <td>
                                <asp:Label ID="lblRemainStock" runat="server" Text="Label"></asp:Label>
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
                                ระบุสาเหตุการเบิกวัตถุดิบเกิน</td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server" Height="22px" Width="348px"></asp:TextBox>
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
                                <asp:Button ID="Button4" runat="server" onclick="Button4_Click" 
                                    Text="ยืนยัน และจัดซื้อวัตถุดิบเพิ่ม" />
                                &nbsp;
                                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="บันทึก" />
                                &nbsp;
                                <asp:Button ID="Button1" runat="server" Text="ยกเลิก" />
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
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
            <td class="style11">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

