<%@ Page Title="" Language="C#" MasterPageFile="~/OP.Master" AutoEventWireup="true" CodeBehind="ChangePasswordSuccess.aspx.cs" Inherits="OPProject.Account.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style9
        {
            width: 100%;
        }
        .style10
        {
            width: 170px;
        }
        .style11
        {
            color: #3366FF;
        }
        .style12
        {
            font-weight: bold;
        }
        .style13
        {
            width: 170px;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style9">
        <tr>
            <td class="style10" style="font-size: large; font-weight: 700">
                เปลี่ยนรหัสผ่าน</td>
            <td style="font-size: large; font-weight: 700">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr class="style11">
            <td class="style13">
                ! เปลี่ยนรหัสผ่านเรียบร้อย&nbsp;
            </td>
            <td>
                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="style12" 
                    style="text-decoration: underline">Log in</asp:HyperLink>
            </td>
        </tr>
    </table>
</asp:Content>
