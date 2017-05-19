<%@ Page Title="" Language="C#" MasterPageFile="~/OP.Master" AutoEventWireup="true" CodeBehind="EditJobOrderItem.aspx.cs" Inherits="OPProject.Production.EditJobOrderItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style9
        {
            width: 100%;
        }
        .style10
        {
            width: 136px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style9">
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
                    ค้นหาคำสั่งผลิต
                    <asp:TextBox ID="txtFindJO" runat="server" Width="211px"></asp:TextBox>
                    &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" 
                        ImageUrl="~/Very_Basic/search.png" onclick="ImageButton1_Click" />
                    <br />
                    <br />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        onselectedindexchanged="GridView1_SelectedIndexChanged">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="JobID" HeaderText="เลขที่คำสั่งผลิต" />
                            <asp:BoundField DataField="JobStatus" HeaderText="สถานะ" />
                            <asp:BoundField DataField="CusName" HeaderText="ชื่อลูกค้า" />
                            <asp:BoundField DataField="OrderDate" DataFormatString="{0:d}" 
                                HeaderText="วันที่รับคำสั่งผลิต" />
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
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="JobItemID" HeaderText="เลขที่คำสั่งผลิตย่อย" />
                        <asp:BoundField DataField="JobItemStatus" HeaderText="สถานะการผลิต" />
                        <asp:BoundField DataField="JobItemName" HeaderText="ชื่อสินค้า" />
                        <asp:BoundField DataField="JobItemDes" HeaderText="รายละเอียดสินค้า" />
                        <asp:BoundField DataField="JobItemQty" HeaderText="จำนวน (ชิ้น)" />
                    </Columns>
                </asp:GridView>
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
    </table>
</asp:Content>

