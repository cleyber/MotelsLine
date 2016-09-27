$(document).ready(function(){
    $(".button-collapse").sideNav();
    $('.datepicker').pickadate({
      format: 'yyyy/mm/dd',
      min: new Date,
        selectMonths: true,
        selectYears: 15,
       monthsFull: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
      monthsShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
      weekdaysFull: ['Domingo', 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado'],
      weekdaysShort: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'vi', 'Sa'],
      today: 'Hoy',
      clear: 'Limpiar',
      close: 'Cerrar'
    });
    $('select').material_select();


    var formServicios = $("#form_servicios");
    var formLogin = $("#form_login");
    var formFecha = $("#form_fecha");
    var wizardProgress = $("#wizard_progress");
    var resumen = $("#resumen");
    var guardar = $("#guardar_reserva");

    if(logged && sessionStorage.length>0){
      showResumen();
   }else{
      showServicios();
   }


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
      initSession();
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

   function initSession(){
      sessionStorage['servicios'] = JSON.stringify($(".servicio:checked").serializeArray());
      sessionStorage.fecha = $('#fecha').val();
      sessionStorage.hora = $('#hora').val();
      sessionStorage.minutos = $('#minutos').val();
      sessionStorage.meridiano = $('#meridiano').val();
      sessionStorage.personas = $('#per_extra').val();
      sessionStorage.horasExtras = $('#hora_extra').val();
      //console.log(JSON.stringify($(".servicio:checked").serializeArray()));
   }

   //Events

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
