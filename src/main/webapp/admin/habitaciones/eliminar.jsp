<%--
    Document   : eliminar
    Created on : 03-jul-2016, 20:22:57
    Author     : Anderson Velez
--%>
<%@page import="util.Routes"%>
<%@page import="models.Usuario"%>
<%@page import="models.dao.DaoHabitaciones"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Habitaciones"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

   if(session.getAttribute("usuario") == null) {
      response.sendRedirect(Routes.getUrl("login.jsp"));
   } else {
      Usuario usuario = (Usuario) session.getAttribute("usuario");
      if(!usuario.getRol().equals(Usuario.ADMINISTRADOR)) {
        response.sendRedirect(Routes.getUrl(""));
      }
   }


    ArrayList<Habitaciones> list = new ArrayList();
    DaoHabitaciones dao = new DaoHabitaciones();

    list = dao.consultarAll();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="<%=Routes.getUrl("css/materialize.min.css")%>" rel="stylesheet" type="text/css"/>
        <link href="<%=Routes.getUrl("css/style.css")%>" rel="stylesheet" type="text/css"/>
        <link href="<%=Routes.getUrl("css/font-awesome.min.css")%>" rel="stylesheet" type="text/css"/>
        <script src="<%=Routes.getUrl("js/jquery-3.0.0.min.js")%>" type="text/javascript"></script>
        <script src="<%=Routes.getUrl("js/materialize.min.js")%>" type="text/javascript"></script>
        <script src="<%=Routes.getUrl("js/sweetalert.min.js")%>" type="text/javascript"></script>
        <link href="<%=Routes.getUrl("css/sweetalert.css")%>" rel="stylesheet" type="text/css"/>
        <title>Eliminar Habitacion</title>
        <style>
            h1 {
            font-family: fantasy;
            color: #e53935;
            }
        </style>
        <script>
            $(document).ready(function(){
                $(".button-collapse").sideNav();
                $(".dropdown-button").dropdown();
                });
            function eliminar(id){
                swal({
                   title: "Eliminar",
                   text: "¿Esta seguro que desea eliminar la habitacion?",
                   type: "warning",
                   allowOutsideClick: true,
                   showCancelButton: true,
                   confirmButtonText: "Eliminar",
                   confirmButtonColor: "#f44336",
                   cancelButtonText: "Cancelar",
                   closeOnConfirm: false,
                   showLoaderOnConfirm: true
                }, function(){
                    $.ajax({
                        url: "../../EliminarHabitacionServlet",
                        method: "post",
                        data:{
                            id: id
                        },
                        success: function(){
                            swal("Eliminado","Habitación eliminadas correcatamente", "success");
                            $("#" + id).remove();
                        },
                        error: function(respuesta){
                            swal("Error", respuesta.responseText, "error");
                        }
                   });
                });
            }
        </script>
    </head>
    <body>
        <%@include file="../menu.jsp" %>
        <main>
            <section class="container">
                <h1 class="center-align">Eliminar habitación</h1>
                <article>
                    <h4 class="center-align">Ingrese el nombre de la habitación para eliminarla.</h4>
                </article>
                <div class="row">
                    <form class="col m8 offset-m2 center-align" id="form-eliminar">
                        <div class="input-field">
                            <label for="id">ID</label>
                            <input type="number" class="validate" name="id" id="id">
                        </div>
                        <div class="row">
                            <div class="col s6">
                                <%
                            for(int i = 1; i < list.size(); i++ ){
                                 %>

                                 <button onclick="eliminar<%= list.get(i).getId()%>"> Eliminar</button>
                                 <%
                            }
                                  %>
                            </div>
                            <div class="col s6">
                                <a href="/MotelsLine/admin" id="cancelar" class="btn red waves-effect btn-style">Cancelar</a>
                            </div>
                       </div>
                    </form>
                </div>
            </section>
        </main>
        <%@include file="../footer.jsp" %>
    </body>
</html>
