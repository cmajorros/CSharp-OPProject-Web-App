<%@ Page Title="" Language="C#" MasterPageFile="~/OP.Master" AutoEventWireup="true" CodeBehind="ContactVendor.aspx.cs" Inherits="OPProject.Purchasing.ContactVendor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .style9
    {
        width: 1100px;
    }
    .style10
    {
        width: 115px;
    }
    .style11
    {
        width: 844px;
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
                    ค้นหาคำสั่งผลิต
                    <asp:TextBox ID="txtFindJO" runat="server" Width="211px"></asp:TextBox>
                    &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" 
                        ImageUrl="~/Very_Basic/search.png" onclick="ImageButton1_Click" />
                    <br />
                    <br />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        onselectedindexchanged="GridView1_SelectedIndexChanged" 
                        DataKeyNames="JobID">
                        <Columns>
                            <asp:BoundField DataField="JobID" HeaderText="เลขที่คำสั่งผลิต" />
                            <asp:BoundField DataField="JobStatus" HeaderText="สถานะ" />
                            <asp:BoundField DataField="CusName" HeaderText="ชื่อลูกค้า" />
                            <asp:BoundField DataField="OrderDate" DataFormatString="{0:d}" 
                                HeaderText="วันที่รับคำสั่งผลิต" />
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
                <asp:Panel ID="Panel2" runat="server" Visible="False">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                        onselectedindexchanged="GridView2_SelectedIndexChanged1">
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
                <br />
                <asp:GridView ID="GridView3" runat="server" 
    AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="SupID" 
            HeaderText="รหัสผู้จัดจำหน่าย" />
                        <asp:BoundField DataField="SupName" 
            HeaderText="ชื่อผู้จัดจำหน่าย" />
                        <asp:BoundField DataField="SupContact" 
            HeaderText="บุคคลที่สามารถติดต่อได้" />
                        <asp:BoundField DataField="SupAdd" HeaderText="ที่อยู่" />
                        <asp:BoundField DataField="SupTel" 
            HeaderText="โทรศัพท์" />
                        <asp:BoundField DataField="SupFax" HeaderText="โทรสาร" />
                        <asp:BoundField DataField="SupEmail" 
            HeaderText="อีเมลล์" />
                    </Columns>
                </asp:GridView>
                <br />
                <asp:Button ID="btnSendMail" runat="server" onclick="btnSendMail_Click" 
                    Text="ส่งอีเมลล์" />
            </asp:Panel>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style10">
            &nbsp;</td>
        <td class="style11">
            <asp:Panel ID="PanelEmail" runat="server" Visible="False">
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            ถึง :
                        </td>
                        <td>
                            <asp:TextBox ID="txtTo" runat="server" Width="350px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            หัวข้อ :
                        </td>
                        <td>
                            <asp:TextBox ID="txtSubject" runat="server" Width="350px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            ข้อความ&nbsp;&nbsp;&nbsp;
                            <br />
                        </td>
                        <td>
                            <asp:TextBox ID="txtMessage" runat="server" Height="261px" TextMode="MultiLine" 
                                Width="350px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                                Text="ส่งจดหมาย" />
                            &nbsp;
                            <asp:Button ID="Button2" runat="server" Text="ยกเลิก" />
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
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>
