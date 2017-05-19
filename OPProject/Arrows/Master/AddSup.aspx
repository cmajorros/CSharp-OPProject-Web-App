<%@ Page Title="" Language="C#" MasterPageFile="~/OP.Master" AutoEventWireup="true" CodeBehind="AddSup.aspx.cs" Inherits="OPProject.Master.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style9
        {
            width: 118%;
        }
        .style10
        {
            width: 40px;
        }
        .style14
        {
            width: 119px;
            height: 28px;
        }
        .style15
        {
            height: 28px;
        }
        .style18
        {
            width: 119px;
            height: 35px;
        }
        .style19
        {
            height: 35px;
        }
        .style20
        {
            width: 119px;
            height: 82px;
        }
        .style21
        {
            height: 82px;
        }
        .style22
        {
            width: 119px;
            height: 36px;
        }
        .style23
        {
            height: 36px;
        }
        .style24
        {
            color: red;
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
                <asp:Panel ID="Panel1" runat="server" GroupingText="เพิ่มรายการผู้จัดจำหน่าย">
                    <table class="style9">
                        <tr>
                            <td class="style18">
                                รหัสผู้จัดจำหน่าย :</td>
                            <td class="style19">
                                <asp:TextBox ID="TxtSupID" runat="server" Enabled="False" Height="23px" 
                                    Width="200px"></asp:TextBox>
                                &nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style18">
                                ชื่อผู้จัดจำหน่าย :
                            </td>
                            <td class="style19">
                                <asp:TextBox ID="TxtSupName" runat="server" Height="24px" Width="201px"></asp:TextBox>
                                &nbsp; <span class="style24">&nbsp;*</span>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="TxtSupName" ErrorMessage="กรุณาใส่ชื่อผู้จัดจำหน่าย" 
                                    ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style18">
                                ชื่อผู้ติดต่อ :
                            </td>
                            <td class="style19">
                                <asp:TextBox ID="TxtSupContact" runat="server" Height="24px" Width="198px"></asp:TextBox>
                                &nbsp;
                                <span class="style24">&nbsp; * </span>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="TxtSupContact" ErrorMessage="กรุณาใส่ชื่อผู้ติดต่อ" 
                                    ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style20">
                                ที่อยู่ :</td>
                            <td class="style21">
                                <asp:TextBox ID="TxtSupAdd" runat="server" Height="62px" TextMode="MultiLine" 
                                    Width="199px"></asp:TextBox>
                                &nbsp;
                                <span class="style24">&nbsp; * </span>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="TxtSupAdd" ErrorMessage="กรุณาใส่ที่อยู่" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style18">
                                เบอร์โทรศัพท์ :
                            </td>
                            <td class="style19">
                                <asp:TextBox ID="TxtSupPhone" runat="server" Height="24px" Width="202px"></asp:TextBox>
                                &nbsp;&nbsp; <span class="style24">* </span>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                    ControlToValidate="TxtSupPhone" ErrorMessage="กรุณาใส่เบอร์โทรศัพท์" 
                                    ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style22">
                                เบอร์โทรสาร:</td>
                            <td class="style23">
                                <asp:TextBox ID="TxtSupFax" runat="server" Height="23px" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style18">
                                อีเมลล์ :</td>
                            <td class="style19">
                                <asp:TextBox ID="TxtSupEmail" runat="server" Height="24px" Width="199px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style14">
                                &nbsp;</td>
                            <td class="style15">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style14">
                                &nbsp;</td>
                            <td class="style15">
                                &nbsp;&nbsp;
                                <asp:Button ID="BtnSaveSup" runat="server" Text="บันทึก" 
                                    onclick="BtnSaveSup_Click" />
                                &nbsp;&nbsp;&nbsp;<asp:Button ID="BtnCanSup" runat="server" Text="ยกเลิก" />
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style14">
                            </td>
                            <td class="style15">
                            </td>
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
    </table>
</asp:Content>
