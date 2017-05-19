<%@ Page Title="" Language="C#" MasterPageFile="~/OP.Master" AutoEventWireup="true" CodeBehind="AddRaw.aspx.cs" Inherits="OPProject.Master.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style9
        {
            width: 126%;
        }
        .style10
        {
            width: 56px;
        }
        .style11
        {
            width: 112px;
        }
        .style14
        {
            width: 112px;
            height: 28px;
        }
        .style18
    {
        width: 112px;
        height: 38px;
    }
    .style19
    {
        height: 38px;
        width: 448px;
    }
    .style23
    {
        height: 28px;
        width: 448px;
    }
    .style24
    {
        width: 448px;
    }
    .style25
    {
        width: 112px;
        height: 43px;
    }
    .style26
    {
        height: 43px;
        width: 448px;
    }
    .style27
    {
        width: 112px;
        height: 26px;
    }
    .style28
    {
        height: 26px;
        width: 448px;
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
                <asp:Panel ID="Panel1" runat="server" GroupingText="เพิ่มรายการวัตถุดิบ" 
                    Width="940px">
                    <table class="style9">
                        <tr>
                            <td class="style18">
                                รหัสวัตถุดิบ :</td>
                            <td class="style19">
                                <asp:TextBox ID="TextBox1" runat="server" Enabled="False" Height="30px" 
                                    Width="188px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style14">
                                ชื่อวัตถุดิบ :</td>
                            <td class="style23">
                                <asp:TextBox ID="TxtRawName" runat="server" Width="189px" Height="31px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ErrorMessage="กรุณาใส่ชื่อวัตถุดิบ" ForeColor="Red" 
                                    ControlToValidate="TxtRawName">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style27">
                                ชนิด :</td>
                            <td class="style28">
                                <asp:DropDownList ID="DrdType" runat="server" DataSourceID="SqlDataSource2" 
                                    DataTextField="RawTypeName" DataValueField="RawTypeID" Height="32px" 
                                    Width="187px" AutoPostBack="True">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:OPGarment %>" 
                                    SelectCommand="SELECT [RawTypeID], [RawTypeName] FROM [RawMatTypes]"></asp:SqlDataSource>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="DrdType" ErrorMessage="กรุณาเลือก" ForeColor="Red">*</asp:RequiredFieldValidator>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style25">
                                หน่วยนับ</td>
                            <td class="style26">
                                <asp:DropDownList ID="DrdUnit" runat="server" Height="32px" Width="128px" 
                                    DataSourceID="SqlDataSource1" DataTextField="RawUnitName" 
                                    DataValueField="RawUnitID">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:OPGarment %>" 
                                    SelectCommand="SELECT RawTypeUnits.RawTypeUnitID, RawTypeUnits.RawTypeID, RawTypeUnits.RawUnitID, RawUnit.RawUnitName FROM RawTypeUnits INNER JOIN RawUnit ON RawTypeUnits.RawUnitID = RawUnit.RawUnitID where RawTypeID = @RawTypeID">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DrdType" Name="RawTypeID" 
                                            PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="DrdUnit" ErrorMessage="กรุณาเลือก" ForeColor="Red">*</asp:RequiredFieldValidator>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td class="style14">
                                &nbsp;</td>
                            <td class="style23">
                            </td>
                        </tr>
                        <tr>
                            <td class="style14">
                            </td>
                            <td class="style23">
                                <asp:Button ID="BtnAddRaw" runat="server" onclick="Button1_Click" 
                                    Text="บันทึก" />
                                &nbsp;
                                <asp:Button ID="BtnCancelRaw" runat="server" onclick="Button2_Click" 
                                    Text="ยกเลิก" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                &nbsp;</td>
                            <td class="style24">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style11">
                                &nbsp;</td>
                            <td class="style24">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style11">
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
