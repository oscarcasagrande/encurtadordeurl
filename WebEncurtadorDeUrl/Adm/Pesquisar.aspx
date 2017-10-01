<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="Pesquisar.aspx.cs" Inherits="WebEncurtadorDeUrl.Pesquisar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="UrlEncurtadaLabel" runat="server" Text="URL Encurtada" AssociatedControlID="UrlEncurtadaTextBox"></asp:Label>
    <asp:TextBox ID="UrlEncurtadaTextBox" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="PesquisarButton" runat="server" Text="Pesquisar" OnClick="PesquisarButton_Click" />
    <br />
    <asp:Label ID="UrlEncurtadaHyperLinkLabel" runat="server" Text="Url Encurtada"></asp:Label>
    <asp:HyperLink ID="UrlEncurtadaHyperLink" runat="server" NavigateUrl="~/Adm/Default.aspx"
        Text="x"></asp:HyperLink>
    <br />
    <asp:Label ID="UrlOriginalLabel" runat="server" Text="Url Original" AssociatedControlID="UrlOriginalTextBox"></asp:Label>
    <asp:TextBox ID="UrlOriginalTextBox" runat="server" ReadOnly="true"></asp:TextBox>
</asp:Content>
