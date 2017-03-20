$('#inputBuscarCancion').on('keypress', function (event) {
    if (event.which === 13) {
        window.location.href = 'resultados.aspx?buscar=' + $('#inputBuscarCancion').val(); 
    }
});

