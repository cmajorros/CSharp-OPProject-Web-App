<%@ Page Title="" Language="C#" MasterPageFile="~/OP.Master" AutoEventWireup="true" CodeBehind="AddEmp.aspx.cs" Inherits="OPProject.Master.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style9
        {
            width: 138%;
        }
        .style10
        {
            width: 79px;
        }
        .style11
        {
            font-size: small;
        }
        .style24
        {
            width: 179px;
            font-size: small;
            height: 29px;
        }
        .style29
        {
            width: 179px;
            font-size: small;
            height: 85px;
        }
        .style30
        {
            width: 298px;
        }
        .style35
        {
            width: 377px;
            height: 85px;
        }
        .style39
        {
            width: 179px;
            font-size: small;
            height: 20px;
        }
        .style40
        {
            height: 20px;
            width: 377px;
        }
        .style45
        {
            height: 29px;
            width: 377px;
        }
        .style46
        {
            width: 377px;
        }
        .style47
        {
            font-size: small;
            height: 28px;
        }
        .style48
        {
            width: 377px;
            height: 28px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style9">
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td class="style11" colspan="3">
                <asp:Panel ID="Panel1" runat="server" GroupingText="รายละเอียดพนักงาน" 
                    Width="849px">
                    <br />
                    <table class="style9">
                        <tr>
                            <td class="style39">
                                ตำแหน่ง :</td>
                            <td class="style40">
                                <asp:DropDownList ID="DdlRole" runat="server" DataSourceID="SqlDataSource1" DataTextField="EmpRoleName" DataValueField="EmpRoleID" Width="214px" 
                                    Height="28px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:OPGarment %>" 
                                    SelectCommand="SELECT [EmpRoleID], [EmpRoleName] FROM [EmpDepts]">
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td class="style24">
                                รหัสพนักงาน :</td>
                            <td class="style45">
                                <asp:TextBox ID="TxtEmpID" runat="server" Width="213px" Enabled="False" 
                                    Height="21px"></asp:TextBox>
                                &nbsp; ให้ออโต้เจน เลือกตำแหน่งแล้วมีรหัสตำแหน่งก่อนแล้วตามด้วยเลข</td>
                        </tr>
                        <tr>
                            <td class="style24">
                                ชื่อ - สกุล พนักงาน :</td>
                            <td class="style45">
                                <asp:TextBox ID="TxtName" runat="server" Width="211px" Height="22px"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ErrorMessage="กรุณาใส่ ชื่อ - สกุล" ForeColor="Red" 
                                    ControlToValidate="TxtName"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style24">
                                เลขประจำตัวบัตรประชาชน :</td>
                            <td class="style45">
                                <asp:TextBox ID="TxtID" runat="server" Width="211px" Height="21px"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ErrorMessage="กรุณาใส่เลขบัตรประชาชน" ForeColor="Red" 
                                    ControlToValidate="TxtID"></asp:RequiredFieldValidator>
                                &nbsp;
                                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                    ControlToValidate="TxtID" ErrorMessage="รูปแบบไม่ถูกต้อง" ForeColor="Red" 
                                    Operator="DataTypeCheck" Type="Integer">*</asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style29">
                                ที่อยู่ :</td>
                            <td class="style35">
                                <asp:TextBox ID="TxtAddress" runat="server" Height="66px" Width="208px" 
                                    TextMode="MultiLine"></asp:TextBox>
                                &nbsp;&nbsp;&nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                    ErrorMessage="กรุณาใส่ที่อยู่" ForeColor="Red" 
                                    ControlToValidate="TxtAddress"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                เบอร์โทรติดต่อ :
                            </td>
                            <td class="style46">
                                <asp:TextBox ID="TxtPhone" runat="server" Width="213px" Height="21px"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                    ErrorMessage="กรูณาใส่เบอร์โทรศัพท์" ForeColor="Red" 
                                    ControlToValidate="TxtPhone"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style47">
                                รหัสผ่านเข้าใช้ระบบ :</td>
                            <td class="style48">
                                &nbsp; ให้ระบบgenเป็นรหัสบัตรประชาชน</td>
                        </tr>
                        <tr>
                            <td class="style11">
                                &nbsp;</td>
                            <td class="style46">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style11">
                                &nbsp;</td>
                            <td class="style46">
                                &nbsp;<asp:Button ID="Button4" runat="server" Text="บันทึก" 
                                    onclick="Button4_Click1" />
                                &nbsp;&nbsp;
                                <asp:Button ID="Button5" runat="server" Text="ยกเลิก" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td class="style46">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td class="style46">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td class="style46">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td class="style46">
                                &nbsp;</td>
                        </tr>
                    </table>
                    <br />
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td class="style11">
                &nbsp;</td>
            <td class="style30">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
