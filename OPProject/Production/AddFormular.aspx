<%@ Page Title="" Language="C#" MasterPageFile="~/OP.Master" AutoEventWireup="true" CodeBehind="AddFormular.aspx.cs" Inherits="OPProject.Production.Formular" %>
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
        .style11
        {
            width: 136px;
            height: 21px;
        }
        .style12
        {
            height: 21px;
        }
        .style13
        {
            width: 251px;
        }
        .style14
        {
            width: 275px;
        }
        .style16
        {
            width: 255px;
        }
        .style17
        {
            width: 100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style9">
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td>
                <asp:Label ID="Label3" runat="server" style="font-size: large" 
                    Text="สูตรการผลิต"></asp:Label>
            </td>
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
                        onselectedindexchanged="GridView1_SelectedIndexChanged" 
                        DataKeyNames="JobID">
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
            <td class="style11">
                </td>
            <td class="style12">
                </td>
            <td class="style12">
                </td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="JobItemID" 
                    onselectedindexchanged="GridView2_SelectedIndexChanged">
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
                <asp:Panel ID="Panel2" runat="server">
                    <asp:DetailsView ID="DetailsView1" runat="server" 
    DataSourceID="SqlDataSource1" Height="69px" Width="459px" AutoGenerateRows="False" 
                        DataKeyNames="JobID">
                        <Fields>
                            <asp:BoundField DataField="JobID" HeaderText="เลขที่คำสั่งผลิต" ReadOnly="True" 
                                SortExpression="JobID" />
                            <asp:BoundField DataField="JobStatus" HeaderText="สถานะใบสั่งผลิต" 
                                SortExpression="JobStatus" />
                            <asp:BoundField DataField="CusName" HeaderText="ชื่อลูกค้า" 
                                SortExpression="CusName" />
                            <asp:BoundField DataField="DeliveryDate" DataFormatString="{0:d}" 
                                HeaderText="วันกำหนดส่งสินค้า" SortExpression="DeliveryDate" />
                            <asp:BoundField DataField="OrderDate" DataFormatString="{0:d}" 
                                HeaderText="วันที่รับคำสั่งผิต" SortExpression="OrderDate" />
                            <asp:BoundField DataField="StyleID" HeaderText="รหัสแบบสินค้า" 
                                SortExpression="StyleID" />
                            <asp:TemplateField HeaderText="แบบสินค้า">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" Height="172px" Width="263px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="รายละเอียดคำสั่งผลิตย่อย">
                                <ItemTemplate>
                                    <asp:GridView ID="GridViewJobOrderItem" runat="server" 
                                        AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:BoundField DataField="JobItemID" HeaderText="รหัสคำสั่งผลิตย่อย" />
                                            <asp:BoundField DataField="JobItemStatus" HeaderText="สถานะการผลิต" />
                                            <asp:BoundField DataField="JobItemName" HeaderText="สินค้า" />
                                            <asp:BoundField DataField="JobItemDes" HeaderText="รายละเอียดสินค้า" />
                                            <asp:BoundField DataField="SizeName" HeaderText="ขนาด" />
                                        </Columns>
                                    </asp:GridView>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="รายละเอียดวัตถุดิบ">
                                <ItemTemplate>
                                    <asp:GridView ID="GridViewMat" runat="server" AutoGenerateColumns="False" 
                                        DataKeyNames="JobItemMatID" DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:BoundField DataField="JobItemMatID" HeaderText="JobItemMatID" 
                                                InsertVisible="False" ReadOnly="True" SortExpression="JobItemMatID" 
                                                Visible="False" />
                                            <asp:BoundField DataField="RawID" HeaderText="RawID" SortExpression="RawID" />
                                            <asp:BoundField DataField="RawName" HeaderText="RawName" 
                                                SortExpression="RawName" />
                                            <asp:BoundField DataField="JobItemMatQty" HeaderText="JobItemMatQty" 
                                                SortExpression="JobItemMatQty" />
                                            <asp:BoundField DataField="RawUnitName" HeaderText="RawUnitName" 
                                                SortExpression="RawUnitName" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:OPGarment %>" 
                                        DeleteCommand="DELETE FROM JobItemMaterials WHERE (JobItemMatID = @JobItemMatID)" 
                                        SelectCommand="SELECT JobItemMatID,JobItemMaterials.RawID, RawMaterials.RawName, JobItemMaterials.JobItemMatQty, JobItemMaterials.RawUnitName FROM JobItemMaterials INNER JOIN RawMaterials ON JobItemMaterials.RawID COLLATE SQL_Latin1_General_CP1_CI_AS = RawMaterials.RawID WHERE (JobItemMaterials.JobItemID = @JobItemID)" 
                                        UpdateCommand="UPDATE JobItemMaterials SET RawID = @RawID, JobItemMatQty = @JobItemMatQty, RawUnitName = @RawUnitName WHERE (JobItemMatID = @JobItemMatID)">
                                        <DeleteParameters>
                                            <asp:Parameter Name="JobItemMatID" />
                                        </DeleteParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="GridView2" Name="JobItemID" 
                                                PropertyName="SelectedValue" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="RawID" />
                                            <asp:Parameter Name="JobItemMatQty" />
                                            <asp:Parameter Name="RawUnitName" />
                                            <asp:Parameter Name="JobItemMatID" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Fields>
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:OPGarment %>" 
                        SelectCommand="SELECT [JobID], [JobStatus], [CusName], [DeliveryDate], [OrderDate], [StyleID] FROM [JobOrders] WHERE ([JobID] = @JobID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="JobID" 
                                PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    รายละเอียดวัตถุดิบ<br />
                    <table>
                        <tr>
                            <td class="style17">
                                ประเภทวัตถุดิบ</td>
                            <td class="style16">
                                <asp:DropDownList ID="ddlRawType" runat="server" 
                                    DataSourceID="SqlDataSource2" DataTextField="RawMatTypeName" 
                                    DataValueField="RawMatTypeID" AutoPostBack="True">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:OPGarment %>" 
                                    SelectCommand="SELECT [RawMatTypeID], [RawMatTypeName] FROM [RawMatTypes]">
                                </asp:SqlDataSource>
                            </td>
                            <td class="style14">
                                &nbsp;</td>
                            <td class="style13">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style17">
                                วัตถุดิบ</td>
                            <td class="style16">
                                <asp:DropDownList ID="ddlRaw" runat="server" 
                                    DataSourceID="SqlDataSource3" DataTextField="RawName" 
                                    DataValueField="RawID" AutoPostBack="True">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:OPGarment %>" 
                                    onselecting="SqlDataSource3_Selecting" 
                                    SelectCommand="SELECT [RawID], [RawName] FROM [RawMaterials] WHERE ([RawMatTypeID] = @RawMatTypeID)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlRawType" Name="RawMatTypeID" 
                                            PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td class="style14">
                                &nbsp;</td>
                            <td class="style13">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style17">
                                จำนวนที่ใช้</td>
                            <td class="style16">
                                <asp:TextBox ID="txtQty" runat="server"></asp:TextBox>
                                &nbsp;หน่วย&nbsp;
                                <asp:DropDownList ID="ddlUnit" runat="server" 
                                    DataSourceID="SqlDataSource4" DataTextField="RawUnitName" 
                                    DataValueField="RawUnitID" AutoPostBack="True">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:OPGarment %>" 
                                    SelectCommand="SELECT RawTypeUnits.RawUnitID, RawUnits.RawUnitName FROM RawTypeUnits INNER JOIN RawUnits ON RawTypeUnits.RawUnitID = RawUnits.RawUnitID INNER JOIN RawMatTypes ON RawTypeUnits.RawMatTypeID = RawMatTypes.RawMatTypeID WHERE (RawTypeUnits.RawMatTypeID = @RawMatTypeID)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlRawType" Name="RawMatTypeID" 
                                            PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td class="style14">
                                &nbsp;</td>
                            <td class="style13">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style17">
                                &nbsp;</td>
                            <td class="style16">
                                <asp:Button ID="BtnAdd" runat="server" Text="เพิ่มรายการ" Width="78px" 
                                    onclick="BtnAdd_Click" />
                                &nbsp;
                                <asp:Button ID="BtnCancel1" runat="server" Text="ยกเลิก" />
                            </td>
                            <td class="style14">
                                &nbsp;</td>
                            <td class="style13">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style17">
                                &nbsp;</td>
                            <td class="style16">
                                <asp:GridView ID="GridView3" runat="server" 
                                    onrowdeleting="GridView3_RowDeleting" Width="425px">
                                    <Columns>
                                        <asp:CommandField ShowDeleteButton="True" />
                                    </Columns>
                                </asp:GridView>
                            </td>
                            <td class="style14">
                                &nbsp;</td>
                            <td class="style13">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style17">
                                &nbsp;</td>
                            <td class="style16">
                                &nbsp;</td>
                            <td class="style14">
                                &nbsp;</td>
                            <td class="style13">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style17">
                                &nbsp;</td>
                            <td class="style16">
                                <asp:Button ID="BtnSave" runat="server" onclick="BtnSave_Click" Text="บันทึก" />
                                &nbsp;
                                <asp:Button ID="BtnCancel2" runat="server" Text="ยกเลิก" />
                            </td>
                            <td class="style14">
                                &nbsp;</td>
                            <td class="style13">
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
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
