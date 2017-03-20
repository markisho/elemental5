function submitregistro() {

    //VALIDACION DE CAMPOS
    if ($('#inputPass1').val().length < 8) {
        sweetAlert("Contraseña inválida", "Las contraseña debe tener al menos 8 caracteres", "error");
        return;
    }


    if ($('#inputPass1').val() != $('#inputPass2').val()) {
        sweetAlert("Contraseña inválida", "Las contraseñas no coinciden", "error");
        return;
    }


    //LLAMADA AJAX
        $.post('HttpHandlers/RegistrarUsuario.ashx', {

            inputUsuario: $('#inputUsuario').val(),
            inputPass: $('#inputPass1').val(),
            inputFechaNacimiento: $('#inputFechaNacimiento').val()

        }, function (data) {

            if (data == "UsuarioYaExiste")

                swal({
                    title: "Registro erróneo",
                    text: "El nombre de usuario ya está en uso. Usá otro por favor.",
                    type: "error"
                })


            if(data!= "UsuarioYaExiste")

                swal({
                    title: "Registro exitoso",
                    text: "Ya podés iniciar sesión",
                    type: "success"
                }, function () {
                      window.location.href = 'inicio.aspx';
                  });



        })

}