<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
       //CONECTANDO A LA BASE DE DATOS:
       Connection con;
       String url="jdbc:mysql://localhost:3306/personas1";
       String Driver="com.mysql.jdbc.Driver";
       String user="root";
       String clave="";
       Class.forName(Driver);
       con=DriverManager.getConnection(url,user,clave);
       PreparedStatement ps;
       //aca recibo las variables e imprime
       String cedu, nomb,tele,dire;
       cedu=request.getParameter("ced");
       nomb=request.getParameter("nom");  
        dire=request.getParameter("dir"); 
        tele=request.getParameter("tel"); 
        
        
        String sql="Update datos set Nombre=?,Direccion=?,Telefono=? where Cedula="+cedu;
        ps = con.prepareStatement(sql);
        ps.setString(1,nomb);
        ps.setString(2, dire);
        ps.setString(3, tele);
        ps.executeUpdate();
        
       out.println("<script type=\"text/javascript\">");
   out.println("alert('DATOS ACTUALIZADOS');");
   out.println("location='index.jsp';");
   out.println("</script>");
%>  