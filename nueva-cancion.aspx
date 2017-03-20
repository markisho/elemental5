<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="nueva-cancion.aspx.cs" Inherits="nueva_cancion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="JS/youtube-app-busqueda.js"></script>
    <script src="https://apis.google.com/js/client.js?onload=init"></script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div class="section" style="margin-top:20px;">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="panel panel-primary">
              <div class="panel-heading">
                <h3 class="panel-title">Nueva canción</h3>
              </div>
              <div class="panel-body">

                <form role="form" action="javascript:submitnuevacancion();">

                  <div class="form-group">
                    <label class="control-label" for="inputArtista">Artista</label>
                    <input type="text" class="form-control text-capitalize" id="inputArtista" onblur="BuscarVideosYoutube();" placeholder="Ej.: Luis Miguel" required/>
                  </div>

                  <div class="form-group">
                    <label class="control-label" for="inputTitulo">Canción</label>
                    <input type="text" class="form-control text-capitalize" id="inputTitulo" onblur="BuscarVideosYoutube();" placeholder="Ej.: La Incondicional" required/>
                  </div>


                  <div class="form-group" draggable="true">
                    <label class="control-label" for="inputLetra">Letra</label>
                    <textarea class="form-control" id="inputLetra" rows="15" ></textarea>
                  </div>

                  <div class="form-group" draggable="true">
                    <label class="control-label" for="inputInterpretacion">Interpretación</label>
                    <textarea class="form-control" id="inputInterpretacion" rows="5" required ></textarea>
                  </div>

                  <div class="form-group">
                    <input type="checkbox" id="inputVideoYoutube" onchange="BuscarVideosYoutube();" /> 
                    <label class="control-label" for="inputVideoYoutube">Video de Youtube</label>
                    <div id="resultado-youtube" class="text-center"></div>
                  </div>

                  <button type="submit" class="btn btn-block btn-info btn-lg">¡Agregar!</button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

</asp:Content>

