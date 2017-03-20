<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="perfil.aspx.cs" Inherits="perfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="jumbotron">
<div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
              <img class="img-circle img-responsive img-profile" src="Imgs/perfil/profile-default.png">
              <div class="panel panel-warning">
              <div class="panel-heading">
                <h3 runat="server" id="panelUsuario" class="panel-title" style="font-size: 24px; font-weight: bold;"></h3>
              </div>
              <div class="panel-body">
                <p runat="server" id="fechaNacimiento"></p>
                <p runat="server" id="LikesObtenidos">Likes obtenidos: </p>
              </div>
            </div>
          </div>
          <div class="col-md-6 text-center" style="color:white;font-size:24px;">Publicaciones:</div>
          <div runat="server" id="publicacionesUsuario" class="col-md-6"></div>
        </div>
      </div>
    </div
</div>

</asp:Content>

