function tplawesome(e, t) { res = e; for (var n = 0; n < t.length; n++) { res = res.replace(/\{\{(.*?)\}\}/g, function (e, r) { return t[n][r] }) } return res }

var videoid;

function BuscarVideosYoutube() {

    if (!$("#inputVideoYoutube").prop('checked'))
    {
        $("#resultado-youtube").hide();
        return;
    }


    $("#resultado-youtube").show();

    

        // prepare the request
        var request = gapi.client.youtube.search.list({
            part: "snippet",
            type: "video",
            q: $("#inputArtista").val() + $("#inputTitulo").val(),
            maxResults: 1,
            order: "relevance"
        });
        // execute the request
        request.execute(function (response) {
            var results = response.result;
            $("#resultado-youtube").html("");
            $.each(results.items, function (index, item) {
                $.get("tpl/item.html", function (data) {
                    videoid = item.id.videoId; //establezco el id de video en variable global
                    $("#resultado-youtube").append(tplawesome(data, [{ "videoid": item.id.videoId }]));
                });
            });
        });

    }



function init() {
    gapi.client.setApiKey("AIzaSyC69I3rTt7RakGHBOeg3DVq9Iqcy-uKHdc");
    gapi.client.load("youtube", "v3", function () {
        // yt api is ready
    });
}