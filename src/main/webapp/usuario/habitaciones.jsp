<%@page import="util.Routes"%>
<%@page import="models.dao.DaoHabitaciones"%>
<%@page import="models.Habitaciones"%>
<%@page import="models.Imagen"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<Habitaciones> list = new ArrayList();
    DaoHabitaciones dao = new DaoHabitaciones();

    list = dao.consultarAll();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link href="<%=Routes.getUrl("css/materialize.min.css")%>" rel="stylesheet" type="text/css"/>
          <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
          <link href="<%=Routes.getUrl("css/style.css")%>" rel="stylesheet" type="text/css"/>

        <script src="<%=Routes.getUrl("js/jquery-3.0.0.min.js")%>" type="text/javascript"></script>
        <script src="<%=Routes.getUrl("js/materialize.min.js")%>" type="text/javascript"></script>
        <script>
            $(document).ready(function(){
               $(".button-collapse").sideNav();
               $('.slider').slider({full_width: true});
            });

        </script>
        <style>
            ul li{
                float: left;
                margin: 3px;
            }
            h1 {
            font-family: fantasy;
            color: #e53935;
            }
            .material-icons.md-36 a{
                font-size: 36px;
                position: absolute;
                top: 27%;
                left: 85%;
            }

        </style>
        <title>Habitaciones</title>
    </head>
    <body>

        <%@include file="menuUser.jsp" %>

        <div class="slider">
    <ul class="slides">
      <li>
        <img src="<%=Routes.getUrl("img/img1.jpg")%>"> <!-- random image -->
        <div class="caption center-align">
          <h3>Bienvenido a MotelsLine</h3>
          <h5 class="light grey-text text-lighten-3">La forma mas fácil de reservar un motel</h5>
        </div>
      </li>
      <li>
        <img src="<%=Routes.getUrl("img/img2.jpg")%>"> <!-- random image -->
        <div class="caption left-align">
          <h3>Elige las mejores habitaciones</h3>
          <h5 class="light grey-text text-lighten-3">Hay para todos los gustos</h5>
        </div>
      </li>
      <li>
        <img src="<%=Routes.getUrl("img/img3.jpg")%>"> <!-- random image -->
        <div class="caption right-align">
          <h3>Elige los servicios que quieras</h3>
          <h5 class="light grey-text text-lighten-3">A los mejores precios</h5>
        </div>
      </li>
      <li>
        <img src="<%=Routes.getUrl("img/img4.jpg")%>"> <!-- random image -->
        <div class="caption center-align">
          <h3>has tu mejor reserva</h3>
          <h5 class="light grey-text text-lighten-3"> En simples pasos</h5>
        </div>
      </li>
      <li>
        <img src="<%=Routes.getUrl("img/slider.jpg")%>"> <!-- random image -->
        <div class="caption right-align">
          <h3>MotelsLine</h3>
          <h5 class="light grey-text text-lighten-3"></h5>
        </div>
      </li>
    </ul>
  </div>
            <main>
            <section class="container">
                <h1 class="center-align">HABITACIÓNES</h1>
              <!--  <img src="img/HABITACIONES.png">-->
              <div class="divider"></div>
                <div class="row">
                <%
                    for(Habitaciones habitacion  : list){
                %>
                    <div class=" col s12 m6">
                        <div class="card">
                            <div class="card-image">
                                <%
                                   if(habitacion.getImagenes().size() >= 1){
                                %>
                                <div class="slider">
                                    <ul class="slides">
                                        <%

                                                for(Imagen imagen : habitacion.getImagenes()){

                                         %>
                                      <li>
                                          <a href="<%=Routes.getUrl("usuario/habitacionInfo.jsp?habitacion=")%><%= habitacion.getId()%>"><img src="<%=Routes.getUrl("imgServidor/")%><%=imagen.getNombre()%>"> </a>
                                      </li>
                                      <%
                                            }
                                        %>
                                    </ul>
                                </div>
                                 <%
                                     }else{
                                 %>
                                 <div>
                                     <img src="<%=Routes.getUrl("img/notImg.png")%>">
                                 </div>
                                 <%
                                     }
                                 %>
                                 <a href="<%=Routes.getUrl("usuario/habitacionInfo.jsp?habitacion=")%><%= habitacion.getId()%>"><h5 class="center-align"><b><%= habitacion.getNombre()%></b></h5></a>
                            </div>

                        </div>
                    </div>
                <%
                    }

                %>
                </div>


            </section>
        </main>
                <%@include file="../admin/footer.jsp"%>
    </body>
</html>
