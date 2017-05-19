<%@ Page Title="" Language="C#" MasterPageFile="~/OP.Master" AutoEventWireup="true" CodeBehind="RecieveRawMat.aspx.cs" Inherits="OPProject.Warehouse.RecieveRawMat" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style9
        {
            width: 1100px;
        }
        .style10
        {
            width: 57px;
        }
        .style11
        {
            width: 57px;
            height: 17px;
        }
        .style12
        {
            height: 17px;
        }
        .style13
        {
            width: 165px;
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
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td>
                <asp:Panel ID="Panel2" runat="server" Visible="False">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                        onselectedindexchanged="GridView2_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="RawID" HeaderText="รหัสวัตถุดิบ" />
                            <asp:BoundField DataField="SupID" HeaderText="รหัสผู้จำหน่าย" />
                            <asp:BoundField DataField="SupName" HeaderText="ชื่อผู้จำหน่าย" />
                            <asp:BoundField DataField="RawName" HeaderText="ชื่อวัตถุดิบ" />
                            <asp:BoundField DataField="JobID" HeaderText="เลขที่ใบสั้่งผลิต" />
                            <asp:BoundField DataField="RawQty" HeaderText="จำนวน" />
                            <asp:BoundField DataField="RawUnit" HeaderText="หน่วย" />
                            <asp:BoundField DataField="UnitPrice" HeaderText="ราคาต่อหน่วย" />
                            <asp:BoundField DataField="CurrencyUnit" HeaderText="สกุลเงิน" />
                            <asp:BoundField DataField="PR" HeaderText="รหัสใบสั่งซื้อ" />
                            <asp:BoundField DataField="PRDelDate" DataFormatString="{0:d}" 
                                HeaderText="วันที่ส่งของ" />
                            <asp:BoundField DataField="RecieveMatStatus" HeaderText="สถานะการรับสินค้า" />
                            <asp:CommandField ShowSelectButton="True" />
                        </Columns>
                    </asp:GridView>
                    <br />
                </asp:Panel>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style11">
            </td>
            <td class="style12">
                <asp:Panel ID="Panel3" runat="server">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="style13">
                                รหัสวัตถุดิบ
                            </td>
                            <td>
                                <asp:Label ID="lblRawID" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style13">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style13">
                                ชื่อวัตถุดิบ</td>
                            <td>
                                <asp:Label ID="lblRawName" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style13">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style13">
                                สถานะการรับสินค้า</td>
                            <td>
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
                                    onselectedindexchanged="RadioButtonList1_SelectedIndexChanged">
                                    <asp:ListItem>รับสินค้าทั้งหมด</asp:ListItem>
                                    <asp:ListItem>รับสินค้าบางส่วน</asp:ListItem>
                                    <asp:ListItem>สินค้าค้างรับ</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style13">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style13">
                                จำนวนการสั่งซื้อ</td>
                            <td>
                                <asp:Label ID="lblOrderQty" runat="server" Text="0.00"></asp:Label>
                                &nbsp;
                                <asp:Label ID="lblUnit1" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style13">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style13">
                                จำนวนสินค้าที่รับ</td>
                            <td>
                                <asp:TextBox ID="txtRecieveQty" runat="server"></asp:TextBox>
                                &nbsp;
                                <asp:Label ID="lblUnit" runat="server" Text="Label"></asp:Label>
                                &nbsp;<asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                                    Text="คำนวณจำนวนวัตถุดิบ" />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style13">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style13">
                                จำนวนสินค้าค้างรับ</td>
                            <td>
                                <asp:Label ID="lblRemain" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style13">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style13">
                                จำนวนคงเหลือในคลัง</td>
                            <td>
                                <asp:Label ID="lblInStockQTY" runat="server" Text="0.00"></asp:Label>
                                &nbsp;
                                <asp:Label ID="lblUnit2" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style13">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style13">
                                จำนวนสินค้าในคลังทั้งหมด
                            </td>
                            <td>
                                <asp:Label ID="lblTotalQty" runat="server" Text="0.00"></asp:Label>
                                &nbsp;
                                <asp:Label ID="lblUnit3" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style13">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style13">
                                &nbsp;</td>
                            <td>
                                <asp:Button ID="btnConfirm" runat="server" onclick="btnConfirm_Click" 
                                    Text="ยืนยันการรับสินค้า" />
                                &nbsp;
                                <asp:Button ID="btnCancel" runat="server" Text="ยกเลิก" />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style13">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style13">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style13">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td class="style12">
            </td>
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
