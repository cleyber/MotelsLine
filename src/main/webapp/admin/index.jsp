<%--
    Document   : index
    Created on : 16-sep-2016, 20:41:37
    Author     : Cleyber
--%>
<%@page import="util.Routes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="<%=Routes.getUrl("css/materialize.min.css")%>" rel="stylesheet" type="text/css"/>
        <script src="<%=Routes.getUrl("js/jquery-3.0.0.min.js")%>" type="text/javascript"></script>
        <script src="<%=Routes.getUrl("js/materialize.min.js")%>" type="text/javascript"></script>
        <title>Inicio</title>
    </head>
    <body>
        <main>
            <section class="container">
                <div class="row">
                    <div class="col m11">

                    </div>
                    <div class="col m1">
                        <div>
                            <i class="fa fa-user"></i><p>Usuarios</p><span class="new badge">4</span>
                        </div>
                    </div>
                </div>
            </section>
        </main>
    </body>
</html>
