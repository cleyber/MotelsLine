<%-- 
    Document   : habitacionInfo
    Created on : 25-ago-2016, 18:37:42
    Author     : Cleyber
--%>

<%@page import="models.dao.DaoHabitaciones"%>
<%@page import="models.Habitaciones"%>
<%@page import="models.Imagen"%>
<%@page import="java.util.ArrayList"%>

<%
    int id = Integer.parseInt(request.getParameter("habitacion"));
    ArrayList<Habitaciones> list = new ArrayList();
    DaoHabitaciones dao = new DaoHabitaciones();
    Habitaciones habitacion = dao.consultar(id);    
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link href="../css/materialize.min.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>        
        <script src="../js/jquery-3.0.0.min.js" type="text/javascript"></script>
        <script src="../js/materialize.min.js" type="text/javascript"></script>
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
                    <%
                        for(Imagen imagenes : habitacion.getImagenes()){
                    %>
                    <li>
                        <img src="/MotelsLine/imgServidor/<%= imagenes.getNombre()%>">                     
                    </li>
                    <%
                        }
                    %>
                </ul>
            </div>
            <main>  
            <section class="container">
                <div class="row">
                    <div col s6>                         
                        <p><b>Descripcion:</b> <%= habitacion.getDescripcion()%></p>
                        <p><b>Precio:</b><%= habitacion.getPrecio()%></p>
                        <p><b>Cantidad de horas:</b> <%= habitacion.getCantidadHoras()%></p>
                        <p><b>Hora adicional</b><%= habitacion.getHoraAdicional()%></p>
                        <p><b>Persona adicional</b><%= habitacion.getPersonaAdicional()%></p>
                    </div>
                    <div class="valign-wrapper">
                        <div class="col s6 right-align valign">
                            <a href="/MotelsLine/usuario/reservas.jsp"><button class="btn red darken-3">Reservar</button></a>
                        </div>
                    </div>
                </div>
            </section>
                
        </main>
        <%@include file="../admin/footer.jsp"%>
    </body>
</html>