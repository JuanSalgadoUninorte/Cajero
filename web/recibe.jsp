<%-- 
    Document   : recibe
    Created on : 1/09/2021, 9:16:05 a. m.
    Author     : jdsa1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    </head>
    <body>
        <h1>Recibo datos del index</h1>
        <%
        String msj = "Bienvenido";
        out.println(msj);
        out.println("<br>");
        %>
        <div class="alert alert-primary" role="alert">
        <%
        String ced = request.getParameter("cedula");
        String nom = request.getParameter("nombres");
        String ape = request.getParameter("apellidos");
        String tel = request.getParameter("telefono");
        String dir = request.getParameter("direccion");
        String corE = request.getParameter("correoElectronico");
        String nick = request.getParameter("nickName");
        out.println("Su cédula es: ");
        out.println(ced);
        out.println("<br>");
        out.println("Su nombre es: ");
        out.println(nom);
        out.println("<br>");
        out.println("Su apellido es: ");
        out.println(ape);
        out.println("<br>");
        out.println("Su dirección es: ");
        out.println(dir);
        out.println("<br>");
        out.println("Su correo electrónicoes: ");
        out.println(corE);
        out.println("<br>");
        out.println("Su teléfono es: ");
        out.println(tel);
        out.println("<br>");
        out.println("Su apodo es: ");
        out.println(nick);
        %>
        </div>
    </body>
</html>
