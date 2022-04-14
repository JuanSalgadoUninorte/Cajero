/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vista;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Recibedatos", urlPatterns = {"/Recibedatos"})
public class Recibedatos extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String ced = request.getParameter("cedula");
        String nom = request.getParameter("nombres");
        String ape = request.getParameter("apellidos");
        String tel = request.getParameter("telefono");
        String dir = request.getParameter("direccion");
        String corE = request.getParameter("correoElectronico");
        String nick = request.getParameter("nickName");

        //Impresión
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("Su cédula es: " + ced);
            out.println("<br>");
            out.println("Su nombre es: " + nom);
            out.println("<br>");
            out.println("Su apellido es: " + ape);
            out.println("<br>");
            out.println("Su teléfono es: " + tel);
            out.println("<br>");
            out.println("Su correo electrónico es: " + corE);
            out.println("<br>");
            out.println("Su dirección es: " + dir);
            out.println("<br>");
            out.println("Su apodo es: " + nick);

        }
    }

}
