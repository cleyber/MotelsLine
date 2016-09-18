<%-- 
    Document   : subirImgHabitacion
    Created on : 17/08/2016, 02:29:20 PM
    Author     : Sena
--%>

<%@page import="models.Habitaciones"%>
<%@page import="models.dao.DaoHabitaciones"%>
<%@page import="models.Imagen"%>
<%@page import="models.Servicios"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.*" %>
<%@ page import="java.io.*" %>
<%@page import="models.dao.Conexion" %>
<%@page import="java.nio.file.Files" %>
<%@page import="models.dao.DaoServicios" %>
 
<%
        int id = Integer.parseInt(request.getParameter("id"));
        DaoHabitaciones dao = new DaoHabitaciones();
        Habitaciones habitacion = dao.consultar(id); 
    
        /*FileItemFactory es una interfaz para crear FileItem*/
        FileItemFactory file_factory = new DiskFileItemFactory();
 
        /*ServletFileUpload esta clase convierte los input file a FileItem*/
        ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
        /*sacando los FileItem del ServletFileUpload en una lista */
        List items = servlet_up.parseRequest(request);
 
        for(int i = 0; i < items.size(); i++){
            /*FileItem representa un archivo en memoria que puede ser pasado al disco duro*/
            FileItem item = (FileItem) items.get(i);
            
            /*item.isFormField() false=input file; true=text field*/
            if (! item.isFormField()){ 
                
                // parte el nombre del archivo en donde encuentra el "."
                ArrayList<String> list = new ArrayList(Arrays.asList(item.getName().split("\\.")));
                if(list.size()>= 2){
                
                    // guardamos el ultimo valor de la lista, que seria la extencion(jpg,png,etc)
                    String extencion = list.get(list.size()-1);
                    //nombre de la imagen
                    String nombre = item.hashCode() + "." + extencion;  
                    
                    Imagen imagen = new Imagen();
                    imagen.setNombre(nombre);
                    habitacion.addImagen(imagen);


                    /*la cual sera la ruta al archivo en el servidor*/
                    File imagenes = new File(getServletContext().getRealPath("") + "/imgServidor/" + nombre);
                    File backupImagenes = new File(getServletContext().getRealPath("") + "/../../backupImgServidor/" + nombre);
                
                /*y lo escribimos en el servidor*/   
                    item.write(imagenes);

                    Files.copy(imagenes.toPath(), backupImagenes.toPath());
                        
                   
                
                /*
                out.print("Nombre --> " + item.getName() );
                out.print("<br> Tipo -- " + item.getContentType());
                out.print("<br> tamaño --> " + (item.getSize()/1240)+ "KB");
                out.print("<br>");
                out.print("Pruba -->" + getServletContext().getRealPath(""));
                out.print("<br>");
                out.print("item ->>" + item.hashCode());
                out.print("<br>");*/
                
                
                
               // out.print("token->>" + );
                
                }
            }
        }
        
        dao.insertarImagenes(habitacion);
        response.sendRedirect("/MotelsLine/admin/habitaciones/imagenes.jsp?id=" + id);

%>
