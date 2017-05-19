<%@ Page Title="" Language="C#" MasterPageFile="~/OP.Master" AutoEventWireup="true" CodeBehind="Excecutive.aspx.cs" Inherits="OPProject.FirstPage.Excecutive" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style9
        {
            width: 1100px;
        }
        .style10
        {
            width: 88px;
        }
        .style11
        {
            width: 88px;
            height: 17px;
        }
        .style12
        {
            height: 17px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table cellpadding="0" cellspacing="0" class="style9">
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
                รายการการผลิตที่มีการส่งล้าช้า<br />
                <br />
                <asp:GridView ID="GridView1" runat="server">
                </asp:GridView>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style11">
            </td>
            <td class="style12">
            </td>
            <td class="style12">
            </td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td>
                รายการการผลิตที่ถึงกำหนดส่งในสัปดาห์นึ้<br />
                <br />
                <asp:GridView ID="GridView2" runat="server">
                </asp:GridView>
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
