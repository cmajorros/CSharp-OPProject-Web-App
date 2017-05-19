<%@ Page Title="" Language="C#" MasterPageFile="~/OP.Master" AutoEventWireup="true" CodeBehind="CheckJobMat.aspx.cs" Inherits="OPProject.Purchasing.CheckJobMat" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style9
        {
            width: 1100px;
        }
        .style10
        {
            width: 158px;
        }
        .style11
        {
            width: 863px;
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
            <td class="style11">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td class="style11">
                <asp:Panel ID="Panel2" runat="server" Visible="False">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                        onselectedindexchanged="GridView2_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="RawID" HeaderText="รหัสวัตถุดิบ" />
                            <asp:BoundField DataField="RawName" HeaderText="ชื่อวัตถุดิบ" />
                            <asp:BoundField DataField="RawMatTypeID" HeaderText="รหัสประเภทวัตถุดิบ" />
                            <asp:BoundField DataField="RawMatTypeName" HeaderText="ชื่อประภทวัตถุดิบ" />
                            <asp:BoundField DataField="TotalQuantity" HeaderText="จำนวน" />
                            <asp:BoundField DataField="RawQty" HeaderText="จำนวนวัตถุดิบในคลัง" />
                            <asp:BoundField DataField="PURCH" HeaderText="จำนวนที่จัดซื้อ" />
                            <asp:BoundField DataField="RawUnitName" HeaderText="หน่วย" />
                            <asp:CommandField SelectText="รายละเอียดการจัดซื้อวัตถุดิบ" 
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
                <asp:Panel ID="Panel3" runat="server" Visible="False">
                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                    <br />
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="SupID" HeaderText="รหัสผู้จำหน่าย" />
                            <asp:BoundField DataField="SupName" HeaderText="ชื่อผู้จัดจำหน่าย" />
                            <asp:BoundField DataField="SupTel" HeaderText="โทรศัพท์" />
                            <asp:BoundField DataField="SupFax" HeaderText="โทรสาร" />
                            <asp:BoundField DataField="SupEmail" HeaderText="อีเมลล์" />
                            <asp:BoundField DataField="RawQty" DataFormatString="{0:N}" 
                                HeaderText="จำนวนสินค้า" />
                            <asp:BoundField DataField="RawUnit" HeaderText="หน่วย" />
                            <asp:BoundField DataField="UnitPrice" HeaderText="ราคาต่อหน่วย" />
                            <asp:BoundField DataField="TotalPrice" HeaderText="ราคารวม" />
                            <asp:BoundField DataField="VAT" HeaderText="ภาษีมูลค่าเพิ่ม" />
                            <asp:BoundField DataField="NetTotal" HeaderText="ราคารวมสุทธิ" />
                            <asp:BoundField DataField="CurrencyUnit" HeaderText="สกุลเงิน" />
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
    </table>
</asp:Content>
