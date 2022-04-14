<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://kit.fontawesome.com/bec3cdf477.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
        <title>Editar</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-primary">
            <a class="navbar-brand" href="index.jsp">Pruebas con WEB</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="agregar.jsp">Registrar <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Features</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Pricing</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Dropdown link
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
        <BR>
   <%    
        //CONECTANDO A LA BASE DE DATOS:
       Connection con;
       String url="jdbc:mysql://localhost:3306/personas1";
       String Driver="com.mysql.jdbc.Driver";
       String user="root";
       String clave="";
       Class.forName(Driver);
       con=DriverManager.getConnection(url,user,clave);
       
//Listar los Datos de la Tabla
       PreparedStatement ps;
       ResultSet rs;
       int id=Integer.parseInt(request.getParameter("id"));
       ps=con.prepareStatement("select * from datos where Cedula="+id);
       rs=ps.executeQuery();
       while(rs.next()){
                         %>
            <center><h1>Modificar Registro</h1></center>
            <div style="display: flex;
  justify-content: center;
  align-items: center;">
            <form action="actualizar.jsp" method="POST" style="width: 500px; height: 400px; ">
                CEDULA:
                <input type="text" readonly="" name="ced" class="form-control" value="<%= rs.getInt("Cedula")%>"/>
                <br>
                 NOMBRE:
                <input type="text" name="nom" class="form-control" value="<%= rs.getString("Nombre")%>"/>
                <br>
                DIRECCIÓN:
                <input type="text" name="dir" class="form-control" value="<%= rs.getString("Direccion")%>"/>
                 <br>
                TELEFONO:
                <input type="text" name="tel" class="form-control" value="<%= rs.getString("Telefono")%>"/>
                 <br>
                <center><input type="submit" value="Actualizar" class="btn btn-primary"/></center>
                <br>
                <center><a href="index.jsp" class="btn btn-danger"><i class="fas fa-times"></i></a></center>
            </form>
            <%}%>
            </div>
    </body>
</html>
