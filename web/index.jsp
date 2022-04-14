<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta http-equiv=”Content-Type” content=”text/html; charset=UTF-8″ />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <script src="https://kit.fontawesome.com/bec3cdf477.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

        <title>INDEX</title>
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
    <center><h1>Menú Principal</h1></center>
    <br>


    <%
        Connection con;
        String url = "jdbc:mysql://localhost:3306/personas1";
        String Driver = "com.mysql.jdbc.Driver";
        String user = "root";
        String contra = "";
        Class.forName(Driver);
        con = DriverManager.getConnection(url, user, contra);
        PreparedStatement ps;

        Statement sm;
        ResultSet rs;
        sm = con.createStatement();
        rs = sm.executeQuery("select * from datos");
    %>

    <div class="container">               

        <table class="table table-striped table-dark"  id="tablaDatos">
            <thead>
                <tr>
                    <th class="text-center">CEDULA</th>
                    <th class="text-center">Nombres</th>
                    <th class="text-center">DIRECCION</th>
                    <th class="text-center">TELEFONO</th>
                    <th class="text-center">EDICION</th>
                </tr>
            </thead>
            <tbody id="tbodys">
                <%
                    while (rs.next()) {
                %>
                <tr>
                    <td class="text-center"><%= rs.getString("Cedula")%></td>
                    <td class="text-center"><%= rs.getString("Nombre")%></td>
                    <td class="text-center"><%= rs.getString("Direccion")%></td>
                    <td class="text-center"><%= rs.getString("Telefono")%></td>
                    <td class="text-center">


                        <a href="Editar.jsp?id=<%= rs.getInt("Cedula")%>" class="btn btn-primary"><i class="fas fa-pencil-alt"></i></a>
                        <a href="Delete.jsp?id=<%= rs.getInt("Cedula")%>" class="btn btn-danger"><i class="fas fa-trash"></i></a>
                    </td>
                </tr>
                <%}%>
        </table>
    </div> 
         <center><a href="agregar.jsp" class="btn btn-success"><i class="fas fa-plus-square"></i></a></center>
</body>
</html>

