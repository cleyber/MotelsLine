<%-- 
    Document   : reserva
    Created on : 14-ago-2016, 15:46:32
    Author     : Cleyber
--%>

<%@page import="models.Usuario"%>

<%
    if(session.getAttribute("usuario") == null) {
        response.sendRedirect("/MotelsLine/login.jsp");
    } else {
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        if(!usuario.getRol().equals(Usuario.EMPLEADO)) {
          response.sendRedirect("/MotelsLine/index.jsp");
        }
    }
%>


<%@page import="models.dao.DaoUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="models.Usuario"%>
<%@page  import="java.util.ArrayList"%>
<%@page  import="java.util.List"%>

<%
    DaoUsuarios dao = new DaoUsuarios();
    ArrayList<Usuario> list = new ArrayList();
    
    list = dao.consultarAll();
    
    String pagina = request.getParameter("pagina");
    int numero = 1;
    
    
    if(pagina != null){
      numero = Integer.parseInt(pagina);
    }
        

     final int REGISTROS = 11;
    List<Usuario> lista;
    //= list.subList((numero - 1) * 11, numero * 11);
    boolean ultimo = false; 
    
    if(numero * REGISTROS  > list.size()){   
       ultimo = true;
       lista = list.subList((numero -1) * REGISTROS, list.size()); 
   }else{
       lista = list.subList((numero -1)* 11, numero* REGISTROS);                    

   }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="../css/materialize.min.css" rel="stylesheet" type="text/css"/>     
        <script src="../js/jquery-3.0.0.min.js" type="text/javascript"></script>
        <script src="../js/materialize.min.js" type="text/javascript"></script>        
        <title>Usuarios</title>
    </head>
    <body>        
        <header>
            <nav>
                <div class="nav-wrapper red">
                    <a href="index.jsp" class="brand-logo"><img src="../img/img.png"></a>
                  <ul id="nav-mobile" class="right hide-on-med-and-down">
                    <li><a href="registrar.jsp">Registrar</a></li>
                    <li class="active"><a href="consultar.jsp" >Consultar</a></li>
                    <li><a href="modificar.jsp">Modificar</a></li>
                    <li><a href="eliminar.jsp">Eliminar</a></li>
                    <li><a href="eliminar.jsp">Reporte</a></li>
                    <li><a href="login.jsp">Salir</a></li>
                  </ul>
                </div>
            </nav>    
        </header>          
        <main>            
            <div class="container">
                <h1>Usuarios</h1>
            </div>
            <div class="container">
                <table class="centered">
                     <thead>
                         <tr>
                             <th>Nombre</th>
                             <th>Apellido</th>
                             <th>Cedula</th>                                             
                             <th>Correo</th>                                             
                             <th>Rol</th>                                            
                         </tr>
                     </thead>
                     <tbody>
                         <%
                            for(int i = 0; i < lista.size(); i++){                       
                         %>                
                         <tr>                             
                             <td><%=lista.get(i).getNombre()%></td>
                             <td><%=lista.get(i).getApellido()%></td>
                             <td><%=lista.get(i).getCedula()%></td>                                                               
                             <td><%=lista.get(i).getCorreo()%></td>                                                               
                             <td><%=lista.get(i).getRol()%></td>                                                               
                         </tr>                
                         <%
                             }
                         %>
                     </tbody>

                 </table>

                     <%
                         if(numero > 1){
                     %>
                     <a href="index.jsp?pagina=<%= numero - 1%>" class="btn red"><i class="material-icons">skip_previous</i></a>
                     <%
                         }
                     %>
                     <a href="#" class="btn white black-text"><%=numero%></a>
                     <%
                        if (!ultimo){
                     %>
                     <a href="index.jsp?pagina=<%=numero + 1%>" class="btn"><i class="material-icons">skip_next</i></a>
                     <%
                         }
                     %>
            </div>
        </main>
    </body>    
    
</html>
