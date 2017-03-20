<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="publicacion.aspx.cs" Inherits="publicacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



<div class="jumbotron">
        <form class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section">
                            <div class="container" runat="server" id="contenedorPublicacion">
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="panel panel-success text-center">

                                            <div class="panel-heading">
                                                <h3 runat="server" id="cancion" class="panel-title text-center text-capitalize" style="font-size: 24px; font-weight: bold;"> Interpretación: </h3>
                                                <h3 runat="server" id="usuario" class="panel-title text-center" style="font-size: 24px;">por @</h3>
                                                <h3 runat="server" id="fecha" class="panel-title text-center" style="font-size: 24px;"></h3> 
                                            </div>

                                            <div class="panel-body">
                                                <p style="font-size: 18px" runat="server" id="interpretacion"></p>
                                            </div>
                                            <hr />
                                            <button type="button" id="btnMeGusta" class="btn btn-info" style="margin-bottom:20px;">
                                                <span class="glyphicon glyphicon-thumbs-up" style="padding-right: 5px;"></span>Me gusta
                                            </button>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="embed-responsive embed-responsive-16by9">
                                            <iframe runat="server" id="video" class="embed-responsive-item" allowfullscreen=""></iframe>
                                        </div>
                                     
                                    <hr />

                                    <div class="panel panel-success text-center">
                                        <div class="panel-heading">
                                            <h3 class="panel-title text-center" style="font-size: 24px;">Letra</h3>
                                        </div>
                                        <div class="panel-body">
                                            <p runat="server" id="letra" style="font-size: 12px"></p>
                                        </div>
                                    </div>

                                    </div>

                                </div>

                                 <dl class="bg-info" runat="server" id="controlComentarios" style="padding-left: 20px; padding-top:7px; border-radius: 5px; font-size: 14px;"> 
                                                                          
                                 </dl>

                             </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>

</div>

</asp:Content>

