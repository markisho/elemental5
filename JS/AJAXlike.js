$('#btnMeGusta').click(function (e) {

    $("#btnMeGusta").prop("disabled", true);

    //LLAMADA AJAX
    $.post('HttpHandlers/LikearPublicacion.ashx', {

        idpost: $.urlParam('id')

    }, function (data) {


    })
});

$(document).ready(function () {  

    if (document.cookie == "") {
        $("#btnMeGusta").prop("disabled", true);
        return;
    }

        //LLAMADA AJAX
        $.post('HttpHandlers/DenegarLike.ashx', {

            idpost: $.urlParam('id')

        }, function (data) {
            if (data == "existe")
                $("#btnMeGusta").prop("disabled", true);

            if (data == "noexiste")
                $("#btnMeGusta").prop("disabled", false);

    })
});