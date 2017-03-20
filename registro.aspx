<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="registro.aspx.cs" Inherits="registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <!-- cdn for modernizr, if you haven't included it already -->
    <script src="http://cdn.jsdelivr.net/webshim/1.12.4/extras/modernizr-custom.js"></script>
    <!-- polyfiller file to detect and load polyfills -->
    <script src="http://cdn.jsdelivr.net/webshim/1.12.4/polyfiller.js"></script>
    <script>
        webshims.setOptions('waitReady', false);
        webshims.setOptions('forms-ext', { types: 'date' });
        webshims.polyfill('forms forms-ext');
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="jumbotron">

   <div class="container left-addon inner-addon">

      <form role="form" action="javascript:submitregistro();" class="bg-info clearfix form-horizontal" style="padding-top: 15px; padding-left: 10px; padding-right: 20px; border-radius: 5px;">

         <div class="form-group">
            <label class="control-label col-sm-2" for="inputUsuario">Usuario</label>                         
            <div class="col-sm-10">
               <div class="">
                  <div class="">
                     <div class="">
                        <input type="text" class="form-control" id="inputUsuario" required>
                     </div>
                  </div>
               </div>
            </div>
         </div>

         <div class="form-group">
            <label class="control-label col-sm-2" for="inputPass1">Contraseña</label>                         
            <div class="col-sm-10">
               <div class="">
                  <div class="">
                     <div class="">
                        <input type="password" class="form-control" id="inputPass1" required>
                     </div>
                  </div>
               </div>
            </div>
         </div>

         <div class="form-group">
            <label class="control-label col-sm-2" for="inputPass2">Repetir contraseña</label>
            <div class="col-sm-10">
               <div class="">
                  <div class="">
                     <div class="">
                        <input type="password" class="form-control" id="inputPass2" required>
                     </div>
                  </div>
               </div>
            </div>
         </div>

         <div class="form-group">
            <label class="control-label  col-sm-2" for="inputFechaNacimiento">Fecha de nacimiento</label>
            <div class="col-sm-10">
               <div>
                  <div>
                     <div>
                        <input type="date" class="form-control" id="inputFechaNacimiento" required>
                     </div>
                  </div>
               </div>
            </div>
         </div>

         <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
               <div class=" ">
                  <div class="   ">
                     <div class=" ">
                        <button id="btnRegistrarUsuario" class="btn bg-primary btn-block" type="submit" data-html="false">Registrarme</button>
                     </div>
                  </div>
               </div>
            </div>
         </div>

      </form>

   </div>

</div>

</asp:Content>

