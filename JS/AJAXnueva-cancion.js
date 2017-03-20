function submitnuevacancion() {

    //LLAMADA AJAX
    $.post('HttpHandlers/AgregarCancion.ashx', {

        inputArtista: $('#inputArtista').val(),
        inputTitulo: $('#inputTitulo').val(),
        inputLetra: $('#inputLetra').val().replace(/\n/g, "<br />"),
        inputInterpretacion: $('#inputInterpretacion').val().replace(/\n/g, "<br />"),
        inputVideoYoutube: $('#inputVideoYoutube').prop('checked'),
        IdVideo: videoid

    }, function (data) {


            swal({
                title: "Publicación exitosa",
                text: data,
                type: "success"
            }, function () {
                window.location.href = 'inicio.aspx';
            });



    })

}