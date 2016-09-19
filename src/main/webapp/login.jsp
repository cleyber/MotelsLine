<%--
    Document   : login
    Created on : 22-jun-2016, 18:45:50
    Author     : Cleyber
--%>
<%@page import="util.Routes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link href="<%=Routes.getUrl("css/materialize.min.css")%>" rel="stylesheet" type="text/css"/>
        <link href="<%=Routes.getUrl("css/style.css")%>" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="<%=Routes.getUrl("js/jquery-3.0.0.min.js")%>" type="text/javascript"></script>
        <script src="<%=Routes.getUrl("js/materialize.min.js")%>" type="text/javascript"></script>
        <script>
            $(document).ready(function(){
                $(".button-collapse").sideNav();
                $(".dropdown-button").dropdown();
            });
        </script>


        <title>Inicio de sesión</title>
    </head>
        <%@include file="usuario/menuUser.jsp" %>
        <main>
        <body bgcolor="#4183d7">
    <div id="wrapper" class="valign-wrapper">
      <div class="valign">
        <section class="container">
          <div class="row">
            <div id="targeta" class="col s12 col m8 offset-m2">
              <div class="card  white">
                <div class="card-content">
                  <div class="center-align">
                    <span id="tituloLogin">Ingresar a MotelsLine</span>
                  </div>
                  <h6 id="pregunta" class="center-align"><a href="<%=Routes.getUrl("registrar.jsp")%>">¿No tienes una cuenta? Registrate</a></h6>
                  <form action="LoginServlet" method="post">
                    <div class="input-field">
                      <label for="correo">Correo</label>
                      <input type="email" id="correo" name="correo">
                    </div>
                    <div class="input-field">
                      <label for="clave">Clave</label>
                      <input type="password" id="clave" name="clave">
                    </div>
                    <div class="right-align">
                      <a href="#">¿Olvidaste tu clave?</a>
                    </div>
                    <div>
                      <button class="btn waves-effect waves-light" id="guaradar" type="submit" name="action">iniciar sesion</button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
    </div>
   </main>
    <%@include file="admin/footer.jsp" %>
  </body>
</html>
