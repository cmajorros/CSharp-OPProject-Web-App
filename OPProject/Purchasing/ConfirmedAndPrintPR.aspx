<%@ Page Title="" Language="C#" MasterPageFile="~/OP.Master" AutoEventWireup="true" CodeBehind="ConfirmedAndPrintPR.aspx.cs" Inherits="OPProject.Purchasing.ConfirmedAndPrintPR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style9
        {
            width: 1100px;
        }
        .style10
        {
            width: 100px;
        }
        .style12
        {
            width: 899px;
        }
        .style13
        {
            width: 100px;
            height: 8px;
        }
        .style15
        {
            text-align: center;
        }
        .style16
        {
            height: 8px;
            width: 899px;
        }
        .style17
        {
            width: 240px;
            height: 101px;
        }
        .style20
        {
            text-decoration: underline;
        }
        .style24
        {
            width: 206px;
        }
        .style25
        {
            height: 17px;
            font-size: large;
            text-align: center;
        }
        .style26
        {
            font-size: x-large;
        }
        .style27
        {
            margin-left: 195px;
        }
        .style28
        {
            width: 318px;
        }
        .style29
        {
            width: 318px;
            text-align: center;
            font-size: medium;
        }
        .style30
        {
            height: 17px;
        }
        .style31
        {
            width: 318px;
            height: 17px;
            text-align: right;
        }
        .style32
        {
            width: 206px;
            height: 17px;
        }
        .style33
        {
            width: 318px;
            text-align: right;
        }
        .style34
        {
            width: 206px;
            text-align: center;
        }
        .style35
        {
            width: 318px;
            height: 17px;
        }
        .style36
        {
            height: 15px;
        }
        .style37
        {
            width: 318px;
            height: 15px;
        }
        .style38
        {
            width: 206px;
            height: 15px;
            text-align: center;
        }
        .style39
        {
            width: 206px;
            text-align: right;
        }
        .style40
        {
            width: 206px;
            height: 17px;
            text-align: right;
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
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td class="style12">
                <asp:Panel ID="Panel1" runat="server">
                    <div class="style15">
                        <strong>ระบบได้ทำการบันทึกการเสนอราคาเรียบร้อยแล้ว
                        <br />
                        คลิก
                        <asp:LinkButton ID="LinkButton3" runat="server" onclick="LinkButton3_Click">พิมพ์ใบจัดซื้อ </asp:LinkButton>
                        และคลิกที่นี่
                        <asp:LinkButton ID="LinkButton4" runat="server" onclick="LinkButton4_Click">อีเมล์แจ้งผลการเสนอราคา</asp:LinkButton>
                        </strong>
                    </div>
                </asp:Panel>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style13">
            </td>
            <td class="style16">
            </td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td class="style12">
                <asp:Panel ID="Panel2" runat="server" Visible="False">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                &nbsp;&nbsp;&nbsp;
                                <img alt="" class="style17" 
                src="http://localhost:49207/LogoWithAdd.gif" />
                            </td>
                            <td class="style28">
                                &nbsp;</td>
                            <td class="style24">
                                เลขที่ใบขอซื้อ
                                <asp:Label ID="lblPRNo" runat="server" Text="Label"></asp:Label>
                                <br />
                                วันที่จัดส่งสินค้า&nbsp;
                                <asp:Label ID="lblDelDate" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td class="style28">
                                &nbsp;</td>
                            <td class="style24">
                                วันที่ออกเอกสาร
                                <asp:Label ID="lblPrintDate" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td class="style29">
                                <strong><span class="style26">ใบจัดซื้อ</span> </strong>
                            </td>
                            <td class="style24">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td class="style29">
                                &nbsp;</td>
                            <td class="style24">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                &nbsp;&nbsp;<strong>ชื่อ</strong>&nbsp;
                                <asp:Label ID="lblSupName" runat="server" CssClass="style20" Text="Label" 
                                    Width="200px"></asp:Label>
                                &nbsp; <strong>&nbsp;ที่อยู่</strong>&nbsp;
                                <asp:Label ID="lblSupAdd" runat="server" CssClass="style20" Text="Label" 
                                    Width="250px"></asp:Label>
                                &nbsp;&nbsp; <strong>เบอร์โทรศัพท์</strong>&nbsp;&nbsp;
                                <asp:Label ID="lblSupTel" runat="server" CssClass="style20" Text="Label"></asp:Label>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                &nbsp; <strong>โทรสาร</strong> &nbsp;<asp:Label ID="lblFax" runat="server" 
                                    CssClass="style20" Text="Label" Width="100px"></asp:Label>
                                &nbsp; <strong>อีเมลล์</strong>&nbsp;
                                <asp:Label ID="lblSupEmail" runat="server" CssClass="style20" Text="Label" 
                                    Width="200px"></asp:Label>
                                <strong>เลขที่คำสั่งผลิต</strong>
                                <asp:Label ID="lblJobID" runat="server" CssClass="style20" Text="Label" 
                                    Width="80px"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td class="style28">
                                &nbsp;</td>
                            <td class="style24">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style25" colspan="3">
                                <strong>
                                <br />
                                รายการสินค้า<br /> </strong>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="4" CssClass="style27" ForeColor="#333333" GridLines="None" 
                                    Width="547px">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                    <asp:TemplateField>
    <ItemTemplate>
        <%# Container.DataItemIndex + 1 %>
    </ItemTemplate>
</asp:TemplateField>
                                        <asp:BoundField DataField="RawName" HeaderText="รายการสินค้า" />
                                        <asp:BoundField DataField="RawQty" HeaderText="จำนวน" >
                                        <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="RawUnit" HeaderText="หน่วย" />
                                        <asp:BoundField DataField="UnitPrice" HeaderText="ราคาต่อหน่วย" />
                                        <asp:BoundField DataField="ContactSupCost" HeaderText="รวม" >
                                        <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="CurrencyUnit" HeaderText="สกุลเงิน" />
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
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td class="style33">
                                รวมเป็นเงิน&nbsp;&nbsp;
                            </td>
                            <td class="style39">
                                <asp:Label ID="lblTotal" runat="server" Text="Label" Width="150px"></asp:Label>
                                &nbsp;&nbsp;&nbsp;
                                <asp:Label ID="Label15" runat="server" Text="บาท"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style30">
                                &nbsp;</td>
                            <td class="style31">
                                &nbsp;</td>
                            <td class="style32">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style30">
                            </td>
                            <td class="style31">
                                ภาษีมูลค่าเพิ่ม&nbsp;&nbsp;
                            </td>
                            <td class="style40">
                                <asp:Label ID="lblTax" runat="server" Text="Label" Width="150px"></asp:Label>
                                &nbsp;&nbsp;&nbsp;
                                <asp:Label ID="Label16" runat="server" Text="บาท"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td class="style33">
                                &nbsp;</td>
                            <td class="style24">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td class="style33">
                                รวมสุทธิ&nbsp;&nbsp;
                            </td>
                            <td class="style39">
                                <asp:Label ID="lblNetTotal" runat="server" Font-Underline="False" style="" 
                                    Text="Label" Width="150px"></asp:Label>
                                &nbsp;&nbsp;&nbsp;
                                <asp:Label ID="Label17" runat="server" Text="บาท"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td class="style28">
                                &nbsp;</td>
                            <td class="style24">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td class="style28">
                                &nbsp;</td>
                            <td class="style24">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td class="style28">
                                &nbsp;</td>
                            <td class="style24">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style15">
                                <strong>ผู้รับใบสั่่งซื้อ</strong></td>
                            <td class="style28">
                                &nbsp;</td>
                            <td class="style34">
                                <strong>ผู้ขอซื้อ</strong></td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td class="style28">
                                &nbsp;</td>
                            <td class="style24">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style30">
                                &nbsp;&nbsp;&nbsp;&nbsp; __________________________________________</td>
                            <td class="style35">
                            </td>
                            <td class="style32">
                                ___________________________________________</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td class="style28">
                                &nbsp;</td>
                            <td class="style24">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;&nbsp;&nbsp; (_________________________________________)&nbsp;</td>
                            <td class="style28">
                                &nbsp;</td>
                            <td class="style24">
                                (_________________________________________)</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td class="style28">
                                &nbsp;</td>
                            <td class="style24">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style36">
                                &nbsp;&nbsp;&nbsp;&nbsp; ____________/____________/____________&nbsp;</td>
                            <td class="style37">
                            </td>
                            <td class="style38">
                                ____________/____________/____________&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td class="style28">
                                &nbsp;</td>
                            <td class="style24">
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
            <td class="style12">
                <asp:Panel ID="Panel3" runat="server" Visible="False">
                    <div class="style15">
                        พิมพ์ใบจัดซื้อ
                        <asp:ImageButton ID="ImageButton1" runat="server" 
                            ImageUrl="~/Very_Basic/print.png" />
                        &nbsp;</div>
                </asp:Panel>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td class="style12">
                <asp:Panel ID="PanelEmail" runat="server" Visible="False">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="style12" colspan="2">
                                <strong>แจ้งผลการเสนอราคา </strong>
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
                                ถึง</td>
                            <td>
                                <asp:TextBox ID="txtTo" runat="server" Width="400px"></asp:TextBox>
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
                                หัวข้อ</td>
                            <td>
                                <asp:TextBox ID="txtSubject" runat="server" Width="400px"></asp:TextBox>
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
                                ข้อความ</td>
                            <td>
                                <asp:TextBox ID="txtMessage" runat="server" Height="378px" TextMode="MultiLine" 
                                    Width="400px"></asp:TextBox>
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
                                <asp:Button ID="Button1" runat="server" Text="ส่งอีเมลล์" 
                                    onclick="Button1_Click" />
                                &nbsp;
                                <asp:Button ID="Button2" runat="server" Text="ยกเลิก" />
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
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td class="style12">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
