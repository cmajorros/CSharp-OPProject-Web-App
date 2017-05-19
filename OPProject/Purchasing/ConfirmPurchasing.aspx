<%@ Page Title="" Language="C#" MasterPageFile="~/OP.Master" AutoEventWireup="true" CodeBehind="ConfirmPurchasing.aspx.cs" Inherits="OPProject.Purchasing.ConfirmPurchasing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .style9
    {
        width: 1100px;
    }
    .style10
    {
        width: 166px;
    }
    .style11
    {
        width: 353px;
    }
    .style12
    {
        width: 678px;
    }
        .style13
        {
            height: 17px;
        }
        .style14
        {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table cellpadding="0" cellspacing="0" class="style9">
    <tr>
        <td class="style10">
            &nbsp;</td>
        <td class="style12">
            &nbsp;</td>
        <td class="style11">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style10">
            &nbsp;</td>
        <td class="style12">
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
        <td class="style11">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style10">
            &nbsp;</td>
        <td class="style12">
            &nbsp;</td>
        <td class="style11">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style10">
            &nbsp;</td>
        <td class="style12">
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
                            <asp:CommandField SelectText="รายละเอียดผู้จำหน่าย" ShowSelectButton="True" />
                        </Columns>
                    </asp:GridView>
                </asp:Panel>
            </td>
        <td class="style11">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style10">
            &nbsp;</td>
        <td class="style12">
            &nbsp;</td>
        <td class="style11">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style10">
            &nbsp;</td>
        <td class="style12">
            <asp:Panel ID="Panel3" runat="server">
                <asp:GridView ID="GridView3" runat="server" 
                    onselectedindexchanged="GridView3_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                    </Columns>
                </asp:GridView>
            </asp:Panel>
        </td>
        <td class="style11">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style10">
            &nbsp;</td>
        <td class="style12">
            <asp:Panel ID="Panel4" runat="server">
            </asp:Panel>
        </td>
        <td class="style11">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style10">
            &nbsp;</td>
        <td class="style12">
            <asp:Panel ID="Panel5" runat="server">
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            ข้อมูลผู้จัดจำหน่าย</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px">
                            </asp:DetailsView>
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
                            ข้อมูลการเสนอราคา</td>
                        <td>
                            &nbsp;&nbsp;</td>
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
                            จำนวน</td>
                        <td>
                            <asp:Label ID="lblRawQty" runat="server" Text="Label"></asp:Label>
                            &nbsp;
                            <asp:Label ID="lblUnit" runat="server" Text="Label"></asp:Label>
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
                            แหล่งที่มาของสินค้า</td>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
                                onselectedindexchanged="RadioButtonList1_SelectedIndexChanged">
                                <asp:ListItem Value="1">ในประเทศ</asp:ListItem>
                                <asp:ListItem Value="2">นำเข้าจากต่างประเทศ</asp:ListItem>
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
                            ราคาต่อหน่วย</td>
                        <td>
                            <asp:TextBox ID="txtUnitPrice" runat="server"></asp:TextBox>
                            <asp:Label ID="lblCurUnit1" runat="server" Text="Label"></asp:Label>
                            <asp:DropDownList ID="DdlCurrencyunit" runat="server" AutoPostBack="True" 
                                onselectedindexchanged="DdlCurrencyunit_SelectedIndexChanged">
                                <asp:ListItem>USD</asp:ListItem>
                                <asp:ListItem>THB</asp:ListItem>
                                <asp:ListItem>JPY</asp:ListItem>
                                <asp:ListItem>GBP</asp:ListItem>
                                <asp:ListItem>EUR</asp:ListItem>
                                <asp:ListItem>CAD</asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;<asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="คำนวณ" />
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
                            ราคารวม</td>
                        <td class="style14">
                            <asp:TextBox ID="txtConfirmedPrice" runat="server" ReadOnly="True"  
                                TabIndex="0">0.00</asp:TextBox>
                            <asp:Label ID="lblCurUnit2" runat="server" Text="Label"></asp:Label>
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
                        <td class="style13">
                            ภาษีมูลค่าเพิ่ม 7 เปอร์เซ็น
                        </td>
                        <td class="style13">
                            <asp:TextBox ID="txtVAT" runat="server" ReadOnly="True">0.00</asp:TextBox>
                            <asp:Label ID="lblCurUnit3" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td class="style13">
                        </td>
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
                        <td class="style13">
                            ราคารวมสุทธิ</td>
                        <td class="style13">
                            <asp:TextBox ID="txtNetTotal" runat="server" ReadOnly="True">0.00</asp:TextBox>
                            <asp:Label ID="lblCurUnit4" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td class="style13">
                        </td>
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
                            วันที่ส่งสินค้า</td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            <asp:ImageButton ID="ImageButton2" runat="server" 
                                ImageUrl="~/Very_Basic/calendar.png" onclick="ImageButton2_Click" />
                            <asp:Calendar ID="Calendar1" runat="server" 
                                onselectionchanged="Calendar1_SelectionChanged" Visible="False">
                            </asp:Calendar>
                        </td>
                        <td>
                            <asp:Label ID="lblErrorDate" runat="server" ForeColor="Red" 
                                Text="วันที่ส่งสินค้าควรมีค่ามากกว่าหรือเทากับวันที่ปัจจุบัน" Visible="False"></asp:Label>
                        </td>
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
                            <asp:Button ID="btnConfrim" runat="server" onclick="btnConfrim_Click" 
                                Text="ยืนยันการเสนอราคา" />
                            &nbsp;
                            <asp:Button ID="btnCancel" runat="server" Text="ยกเลิก" />
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
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
        <td class="style11">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style10">
            &nbsp;</td>
        <td class="style12">
            &nbsp;</td>
        <td class="style11">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style10">
            &nbsp;</td>
        <td class="style12">
            &nbsp;</td>
        <td class="style11">
            &nbsp;</td>
    </tr>
</table>
</asp:Content>
