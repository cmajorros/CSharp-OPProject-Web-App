<%@ Page Title="" Language="C#" MasterPageFile="~/OP.Master" AutoEventWireup="true" CodeBehind="EditOrder.aspx.cs" Inherits="OPProject.Production.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style9
        {
            width: 100%;
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
        .style20
        {
            width: 76px;
        }
        .style21
        {
            width: 695px;
        }
        .style22
        {
            width: 76px;
            height: 21px;
        }
        .style23
        {
            width: 695px;
            height: 21px;
        }
        .style24
        {
            height: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style9">
        <tr>
            <td class="style22">
            </td>
            <td class="style23">
            </td>
            <td class="style24">
            </td>
            <td class="style24">
            </td>
            <td class="style24">
            </td>
            <td class="style24">
            </td>
            <td class="style24">
            </td>
        </tr>
        <tr>
            <td class="style20">
                &nbsp;</td>
            <td class="style21">
                ค้นหาคำสั่งผลิต&nbsp;
                <asp:TextBox ID="txtFindJO" runat="server"></asp:TextBox>
&nbsp;
                <asp:ImageButton ID="ImageButton1" runat="server" 
                    ImageUrl="~/Very_Basic/search.png" onclick="ImageButton1_Click" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style20">
                &nbsp;</td>
            <td class="style21">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style20">
                &nbsp;</td>
            <td class="style21">
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
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style20">
                &nbsp;</td>
            <td class="style21">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style20">
                &nbsp;</td>
            <td class="style21">
                        <asp:Panel ID="PanelJobOrder" runat="server" Visible="False">
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
                                </tr>
                                <tr>
                                    <td class="style16">
                                        ชื่อลูกค้า:</td>
                                    <td class="style17">
                                        <asp:DropDownList ID="DdlCusName" runat="server" AutoPostBack="True" 
                                            DataSourceID="SqlDataSourceCusID" DataTextField="CusName" 
                                            DataValueField="CusID" Height="21px" Width="129px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSourceCusID" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:OPGarment %>" 
                                            SelectCommand="SELECT [CusID], [CusName] FROM [Customers]">
                                        </asp:SqlDataSource>
                                    </td>
                                    <td class="style18">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        วันที่รับคำสั่งผลิต:</td>
                                    <td class="style15">
                                        <asp:TextBox ID="TxtOrderDate" runat="server" ReadOnly="True"></asp:TextBox>
                                        <asp:ImageButton ID="BtnOrderDate" runat="server" 
                                            ImageUrl="~/Very_Basic/calendar.png" 
                                            Width="32px" />
                                        <asp:Calendar ID="CalendarOrder" runat="server" Visible="False"></asp:Calendar>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        วันส่งมอบสินค้า:</td>
                                    <td class="style15">
                                        <asp:TextBox ID="TxtDelDate" runat="server"></asp:TextBox>
                                        <asp:ImageButton ID="BtnDelDate" runat="server" 
                                            ImageUrl="~/Very_Basic/calendar.png" 
                                            Width="32px" />
                                        <asp:Calendar ID="CalendarDelivery" runat="server" Visible="False">
                                        </asp:Calendar>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblDateErr" runat="server" ForeColor="Red" 
                                            Text="วันส่งมอบสินค้าควรมากกว่า 60 วัน" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        &nbsp;</td>
                                    <td class="style15">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        แบบสินค้า:</td>
                                    <td class="style15">
                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True">
                                            <asp:ListItem Value="0">แบบสินค้าที่มีอยู่แล้ว</asp:ListItem>
                                            <asp:ListItem Value="1">แบบสินค้าใหม่</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:Panel ID="Panel4" runat="server">
                                            แบบสินค้า
                                            <asp:DropDownList ID="DdlModel" runat="server" AppendDataBoundItems="True" 
                                                AutoPostBack="True" DataSourceID="SqlDataSourceStyle" DataTextField="StyleID" 
                                                DataValueField="StyleID" 
                                                Width="117px" Height="21px">
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
                                </tr>
                                <tr>
                                    <td class="style13">
                                        &nbsp;</td>
                                    <td class="style15">
                                        &nbsp;</td>
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
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style20">
                &nbsp;</td>
            <td class="style21">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
