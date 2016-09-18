<header>
    <%
        boolean logueado = false;
        
        if(session.getAttribute("usuario") != null) {
        logueado = true;
    }    
        
    %>
    <nav>
        <div class="nav-wrapper blue-grey darken-3">
            <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
            <a href="/MotelsLine/index.jsp" class="brand-logo"><img src="/MotelsLine/img/img.png"></a>
            <div class="container">
                <ul id="nav-mobile" class="right hide-on-med-and-down">
                   <li><a href="/MotelsLine/index.jsp">Inicio</a></li>                   
                   <li><a href="/MotelsLine/usuario/servicios.jsp">Servicios</a></li>                   
                   <li><a href="/MotelsLine/usuario/habitaciones.jsp">Habitaciones</a></li> 
                   <%if(!logueado){%>
                        <li><a href="/MotelsLine/login.jsp">Ingresar</a></li>
                   <%}%>
                   <%if(logueado){%>
                        <li><a href="/MotelsLine/usuario/reservas.jsp">Reservas</a></li>
                        <li><a href="/MotelsLine/modifPerfil.jsp">Perfil</a></li>
                        <li><a href="/MotelsLine/LogoutServlet">Salir</a></li>
                   <%}%>
                   
                </ul>
                <ul id="mobile-demo" class="side-nav">
                   <li><a href="/MotelsLine/index.jsp">Inicio</a></li>                   
                   <li><a href="/MotelsLine/usuario/servicios.jsp">Servicios</a></li>                   
                   <li><a href="/MotelsLine/usuario/habitaciones.jsp">Habitaciones</a></li>
                   <%if(!logueado){%>
                        <li><a href="/MotelsLine/login.jsp">Ingresar</a></li>
                   <%}%>
                   <%if(logueado){%>
                        <li><a href="/MotelsLine/usuario/reservas.jsp">Reservas</a></li>
                        <li><a href="/MotelsLine/modifPerfil.jsp">Perfil</a></li>
                        <li><a href="/MotelsLine/LogoutServlet">Salir</a></li>
                   <%}%>
                </ul>
            </div>
        </div>
    </nav>    
</header>