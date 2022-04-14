<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
        <title>JSP Page</title>
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
        <br>
        <h1 style="text-align: center;">Formulario de Registro</h1>
            <br>
        <div style="text-align: center; display: flex;
  justify-content: center;
  align-items: center;">
        <form action="" method="POST" style="width: 500px;">
            <div class="form-group">
                <input type="text" class="form-control" id="cedula" name="cedula" placeholder="Cédula">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" id="telefono" name="telefono" placeholder="Teléfono">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Dirección">
            </div>
            <button type="submit" class="btn btn-primary">Enviar Datos</button>
        </form>
            </div>
        
        <%
       //CONECTANOD A LA BASE DE DATOS:
       Connection con;
       String url="jdbc:mysql://localhost:3306/personas1";
       String Driver="com.mysql.jdbc.Driver";
       String user="root";
       String clave="";
       Class.forName(Driver);
       con = DriverManager.getConnection(url,user,clave);
PreparedStatement ps;
String ced, dir, tel, nom;
nom = request.getParameter("nombre");
tel = request.getParameter("telefono");
dir = request.getParameter("direccion");
ced = request.getParameter("cedula");
String SQL = "INSERT INTO datos(Cedula, Nombre, Direccion, Telefono) VALUES ('" + ced + "','" + nom + "','" + dir + "','" + tel + "')";
if (nom != null && ced != null) {
ps = con.prepareStatement(SQL);
ps.executeUpdate();
//           JOptionPane.showMessageDialog(null,"Se Agrego Correctamete");           
out.println("<script type=\"text/javascript\">");
out.println("alert('DATOS ALMACENADOS');");
out.println("location='index.jsp';");
out.println("</script>");
//response.sendRedirect("index.jsp");
}
%> 
        
    </body>
</html>
