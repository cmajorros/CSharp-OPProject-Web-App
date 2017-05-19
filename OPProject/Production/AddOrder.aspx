<%@ Page Title="" Language="C#" MasterPageFile="~/OP.Master" AutoEventWireup="true" CodeBehind="AddOrder.aspx.cs" Inherits="OPProject.Production.Order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style9
        {
            width: 100%;
        }
        .style10
        {
        }
        .style12
        {
            width: 246px;
        }
        .style13
        {
            width: 136px;
        }
        .style15
        {
            width: 345px;
        }
        .style16
        {
            width: 136px;
            height: 30px;
        }
        .style17
        {
            width: 345px;
            height: 30px;
        }
        .style18
        {
            height: 30px;
        }
        .style19
        {
            width: 246px;
            height: 30px;
        }
        .style20
        {
            width: 30px;
        }
        .style21
        {
            height: 53px;
            width: 30px;
        }
        .style22
        {
            font-size: medium;
        }
        .style23
        {
            width: 124px;
        }
        .style26
        {
            width: 412px;
        }
        .style30
        {
            width: 124px;
            height: 21px;
        }
        .style31
        {
            width: 412px;
            height: 21px;
        }
        .style32
        {
            height: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style9">
        <tr>
            <td class="style20">
                &nbsp;</td>
            <td class="style10">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style20">
                &nbsp;</td>
            <td class="style22">
                <strong>บันทึกคำสั่งผลิต</strong></td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style21">
                &nbsp;</td>
            <td colspan="3">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="PanelJobOrder" runat="server">
                            <table>
                                <tr>
                                    <td class="style13">
                                        เลขที่คำสั่งผลิต:&nbsp;
                                    </td>
                                    <td class="style15">
                                        <asp:Label ID="LblJobID" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                    <td class="style12">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style16">
                                        ชื่อลูกค้า:</td>
                                    <td class="style17">
                                        <asp:DropDownList ID="DdlCusName" runat="server" AutoPostBack="True" 
                                            DataSourceID="SqlDataSourceCusID" DataTextField="CusName" 
                                            DataValueField="CusID" Height="21px" 
                                            onselectedindexchanged="DdlCusName_SelectedIndexChanged" Width="129px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSourceCusID" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:OPGarment %>" 
                                            SelectCommand="SELECT [CusID], [CusName] FROM [Customers]">
                                        </asp:SqlDataSource>
                                    </td>
                                    <td class="style18">
                                    </td>
                                    <td class="style19">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        วันที่รับคำสั่งผลิต:</td>
                                    <td class="style15">
                                        <asp:TextBox ID="TxtOrderDate" runat="server" ReadOnly="True"></asp:TextBox>
                                        <asp:ImageButton ID="BtnOrderDate" runat="server" 
                                            ImageUrl="~/Very_Basic/calendar.png" onclick="BtnOrderDate_Click" 
                                            Width="32px" />
                                        <asp:Calendar ID="CalendarOrder" runat="server" Visible="False"></asp:Calendar>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                    <td class="style12">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        วันส่งมอบสินค้า:</td>
                                    <td class="style15">
                                        <asp:TextBox ID="TxtDelDate" runat="server"></asp:TextBox>
                                        <asp:ImageButton ID="BtnDelDate" runat="server" 
                                            ImageUrl="~/Very_Basic/calendar.png" onclick="BtnDelDate_Click" Width="32px" />
                                        <asp:Calendar ID="CalendarDelivery" runat="server" 
                                            onselectionchanged="CalendarDelivery_SelectionChanged" Visible="False">
                                        </asp:Calendar>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblDateErr" runat="server" ForeColor="Red" 
                                            Text="วันส่งมอบสินค้าควรมากกว่า 60 วัน" Visible="False"></asp:Label>
                                    </td>
                                    <td class="style12">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        &nbsp;</td>
                                    <td class="style15">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td class="style12">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        แบบสินค้า:</td>
                                    <td class="style15">
                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
                                            onselectedindexchanged="RadioButtonList1_SelectedIndexChanged">
                                            <asp:ListItem Value="0">แบบสินค้าที่มีอยู่แล้ว</asp:ListItem>
                                            <asp:ListItem Value="1">แบบสินค้าใหม่</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:Panel ID="Panel4" runat="server">
                                            แบบสินค้า
                                            <asp:DropDownList ID="DdlModel" runat="server" AppendDataBoundItems="True" 
                                                AutoPostBack="True" DataSourceID="SqlDataSourceStyle" DataTextField="StyleID" 
                                                DataValueField="StyleID" onselectedindexchanged="DdlModel_SelectedIndexChanged" 
                                                Width="117px">
                                                <asp:ListItem Value="0">กรุณาเลือกแบบสินค้า</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSourceStyle" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:OPGarment %>" 
                                                SelectCommand="SELECT [StyleID] FROM [Styles] WHERE ([CusID] = @CusID)">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="DdlCusName" Name="CusID" 
                                                        PropertyName="SelectedValue" Type="String" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                    <br />
                                            <asp:Image ID="Image1" runat="server" Height="155px" Width="220px" />
                                    <br />
                                        </asp:Panel>
                                        <asp:Panel ID="PanelNewModel" runat="server">
                                            รหัสแบบสินค้า&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:TextBox ID="txtStyle" runat="server"></asp:TextBox>
&nbsp;<br />
                                            <br />
                                            เพิ่มแบบสินค้าใหม่
                                            <asp:FileUpload ID="FileUpload1" runat="server" />
                                            <asp:Label ID="lblImageError" runat="server" ForeColor="#CC0000" 
                                                Text="ชนิดข้อมูลไม่ถูกต้อง" Visible="False"></asp:Label>
                                        </asp:Panel>
                                <br />
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                    <td class="style12">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        &nbsp;</td>
                                    <td class="style15">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td class="style12">
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td class="style20">
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style20">
                &nbsp;</td>
            <td class="style22">
                <strong>รายละเอียดคำสั่งผลิต</strong></td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style20">
                &nbsp;</td>
            <td class="style10">
                <asp:Panel ID="PanelOrderDetail" runat="server">
                    <table>
                        <tr>
                            <td class="style23">
                                รหัสใบสั่งผลิตย่อย:</td>
                            <td class="style26">
                                <asp:Label ID="lblJIID" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style23">
                                ประเภทสินค้า:</td>
                            <td class="style26">
                                <asp:DropDownList ID="DdlProType" runat="server" AppendDataBoundItems="True" 
                                    DataSourceID="SqlDataSourceProductType" DataTextField="ProductTypeName" 
                                    DataValueField="ProductTypeID">
                                    <asp:ListItem Value="0">กรุณาเลือกประเภทสินค้า</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceProductType" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:OPGarment %>" 
                                    SelectCommand="SELECT [ProductTypeID], [ProductTypeName] FROM [ProductTypes]">
                                </asp:SqlDataSource>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style23">
                                รายละเอียดสินค้า:</td>
                            <td class="style26">
                                <asp:TextBox ID="txtJobDes" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style23">
                                ประเภทขนาด:</td>
                            <td class="style26">
                                <asp:DropDownList ID="DdlSizeType" runat="server" AppendDataBoundItems="True" 
                                    AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="SizeTypeName" 
                                    DataValueField="SizeTypeID">
                                    <asp:ListItem Value="0">กรุณาเลือกประเภทขนาด</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:OPGarment %>" 
                                    SelectCommand="SELECT [SizeTypeName], [SizeTypeID] FROM [SizeTypes]">
                                </asp:SqlDataSource>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                ขนาด:</td>
                            <td>
                                <asp:Panel ID="Panel3" runat="server">
                                    <asp:DropDownList ID="DdlSize" runat="server" AppendDataBoundItems="True" 
                                        DataSourceID="SqlDataSource2" DataTextField="SizeName" DataValueField="SizeID">
                                        <asp:ListItem Value="0">กรุณาเลือกขนาด</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:OPGarment %>" 
                                        SelectCommand="SELECT [SizeID], [SizeName] FROM [Sizes] WHERE ([SizeTypeID] = @SizeTypeID)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DdlSizeType" Name="SizeTypeID" 
                                                PropertyName="SelectedValue" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    &nbsp;&nbsp; จำนวน
                                    <asp:TextBox ID="TxtAmount" runat="server"></asp:TextBox>
                                    ชิ้น&nbsp;
                                    <br />
                                    <br />
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td class="style23">
                                ราคาต่อหน่วย:</td>
                            <td class="style26">
                                &nbsp;<asp:TextBox ID="TxtPrice" runat="server" ValidationGroup="a"></asp:TextBox>
                                &nbsp;<asp:DropDownList ID="DdlCurrency" runat="server">
                                    <asp:ListItem>USD</asp:ListItem>
                                    <asp:ListItem>THB</asp:ListItem>
                                    <asp:ListItem>JPY</asp:ListItem>
                                    <asp:ListItem>GBP</asp:ListItem>
                                    <asp:ListItem>EUR</asp:ListItem>
                                    <asp:ListItem>CAD</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style23">
                                &nbsp;</td>
                            <td class="style26">
                                <br />
                                <br />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style30">
                                </td>
                            <td class="style31">
                                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
                                    GridLines="None" onrowdeleting="GridView1_RowDeleting">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:CommandField ShowEditButton="True" />
                                        <asp:CommandField ShowDeleteButton="True" />
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
                            <td class="style32">
                                </td>
                        </tr>
                        <tr>
                            <td class="style30">
                                </td>
                            <td class="style31">
                                </td>
                            <td class="style32">
                                </td>
                        </tr>
                        <tr>
                            <td class="style23">
                                &nbsp;</td>
                            <td class="style26">
                                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="บันทึก" 
                                    ValidationGroup="a" />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style20">
                &nbsp;</td>
            <td class="style10">
                <asp:Button ID="BtnSave" runat="server" Text="บันทึก" onclick="BtnSave_Click" />
&nbsp;
                <asp:Button ID="BtnCancel" runat="server" Text="ยกเลิก" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style20">
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style20">
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style20">
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
