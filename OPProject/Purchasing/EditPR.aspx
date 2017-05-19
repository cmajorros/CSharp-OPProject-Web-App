<%@ Page Title="" Language="C#" MasterPageFile="~/OP.Master" AutoEventWireup="true" CodeBehind="EditPR.aspx.cs" Inherits="OPProject.Purchasing.ApprovedPR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style9
        {
            width: 1100px;
        }
        .style10
        {
            width: 89px;
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
                    ค้นหาใบจัดซื้้อ&nbsp;
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:ImageButton ID="ImageButton1" runat="server" 
                        ImageUrl="~/Very_Basic/search.png" onclick="ImageButton1_Click" />
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
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        onselectedindexchanged="GridView1_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="PCRID" HeaderText="เลขที่ใบขอซื้อ" />
                            <asp:BoundField DataField="RawID" HeaderText="รหัสวัตถุดิบ" />
                            <asp:BoundField DataField="RawName" HeaderText="ชื่อวัตถุดิบ" />
                            <asp:BoundField DataField="PCRQty" HeaderText="จำนวน" />
                            <asp:BoundField DataField="PCRUnit" HeaderText="หน่วย" />
                            <asp:CommandField SelectText="เลือกทำรายการ" ShowSelectButton="True" />
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
                <asp:Panel ID="PanelApprove" runat="server" Visible="False">
                    <asp:DetailsView ID="DetailsView1" runat="server" 
    Height="50px" Width="125px">
                    </asp:DetailsView>
                    <br />
                    <asp:Button ID="btnApprove" runat="server" onclick="btnApprove_Click" 
                        Text="อนุมัติใบขอซื้อ" />
                    &nbsp;&nbsp;<asp:Button ID="btnNotApprove" runat="server" onclick="btnNotApprove_Click" 
                        Text="ไม่อนุมัติ" />
                    &nbsp;
                    <asp:Button ID="btnEditQty" runat="server" onclick="btnEditQty_Click" 
                        Text="แก้ไขรายละเอียด" />
                    &nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="ยกเลิก" />
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
                <asp:Panel ID="PanelCancel" runat="server">
                    <asp:Panel ID="Panel3" runat="server" Visible="False">
                        กรุณาระบุเหตุผลในการไม่อนุมัติ
                        <asp:TextBox ID="txtRemark" runat="server" Height="21px" 
        Width="256px"></asp:TextBox>
                        &nbsp;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnSave" runat="server" onclick="btnSave_Click" Text="บันทึก" />
                        &nbsp;
                        <asp:Button ID="btnCancelUnApp" runat="server" onclick="btnCancelUnApp_Click" 
                            Text="ยกเลิก" />
                    </asp:Panel>
                </asp:Panel>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td>
                <asp:Panel ID="Panel4" runat="server" Visible="False">
                    จำนวนสั่งซื้อ&nbsp;&nbsp;
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    &nbsp;
                    <asp:Label ID="lblUnit" runat="server" Text="Label"></asp:Label>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnSaveEdit" runat="server" onclick="btnSaveEdit_Click" 
                        Text="บันทึก" />
                    &nbsp;
                    <asp:Button ID="btnCancelEdit" runat="server" Text="ยกเลิก" />
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
    </table>
</asp:Content>
