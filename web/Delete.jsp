<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection con;
    String url = "jdbc:mysql://localhost:3306/personas1";
    String Driver = "com.mysql.jdbc.Driver";
    String user = "root";
    String contra = "";
    Class.forName(Driver);
    con = DriverManager.getConnection(url, user, contra);
    PreparedStatement ps;
    int id = Integer.parseInt(request.getParameter("id"));
    ps = con.prepareStatement("delete from datos where Cedula=" + id);
    ps.executeUpdate();
    out.println("<script type=\"text/javascript\">");
    out.println("alert('DATOS ELIMINADOS');");
    out.println("location='index.jsp';");
    out.println("</script>");
%>