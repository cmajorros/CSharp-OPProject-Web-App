<%@ Page Title="" Language="C#" MasterPageFile="~/OP.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="OPProject.Account.WebForm1" %>
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
            width: 122px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style9">
        <tr>
            <td class="style10" style="font-weight: 700; font-size: large">
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
                <asp:Panel ID="Panel1" runat="server" GroupingText="เปลี่ยนรหัสผ่าน">
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
                            <td class="style11">
                                รหัสผ่านเดิม:</td>
                            <td>
                                <asp:TextBox ID="TxtOldPass" runat="server" Height="24px"></asp:TextBox>
                                &nbsp;&nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="TxtOldPass" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                &nbsp;
                                <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="รหัสผ่านไม่ถูกต้อง" 
                                    Visible="False"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style11">
                                รหัสผ่านใหม่:</td>
                            <td>
                                <asp:TextBox ID="TxtNewPass" runat="server" Height="24px"></asp:TextBox>
                                &nbsp;&nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ErrorMessage="กรุณากรอกรหัสผ่านใหม่" ControlToValidate="TxtNewPass" 
                                    ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style11">
                                ยืนยันรหัสผ่านใหม่:</td>
                            <td>
                                <asp:TextBox ID="TxtConPass" runat="server" Height="24px"></asp:TextBox>
                                &nbsp;&nbsp;
                                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                    ErrorMessage="กรุณากรอกรหัสผ่านใหม่" ControlToCompare="TxtNewPass" 
                                    ControlToValidate="TxtConPass" ForeColor="Red"></asp:CompareValidator>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;</td>
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
                            <td class="style11">
                                &nbsp;</td>
                            <td>
                                <asp:Button ID="Button1" runat="server" Text="ยืนยัน" />
                                &nbsp;
                                <asp:Button ID="Button2" runat="server" Text="ยกเลิก" />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style11">
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
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
