<%@ Page Title="" Language="C#" MasterPageFile="~/OP.Master" AutoEventWireup="true" CodeBehind="EditRaw.aspx.cs" Inherits="OPProject.Master.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style9
        {
            width: 100%;
        }
        .style10
        {
            width: 80px;
        }
        .style26
        {
            width: 174px;
        }
        .style15
        {
            font-size: medium;
        }
        .style27
        {
            width: 260px;
        }
        .style28
        {
            font-size: large;
        }
        .style41
        {
            font-size: large;
            font-weight: bold;
            color: #3333CC;
        }
        .style42
        {
            font-size: large;
            font-weight: bold;
        }
        .style43
        {
            width: 80px;
            height: 34px;
        }
        .style44
        {
            height: 34px;
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
                <asp:Panel ID="PanelSearch" runat="server">
                    <b><span class="style28">ค้นหาข้อมูลวัตถุดิบ</span></b><br />
                    <br />
                    <table class="style9">
                        <tr>
                            <td class="style26" nowrap="nowrap">
                                <span class="style15">รหัสวัตถุดิบ หรือ
                                <br />
                                ชื่อชื่อวัตถุดิบ:</span>&nbsp;</td>
                            <td class="style27">
                                <asp:TextBox ID="TxtIDName" runat="server" Height="27px" Width="204px"></asp:TextBox>
                                &nbsp;
                                <asp:ImageButton ID="ImageButton1" runat="server" 
                                    ImageUrl="~/Very_Basic/search.png" onclick="ImageButton1_Click" />
                            </td>
                            <td>
                                <asp:Button ID="BtnFindAll" runat="server" Height="32px" 
                                    onclick="BtnFindAll_Click" Text="ค้นหารายการวัตถุดิบทั้งหมด" Width="180px" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style43">
                </td>
            <td class="style44">
                <asp:Panel ID="PanelUpdateResult" runat="server" Visible="False">
                    <span class="style41">ปรับปรุงข้อมูลวัตถุดิบเรียบร้อยแล้ว</span></asp:Panel>
            </td>
            <td class="style44">
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
                <asp:Panel ID="PanelSearchResult" runat="server" Visible="False">
                    <span class="style42">ผลการค้นหา</span><br />
                    <br />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" ForeColor="#333333" GridLines="None" Width="510px" 
                        onselectedindexchanged="GridView1_SelectedIndexChanged" 
                        style="text-align: center">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField SelectText="เลือก" ShowSelectButton="True" />
                            <asp:BoundField DataField="RawID" HeaderText="รหัสวัตถุดิบ" />
                            <asp:BoundField DataField="RawName" HeaderText="ชื่อวัตถุดิบ" />
                            <asp:BoundField DataField="RawUnitName" HeaderText="หน่วย" />
                            <asp:BoundField DataField="RawTypeID" HeaderText="RawTypeID" Visible="False" />
                            <asp:BoundField DataField="RawTypeName" HeaderText="ประเภท" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                </asp:Panel>
                <br />
                <asp:Panel ID="PanelDetailView" runat="server" style="font-size: small" 
                    Visible="False">
                    <b><span class="style28">รายละเอียดข้อมูลวัตถุดิบ</span></b><br />
                    <br />
                    <asp:DetailsView ID="DetailsView1" runat="server" BackColor="White" 
                        BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                        GridLines="Horizontal" Height="50px" Width="125px">
                        <AlternatingRowStyle BackColor="#F7F7F7" />
                        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    </asp:DetailsView>
                    <br />
                    <br />
                </asp:Panel>
                <br />
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
