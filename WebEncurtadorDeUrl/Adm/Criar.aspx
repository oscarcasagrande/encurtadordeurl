<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="Criar.aspx.cs" Inherits="Site.Criar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    A URL abaixo: <strong>
        <br />
        <asp:Label ID="UrlOriginalLabel" runat="server"></asp:Label></strong>
    <br />
    Tinha
    <asp:Label ID="QuantidadeCaracteresUrlOriginalLabel" runat="server"></asp:Label>
    caracteres agora tem
    <asp:Label ID="QuantidadeCaracteresUrlEncurtadaLabel" runat="server"></asp:Label>
    caracteres:
    <br />
    <br />
    <strong>
        <asp:Label ID="UrlEncurtadaLabel" runat="server"></asp:Label>
    </strong>
    <br />
    <asp:HyperLink ID="AbraEmUmaNovaJanelaHyperLink" runat="server" Target="_blank">[Abra em uma nova janela]</asp:HyperLink>
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Digite a URL a ser encurtada" AssociatedControlID="UrlOriginalTextBox"></asp:Label>
    <br />
    <asp:TextBox ID="UrlOriginalTextBox" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="EncurtarUrl" runat="server" Text="Encurtar" OnClick="EncurtarUrl_Click" />
</asp:Content>
