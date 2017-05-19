<%@ Page Title="" Language="C#" MasterPageFile="~/OP.Master" AutoEventWireup="true" CodeBehind="EditCus.aspx.cs" Inherits="OPProject.Master.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style9
        {
            width: 100%;
        }
        .style10
        {
            width: 69px;
        }
        .style11
        {
            font-size: large;
        }
        .style12
        {
            font-size: medium;
            width: 122px;
        }
        .style13
        {
            width: 361px;
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
                <asp:Panel ID="PanelSearch" runat="server">
                    <b><span class="style11">ค้นหาข้อมูลลูกค้า
                    <br />
                    </span></b>
                    <table class="style9">
                        <tr>
                            <td class="style12">
                                รหัสลูกค้า หรือ<br /> ชื่อลูกค้า
                            </td>
                            <b>
                            <td class="style13">
                                &nbsp;<asp:TextBox ID="TxtIDName" runat="server" Height="26px" Width="203px"></asp:TextBox>
                                &nbsp;&nbsp;
                                <asp:ImageButton ID="ImageButton1" runat="server" 
                                    ImageUrl="~/Very_Basic/search.png" onclick="ImageButton1_Click" />
                            </td>
                            <td>
                                &nbsp;<asp:Button ID="BtnSearchAll" runat="server" Height="35px" 
                                    onclick="BtnSearchAll_Click" Text="ค้นหารายการลูกค้าทั้งหมด" Width="164px" />
                                &nbsp;</td>
                            </b>
                        </tr>
                    </table>
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
                <asp:Panel ID="PanelSuccess" runat="server" Visible="False">
                    <span class="style41">ปรับปรุงข้อมูลลูกค้าเรียบร้อยแล้ว&nbsp; คลิ้ก ที่นี่ 
                    กลับเมนูหลัก</span></asp:Panel>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td>
                <asp:Panel ID="PanelResult" runat="server" Visible="False">
                    <span class="style42">ผลการค้นหา<br />
                    </span>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" DataKeyNames="CusID" ForeColor="#333333" GridLines="None" 
                        Width="535px" onselectedindexchanged="GridView1_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" SelectText="เลือก" />
                            <asp:BoundField DataField="CusID" HeaderStyle-HorizontalAlign="Center" 
                                HeaderText="รหัสลูกค้า" ItemStyle-HorizontalAlign="Center"  >
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CusName" HeaderText="ชื่อลูกค้า" />
                            <asp:BoundField DataField="CusAdd" HeaderText="ที่อยู่" />
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
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td>
                <asp:Panel ID="PanelEdit" runat="server" Visible="False" 
                    style="margin-left: 0px">
                    <span><span class="style42">รายละเอียดข้อมูลลูกค้า</span><b><br /> </b>
                    <br />
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                        BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
                        CellPadding="3" DataSourceID="SqlDataSource1" GridLines="Horizontal" 
                        Height="50px" onitemupdated="DetailsView1_ItemUpdated1" 
                        onpageindexchanging="DetailsView1_PageIndexChanging" 
                        style="margin-left: 0px; margin-right: 1px; font-size: medium;" 
                        Width="292px" DataKeyNames="CusID">
                        <AlternatingRowStyle BackColor="#F7F7F7" />
                        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <Fields>
                            <asp:BoundField DataField="CusID" HeaderText="รหัสลูกค้า" ReadOnly="True" 
                                InsertVisible="False" SortExpression="CusID" />
                            <asp:BoundField DataField="CusName" HeaderText="ชื่อลูกค้า" 
                                SortExpression="CusName" />
                            <asp:BoundField DataField="CusAdd" HeaderText="ที่อยู่" 
                                SortExpression="CusAdd" />
                            <asp:BoundField DataField="CusTel" HeaderText="โทรศัพท์" 
                                SortExpression="CusTel" />
                            <asp:BoundField DataField="CusEmail" HeaderText="อีเมลล์" 
                                SortExpression="CusEmail" />
                            <asp:CommandField CancelText="ยกเลิก" EditText="แก้ไข" ShowEditButton="True" 
                                UpdateText="ปรับปรุง" />
                        </Fields>
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    </asp:DetailsView>
                    </span><b>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:OPGarment %>" 
                        SelectCommand="SELECT [CusID], [CusName], [CusAdd], [CusTel], [CusEmail] FROM [Customers] WHERE ([CusID] = @CusID)" 
                        
                        UpdateCommand="UPDATE Customers SET CusName = @CusName, CusAdd = @CusAdd, CusTel = @CusTel, CusEmail = @CusEmail Where CusID = @CusID">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="CusID" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="CusName" />
                            <asp:Parameter Name="CusAdd" />
                            <asp:Parameter Name="CusTel" />
                            <asp:Parameter Name="CusEmail" />
                            <asp:Parameter Name="CusID" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    </b>
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
    </table>
</asp:Content>
