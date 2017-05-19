<%@ Page Title="" Language="C#" MasterPageFile="~/OP.Master" AutoEventWireup="true" CodeBehind="HRDefault.aspx.cs" Inherits="OPProject.Master.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style9
        {
            width: 100%;
        }
        .style11
        {
            width: 148px;
            font-weight: 700;
            font-size: large;
            text-align: center;
        }
        .style14
        {
            width: 48px;
        }
        .style15
        {
            width: 152px;
            font-weight: 700;
            font-size: large;
        }
        .style16
        {
            width: 141px;
            font-weight: 700;
            font-size: large;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table cellpadding="0" cellspacing="0" class="style9">
        <tr>
            <td class="style14">
                &nbsp;</td>
            <td class="style11">
                &nbsp;</td>
            <td class="style16">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style14">
                &nbsp;</td>
            <td class="style11">
                <asp:ImageButton ID="ImageButton1" runat="server" 
                    ImageUrl="~/Very_Basic/add user.png" onclick="ImageButton1_Click" 
                    style="margin-left: 0px" />
            </td>
            <td>
                &nbsp;
                <asp:ImageButton ID="ImageButton2" runat="server" 
                    ImageUrl="~/Very_Basic/edit user.png" />
            </td>
            <td class="style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style14">
                &nbsp;</td>
            <td class="style11">
                เพิ่มพนักงานใหม่</td>
            <td style="font-weight: 700; font-size: large">
                ปรับปรุงข้อมูลพนักงาน</td>
            <td class="style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style14">
                &nbsp;</td>
            <td class="style11">
                &nbsp;</td>
            <td class="style16">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style14">
                &nbsp;</td>
            <td class="style11">
                &nbsp;</td>
            <td class="style16">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
