<%@ Page Title="Log In" Language="C#" MasterPageFile="~/OP.master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="OPProject.Account.Login" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="Head">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <h2>
        &nbsp;&nbsp;&nbsp;&nbsp;
        Log In
    </h2>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;
        กรุณาป้อน <b>รหัสพนักงาน</b> และ <b>รหัสผ่าน</b></p>
    &nbsp; <asp:Login ID="LoginUser" runat="server" EnableViewState="false" RenderOuterTable="false">
        <LayoutTemplate>
            <span class="failureNotification">
                <asp:Literal ID="FailureText" runat="server"></asp:Literal>
            </span>
            <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="failureNotification" 
                 ValidationGroup="LoginUserValidationGroup"/>
            <div class="accountInfo">
                <fieldset class="login">
                    <legend>ลงชื่อเข้าใช้ระบบ</legend>
                    <p>
                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">รหัสพนักงาน:</asp:Label>
                        <asp:TextBox ID="UserName" runat="server" CssClass="textEntry"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" 
                             CssClass="failureNotification" ErrorMessage="กรุณาป้อนรหัสพนักงาน" ToolTip="User Name is required." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">รหัสผ่าน:</asp:Label>
                        <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" 
                             CssClass="failureNotification" ErrorMessage="รหัสผ่านไม่ถูกต้อง" ToolTip="Password is required." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        &nbsp;</p>
                </fieldset>
                <p class="submitButton">
                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" 
                        Text="เข้าสู่ระบบ" ValidationGroup="LoginUserValidationGroup" 
                        Width="82px"/>
                    &nbsp;<asp:Button ID="Button1" runat="server" Text="ยกเลิก" />
                </p>
            </div>
        </LayoutTemplate>
    </asp:Login>
</asp:Content>
