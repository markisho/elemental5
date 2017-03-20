<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="inicio.aspx.cs" Inherits="inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
<div class="jumbotron">

   <div class="container left-addon inner-addon">
      <i class="glyphicon glyphicon-search"></i>
      <input type="text" id="inputBuscarCancion" class="form-control input-lg" placeholder="Buscar canción..." />
      <hr />
      <p class="cuerpo-suelto desplegador">Elemental5 es el primer foro en unificar las ideas de
          todos en una sola gran idea! Conectate.
         <br />
         <br />
      <button type="button" class="btn btn-default">Aprender más +</button>
      </p>
      <div class="desplegable text-center"><img src="Imgs/EnConstruccion.png" width="100"></div>
      <hr />
   </div>

   <div class="container" runat="server" id="ultimasPublicaciones">
      <p class="ultimos-publicaciones-titulo">Últimas publicaciones:</p> 

   </div>

</div>

</asp:Content>

