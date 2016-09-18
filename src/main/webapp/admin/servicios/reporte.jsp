<%-- 
    Document   : reporte
    Created on : 29-jun-2016, 17:45:56
    Author     : Cleyber
--%>


<%@page import="java.io.*"%>
<%@page  import="java.util.*"%>
<%@page  import="net.sf.jasperreports.engine.*"%>
<%@page  import="net.sf.jasperreports.view.JasperViewer"%>
<%@page import="models.dao.Conexion" %>
<%@page  import="javax.servlet.ServletResponse"%>




        <%            
            Conexion conexion = new Conexion();
            File file = new File (application.getRealPath("report1.jasper"));            
            Map<String, Object> parameter = new HashMap();
            out.println("ERROR" + file);
            byte[] bytes = JasperRunManager.runReportToPdf(file.getPath(), parameter, conexion.getConexion());
            
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream stream = response.getOutputStream();
            stream.write(bytes);
            
            stream.flush();
            stream.close();
        %>
        