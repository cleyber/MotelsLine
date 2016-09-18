<%-- 
    Document   : index
    Created on : 15-jul-2016, 20:43:14
    Author     : Cleyber
--%>
<%@page import="models.Usuario"%>
<%@page import="models.Imagen"%>
<%@page import="models.Servicios"%>
<%@page import="models.dao.DaoServicios"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.dao.Conexion" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    
    if(session.getAttribute("usuario") == null) {
        response.sendRedirect("/MotelsLine/login.jsp");
    } else {
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        if(!usuario.getRol().equals(Usuario.ADMINISTRADOR)) {
            response.sendRedirect("/MotelsLine/index.jsp");
        }
    }

    
    int id = Integer.parseInt(request.getParameter("imagen"));
    DaoServicios dao = new DaoServicios();
    Servicios servicio = new Servicios();    
    
    servicio = dao.consultar(id);
%>

<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../css/materialize.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/style.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/sweetalert.css" rel="stylesheet" type="text/css"/>        
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="../../js/jquery-3.0.0.min.js" type="text/javascript"></script>
        <script src="../../js/materialize.min.js" type="text/javascript"></script>
        <script src="../../js/sweetalert.min.js" type="text/javascript"></script>
        <script>            
            $(document).ready(function(){
                $(".button-collapse").sideNav(); 
                $(".dropdown-button").dropdown();
            });
            
            function eliminarImg(id){
                /*swal({
                   title: "Eliminar",
                   text: "¿Esta seguro que desea eliminar la imagen?",
                   type: "warning",
                   allowEscapeKey: true,
                   allowOutsideClick: true,
                   showCancelButton: true,
                   showConfirmButton: true,
                   confirmButtonText: "Eliminar",
                   confirmButtonColor: "#f44336",
                   cancelButtonText: "Cancelar"
                },
                function(){                    
                });*/
                $.ajax({
                    url: "/MotelsLine/EliminarImagenServicioServlet",
                    method: "post",
                    data: {
                        id: id
                    },
                    success: function(){
                       $("#" + id).remove(); 
                    }
                });
            }
        </script>
        <title>Imágenes servicios</title>
        <style>
            .imagenes img{
                display: inline-block;
                max-height: 150px;                
            }
            
        </style>
    </head>
    <body>
        <%@include file="../menu.jsp" %>
        <main>
            <section class="container">
                <h1 style="margin-bottom: 10%"> Servicio: <%=servicio.getNombre()%></h1>               

                <form enctype="MULTIPART/FORM-DATA" method="post" action="../../subirImagenesServicios.jsp?imagen=<%=id%>">
                    <div class="file-field input-field">
                    <div class="btn">
                      <span>File</span>
                      <input type="file" name="imagen" accept="image/*">
                    </div>
                    <div class="file-path-wrapper">
                      <input class="file-path validate" type="text">
                    </div>
                  </div>
                    <div class="right-align">
                        <input type="submit" value="guardar" class="btn">
                    </div>  
                </form>  
                <div class="row">                
                    <%
                        if(servicio.getImagenes().size() > 0){
                            for(Imagen imagen : servicio.getImagenes()){
                    %>
                    <div class="col s12 m4">
                        <div class="card" id="<%= imagen.getId()%>">
                            <div class="card-image">                        
                                <img src="/MotelsLine/imgServidor/<%=imagen.getNombre()%>">
                            </div>
                            <div class="card-action center-align">
                                <a href="#" class="red-text " onclick="eliminarImg(<%=imagen.getId()%>)"><i class="fa fa-trash fa-3x "></i></a>
                            </div>
                        </div>
                    </div>
                    <%
                            }
                        }else{   
                    %>
                    <div class="center-align">
                        <img src="/MotelsLine/img/addImage.svg">
                    </div>
                    <%
                        }
                    %>
                </div>            
            </section>
        </main>
    </body>
</html>