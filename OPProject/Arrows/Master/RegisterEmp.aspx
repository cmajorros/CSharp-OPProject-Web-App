<%@ Page Title="" Language="C#" MasterPageFile="~/OP.Master" AutoEventWireup="true" CodeBehind="RegisterEmp.aspx.cs" Inherits="OPProject.Master.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style9
        {
            width: 100%;
        }
        .style10
        {
            width: 66px;
        }
        .style11
        {
            width: 137px;
        }
        .style14
        {
            width: 137px;
            height: 34px;
        }
        .style15
        {
            height: 34px;
        }
        .style16
        {
            width: 137px;
            height: 41px;
        }
        .style17
        {
            height: 41px;
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
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td>
                <asp:Panel ID="Panel1" runat="server" GroupingText="ลงทะเบียนเข้าใช้ระบบ" 
                    Width="656px">
                    <table class="style9">
                        <tr>
                            <td class="style11">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style14">
                                รหัสพนักงาน :</td>
                            <td class="style15">
                                <asp:TextBox ID="TxtEmpID" runat="server" Height="25px"></asp:TextBox>
                                &nbsp;&nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ErrorMessage="*" ControlToValidate="TxtEmpID" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                            <td class="style15">
                            </td>
                        </tr>
                        <tr>
                            <td class="style14">
                                รหัสผ่าน</td>
                            <td class="style15">
                                <asp:TextBox ID="TxtPass" runat="server" Height="25px"></asp:TextBox>
                                &nbsp;&nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ErrorMessage="*" ControlToValidate="TxtPass" ForeColor="Red"></asp:RequiredFieldValidator>
                                &nbsp;
                            </td>
                            <td class="style15">
                            </td>
                        </tr>
                        <tr>
                            <td class="style14">
                                ยืนยันรหัสผ่าน</td>
                            <td class="style15">
                                <asp:TextBox ID="TxtConfirmpass" runat="server" Height="25px"></asp:TextBox>
                                &nbsp;&nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ErrorMessage="*" ControlToValidate="TxtConfirmpass" ForeColor="Red"></asp:RequiredFieldValidator>
                                &nbsp;
                                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                    ControlToCompare="TxtPass" ControlToValidate="TxtConfirmpass" 
                                    ErrorMessage="CompareValidator"></asp:CompareValidator>
                            </td>
                            <td class="style15">
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style16">
                            </td>
                            <td class="style17">
                                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                                    Text="ลงทะเบียน" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="ยกเลิก" />
                            </td>
                            <td class="style17">
                            </td>
                        </tr>
                        <tr>
                            <td class="style16">
                                &nbsp;</td>
                            <td class="style17">
                                &nbsp;</td>
                            <td class="style17">
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
            <td class="style10">
                &nbsp;</td>
            <td>
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
                </asp:Panel>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
