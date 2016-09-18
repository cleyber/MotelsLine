$(document).ready(function(){
    $(".button-collapse").sideNav();
    $('form').submit(function(evento){
       evento.preventDefault(); 
    });
    $('.datepicker').pickadate({
        selectMonths: true,
        selectYears: 15 
    });
    $('select').material_select();
    
    var formServicios = $("#form_servicios");
    var formLogin = $("#form_login");
    var formFecha = $("#form_fecha");
    var wizardProgress = $("#wizard_progress");
    var ok = $("#ok");
    var mensaje = $("#mensaje");
    var error = $("#error");
    var resumen = $("#resumen");
    
    $("#siguiente_fecha").click(function(){
        formServicios.addClass("hide");
        formFecha.removeClass("hide");
        wizardProgress.css({
            width: "50%"
        });
    });
    
    $("#fecha_atras").click(function(){
        formServicios.removeClass("hide");
        formFecha.addClass("hide");
        wizardProgress.css({
            width: "25%"
        });
    });
    
    $("#siguiente_login").click(function(){
        formFecha.addClass("hide");
        $.jax({
            url: "ReservarServlet",
            method: "post",
            data:{                
               habitacion: JSON.stringify({
                   id: d,
               }),
               servicios: JSON.stringify({
                   id: d,
               }),
               fecha: JSON.stringify({
                   hora: $("#hora").val(),
                   minutos: $("#minutos").val(),
                   meridiano: $("#meridiando").val()
                   
               })
            },
            success: function(){
                ok.removeClass("hide");
                wizardProgress.css({
                width: "100%"
                }).addClass("green");
            },error: function(respuesta){
                error.removeClass("hide");
                wizardProgress.css({
                   width: "100%"
               }).addClass("red").removeClass("blue");
                mensaje.text(respuesta.responseText);
            }, complete: function(){
                resumen.removeClass("hide");
            }
        });
    });
    
    $("#login_atras").click(function(){
        formFecha.removeClass("hide");
        formLogin.addClass("hide");
        wizardProgress.css({
            width: "50%"
        });
    });
});

