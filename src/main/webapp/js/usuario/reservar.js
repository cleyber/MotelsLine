$(document).ready(function(){
    $(".button-collapse").sideNav();
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
    var guardar = $("#guardar_reserva");


   function showServicios(){
      formServicios.removeClass("hide");
      wizardProgress.css({
          width: "25%"
      });
   }

   function hideServicios(){
      formServicios.addClass("hide");
   }

   function showFecha(){
      formFecha.removeClass("hide");
      wizardProgress.css({
          width: "50%"
      });
   }

   function hideFecha(){
      formFecha.addClass("hide");
   }

   function showLogin(){
      if(!logged){
         formLogin.removeClass("hide");
         wizardProgress.css({
             width: "75%"
         });
      }else{
         showResumen();
      }
   }

   function hideLogin(){
      formLogin.addClass("hide");
   }

   function showResumen(){
      resumen.removeClass("hide");
      wizardProgress.css({
          width: "100%"
      });
   }

   function hideResumen(){
      resumen.addClass("hide");
   }

   function save(){
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
         }
     });
   }

   //Eventos

   $("#siguiente_fecha").click(function(){
      hideServicios();
      showFecha();
   });

   $("#fecha_atras").click(function(){
      hideFecha();
      showServicios();
   });

   $("#siguiente_login").click(function(){
      hideFecha();
      showLogin();
   });

   $("#login_atras").click(function(){
      hideLogin();
      showFecha();
   });

   $("#guardar").click(function(){
      save();
   });

   $("#resumen_atras").click(function(){
      hideResumen();
      showFecha();
   });



});
