<%@ Page Title="" Language="C#" MasterPageFile="~/OP.Master" AutoEventWireup="true" CodeBehind="EditFormular.aspx.cs" Inherits="OPProject.Production.EditFormular" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style9
        {
            width: 1100px;
        }
        .style10
        {
            width: 144px;
        }
        .style11
        {
            width: 565px;
        }
        .style18
        {
            width: 144px;
            height: 375px;
        }
        .style19
        {
            width: 565px;
            height: 375px;
        }
        .style20
        {
            height: 375px;
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
            <td class="style11">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td class="style11">
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
            <td class="style11">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
            </td>
            <td class="style19">
                <asp:Panel ID="Panel2" runat="server">
                    <br />
                    <br />
                    คำสั่งผลิตย่อยที่
                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                    <br />
                    <br />
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
                            <asp:TemplateField HeaderText="วัตถุดิบที่ใช้">
                                <ItemTemplate>
                                    <asp:GridView ID="GridViewMat" runat="server" AutoGenerateColumns="False" 
                                        DataKeyNames="JobItemMatID" DataSourceID="SqlDataSource1" 
                                        onrowdatabound="GridViewMat_RowDataBound">
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
                                            <asp:CommandField ShowEditButton="True" />
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                                        CommandName="Delete" Text="Delete"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
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
                    <br />
                </asp:Panel>
            </td>
            <td class="style20">
            </td>
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
