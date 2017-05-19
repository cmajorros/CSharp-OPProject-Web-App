<%@ Page Title="" Language="C#" MasterPageFile="~/OP.Master" AutoEventWireup="true" CodeBehind="EditSup.aspx.cs" Inherits="OPProject.Master.EditEmp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style9
        {
            width: 100%;
        }
        .style10
        {
            width: 63px;
        }
        .style11
        {
            font-size: large;
            font-weight: bold;
            height: 36px;
        }
        .style15
        {
            font-size: medium;
            font-weight: normal;
        }
        .style19
        {
            width: 63px;
            height: 36px;
        }
        .style20
        {
            height: 36px;
        }
        .style26
        {
            width: 174px;
        }
        .style27
        {
            width: 275px;
        }
        .style28
        {
            font-size: small;
        }
        .style29
        {
            font-size: large;
            font-weight: bold;
        }
        .style41
        {
            font-size: large;
            font-weight: bold;
            color: #3333CC;
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
            <td class="style19">
            </td>
            <td class="style11">
                <asp:Panel ID="PanelSearch" runat="server">
                    ค้นหาข้อมูลผู้จัดจำหน่าย<br />
                    <br />
                    <table class="style9">
                        <tr>
                            <td class="style26" nowrap="nowrap">
                                <span class="style15">รหัสผู้จัดจำหน่าย หรือ
                                <br />
                                ชื่อผู้จัดจำหน่าย :</span>&nbsp;</td>
                            <td class="style27">
                                <asp:TextBox ID="TxtIDName" runat="server" Height="27px" Width="204px"></asp:TextBox>
                                &nbsp;
                                <asp:ImageButton ID="ImageButton1" runat="server" 
                                    ImageUrl="~/Very_Basic/search.png" onclick="ImageButton1_Click" />
                            </td>
                            <td>
                                <asp:Button ID="BtnFindAll" runat="server" Height="30px" 
                                    onclick="BtnFindAll_Click" Text="ค้นหารายการผู้จัดจำหน่ายทั้งหมด" 
                                    Width="199px" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td class="style20">
            </td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td>
                <asp:Panel ID="PanelUpdateResult" runat="server" Visible="False">
                    <span class="style41">ปรับปรุงข้อมูลผู้จัดจำหน่ายเรียบร้อยแล้ว คลิ้ก ที่นี่ 
                    เพื่อกลับไปหน้าหลัก</span></asp:Panel>
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
                <asp:Panel ID="PanelSearchResult" runat="server" Visible="False">
                    <span class="style29">ผลการค้นหา<br /> </span><span class="style28"><br /> 
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                        DataKeyNames="SupID" ForeColor="#333333" GridLines="None" 
                        onselectedindexchanged="GridView1_SelectedIndexChanged" 
                        style="text-align: left" Width="775px">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Bold="true" 
                                SelectText="เลือก" ShowSelectButton="True" ItemStyle-Width="30px"/>
                            <asp:BoundField DataField="SupID" HeaderStyle-HorizontalAlign="Center" 
                                HeaderStyle-Width="150px" HeaderText="รหัสผู้จัดจำหน่าย" 
                                ItemStyle-HorizontalAlign="Center" />
                            <asp:BoundField DataField="SupName" HeaderStyle-HorizontalAlign="Center" 
                                HeaderText="ชื่อผู้จัดจำหน่าย" ItemStyle-Width="300px" />
                            <asp:BoundField DataField="SupAdd" HeaderStyle-HorizontalAlign="Center" 
                                HeaderText="ที่อยู่" />
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
                    </span>
                </asp:Panel>
                <br />
                <br />
                <asp:Panel ID="PanelDetail" runat="server" Visible="False">
                    <span class="style29">รายละเอียดผู้จัดจำหน่าย</span><br />
                    <br />
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                        BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
                        CellPadding="3" DataSourceID="SqlDataSource1" GridLines="Horizontal" 
                        Height="50px" onitemupdated="DetailsView1_ItemUpdated" Width="520px" 
                        onpageindexchanging="DetailsView1_PageIndexChanging">
                        <AlternatingRowStyle BackColor="#F7F7F7" />
                        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <Fields>
                            <asp:BoundField DataField="SupID" HeaderText="รหัสผู้จัดจำหน่าย" 
                                SortExpression="SupID" ReadOnly="True" />
                            <asp:BoundField DataField="SupName" HeaderText="ชื่อผู้จัดจำหน่าย" 
                                SortExpression="SupName" />
                            <asp:BoundField DataField="SupContact" HeaderText="ชื่อผู้ติดต่อ" 
                                SortExpression="SupContact" />
                            <asp:BoundField DataField="SupAdd" HeaderText="ที่อยู่" 
                                SortExpression="SupAdd" />
                            <asp:BoundField DataField="SupTel" HeaderText="โทรศัพท์" 
                                SortExpression="SupTel" />
                            <asp:BoundField DataField="SupFax" HeaderText="โทรสาร" 
                                SortExpression="SupFax" />
                            <asp:BoundField DataField="SupEmail" HeaderText="อีเมลล์" 
                                SortExpression="SupEmail" />
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="btnUpdate" runat="server" CausesValidation="True" 
                                        CommandName="Update" onclick="LinkButton1_Click" Text="Update"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                        CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                        CommandName="Edit" Text="Edit"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Fields>
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:OPGarment %>" 
                        InsertCommand="INSERT INTO [Suppliers] ([SupID], [SupName], [SupContact], [SupAdd], [SupTel], [SupFax], [SupEmail]) VALUES (@SupID, @SupName, @SupContact, @SupAdd, @SupTel, @SupFax, @SupEmail)" 
                        onselecting="SqlDataSource1_Selecting" 
                        SelectCommand="SELECT [SupID], [SupName], [SupContact], [SupAdd], [SupTel], [SupFax], [SupEmail] FROM [Suppliers] WHERE ([SupID] = @SupID)" 
                        UpdateCommand="UPDATE Suppliers SET SupName = @SupName, SupContact = @SupContact, SupAdd = @SupAdd, SupTel = @SupTel, SupFax = @SupFax, SupEmail = @SupEmail Where SupID = @SupID">
                        <InsertParameters>
                            <asp:Parameter Name="SupID" Type="Int32" />
                            <asp:Parameter Name="SupName" Type="String" />
                            <asp:Parameter Name="SupContact" Type="String" />
                            <asp:Parameter Name="SupAdd" Type="String" />
                            <asp:Parameter Name="SupTel" Type="String" />
                            <asp:Parameter Name="SupFax" Type="String" />
                            <asp:Parameter Name="SupEmail" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="SupID" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="SupName" />
                            <asp:Parameter Name="SupContact" />
                            <asp:Parameter Name="SupAdd" />
                            <asp:Parameter Name="SupTel" />
                            <asp:Parameter Name="SupFax" />
                            <asp:Parameter Name="SupEmail" />
                            <asp:Parameter Name="SupID" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
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
