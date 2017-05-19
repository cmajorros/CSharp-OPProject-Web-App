<%@ Page Title="Register" Language="C#" MasterPageFile="../OP.master" AutoEventWireup="true"
    CodeBehind="AddEmp.aspx.cs" Inherits="OPProject.Account.Register" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="Head">
    <style type="text/css">
        .style1
        {
            width: 246%;
        }
        .style2
        {
            width: 341px;
        }
        .style3
        {
            width: 341px;
            height: 16px;
        }
        .style4
        {
            height: 16px;
        }
        .style12
        {
            height: 32px;
            width: 162px;
        }
        .style13
        {
            width: 162px;
        }
        .style14
        {
            height: 27px;
        }
        .style15
        {
            width: 162px;
            height: 27px;
        }
        .style16
        {
            height: 32px;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <table class="style1">
        <tr>
            <td class="style16">
                </td>
            <td class="style12">
                Employee ID</td>
            <td class="style16">
                <asp:TextBox ID="TxtEmpID" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TxtEmpID" ErrorMessage="Please Insert Employee ID"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style14">
                </td>
            <td class="style15">
                Password</td>
            <td class="style14">
                <asp:TextBox ID="TxtPwd" runat="server" ontextchanged="TextBox1_TextChanged" 
                    TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TxtPwd" ErrorMessage="Please Insert Password"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style13">
                Confirm Password</td>
            <td>
                <asp:TextBox ID="TxtConPwd" runat="server" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="TxtPwd" ControlToValidate="TxtConPwd" 
                    ErrorMessage="Password Does Not Match"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style13">
                <asp:Label ID="LblStage" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
            <td>
                <asp:Button ID="BtnCreateUser" runat="server" onclick="Button1_Click" 
                    Text="Creat User" />
            </td>
        </tr>
    </table>
</asp:Content>
