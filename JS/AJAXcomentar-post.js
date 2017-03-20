$('#btnComentar').click(function (e) {

        //LLAMADA AJAX
        $.post('HttpHandlers/ComentarPublicacion.ashx', {

            inputComentario: $('#inputComentario').val(),
            idpost: $.urlParam('id')

        }, function (data) {

                window.location.href = 'publicacion.aspx?id=' + $.urlParam('id');

        })
});
