<%@ Page Title="" Language="C#" MasterPageFile="~/OP.Master" AutoEventWireup="true" CodeBehind="AddCus.aspx.cs" Inherits="OPProject.Master.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style9
        {
            width: 111%;
        }
        .style10
        {
            width: 78px;
        }
        .style12
        {
            width: 124px;
            height: 29px;
        }
        .style19
        {
            width: 124px;
            height: 31px;
        }
        .style23
        {
            height: 31px;
            width: 509px;
        }
        .style24
        {
            height: 29px;
            width: 509px;
        }
        .style30
        {
            width: 124px;
            height: 28px;
        }
        .style31
        {
            width: 124px;
        }
        .style32
        {
            color: red;
        }
        .style33
        {
            height: 28px;
            width: 509px;
        }
        .style34
        {
            width: 509px;
        }
        .style35
        {
            font-size: small;
            margin-top: 5px;
        }
        .style36
        {
            width: 124px;
            height: 51px;
        }
        .style37
        {
            width: 509px;
            height: 51px;
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
                <asp:Panel ID="Panel1" runat="server" GroupingText="เพิ่มรายการลูกค้า">
                    <table class="style9">
                        <tr>
                            <td class="style19">
                                รหัสลูกค้า :</td>
                            <td class="style23">
                                <asp:Label ID="lblID" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style12">
                                ชื่อลูกค้า :</td>
                            <td class="style24">
                                <asp:TextBox ID="TxtCusName" runat="server" Height="21px" Width="220px"></asp:TextBox>
                                &nbsp;&nbsp; <span class="style32">*</span>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ErrorMessage="กรุณาใส่ชื่อลูกค้า" ForeColor="Red" 
                                    ControlToValidate="TxtCusName"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style19">
                                ที่อยู่ :</td>
                            <td class="style23">
                                <asp:TextBox ID="TxtCusAdd" runat="server" Height="66px" TextMode="MultiLine" 
                                    Width="217px" style="margin-top: 7px"></asp:TextBox>
                                &nbsp;&nbsp;<span class="style32"> *</span>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ErrorMessage="กรุณาใส่ที่อยู่" ForeColor="Red" 
                                    ControlToValidate="TxtCusAdd"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style30">
                                โทรศัพท์ :</td>
                            <td class="style33">
                                <asp:TextBox ID="TxtCusTel" runat="server" Height="23px" Width="220px"></asp:TextBox>
                                &nbsp;&nbsp; <span class="style32">*</span>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ErrorMessage="กรุณาใส่เบอร์โทรศัพท์" ForeColor="Red" 
                                    ControlToValidate="TxtCusTel"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style30">
                                อีเมลล์ :</td>
                            <td class="style33">
                                <asp:TextBox ID="TxtCusEmail" runat="server" Height="21px" Width="221px"></asp:TextBox>
                                &nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style31">
                                &nbsp;</td>
                            <td class="style34">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style36">
                                </td>
                            <td class="style37">
                                &nbsp;<asp:Button ID="BtnSaveCus" runat="server" Text="บันทึก" CssClass="style35" 
                                    Height="25px" onclick="BtnSaveCus_Click" Width="48px" />
                                &nbsp;&nbsp;
                                <asp:Button ID="BtnCanCus" runat="server" Text="ยกเลิก" CssClass="style35" 
                                    Height="25px" />
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
    </table>
</asp:Content>
