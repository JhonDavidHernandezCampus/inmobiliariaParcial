<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.io.PrintWriter" %>
<%
session = request.getSession(false);

if (session != null && session.getAttribute("usuario") != null) {
    String usuario = (String) session.getAttribute("usuario");
    String nombreCompleto = (String) session.getAttribute("nombreCompleto");
    String rol = (String) session.getAttribute("rol");
    
} else {
    response.sendRedirect("./../index.jsp");
}
%>

<%
String id_cli = request.getParameter("id_cli");
String pnombre_cli = request.getParameter("pnombre_cli");
String snombre_cli = request.getParameter("snombre_cli");
String papellido_cli = request.getParameter("papellido_cli");
String sapellido_cli = request.getParameter("sapellido_cli");
String correo_cli = request.getParameter("correo_cli");
String estado_civil_cli = request.getParameter("estado_civil_cli");
String direccion_cli = request.getParameter("direccion_cli");
String num_telefono_cli = request.getParameter("num_telefono_cli");

Connection conexion = null;
PreparedStatement ps = null;

try {
    Class.forName("com.mysql.jdbc.Driver");
    String nameDataBase = "inmueble";
    String localhost = "localhost";
    String puerto = "3306";
    String userName = "root";

    conexion = DriverManager.getConnection(
            "jdbc:mysql://"+localhost+":"+puerto+"/"+nameDataBase+"",userName,"");

    String consultaMysql = "INSERT INTO clientes (id_cli,pnombre_cli, snombre_cli, papellido_cli, sapellido_cli, correo_cli, estado_civil_cli, direccion_cli, num_telefono_cli) VALUES (?,?, ?, ?, ?, ?, ?, ?, ?)";
    ps = conexion.prepareStatement(consultaMysql);
    ps.setString(1, id_cli);
    ps.setString(2, pnombre_cli);
    ps.setString(3, snombre_cli);
    ps.setString(4, papellido_cli);
    ps.setString(5, sapellido_cli);
    ps.setString(6, correo_cli);
    ps.setString(7, estado_civil_cli);
    ps.setString(8, direccion_cli);
    ps.setString(9, num_telefono_cli);

    int filasInsertadas = ps.executeUpdate();

    if(filasInsertadas > 0){
        response.sendRedirect("./listadoClientes.jsp");
    } else {
        out.println("Error al agregar el cliente.");
    }

} catch (ClassNotFoundException e) {
    out.println("Error en la carga del driver: " + e.getMessage());
} catch (SQLException e) {
    out.println("Error accediendo a la base de datos: " + e.getMessage());
} finally {
    if (ps != null) {
        try {
            ps.close();
        } catch (SQLException e) {
            out.println("Error cerrando el PreparedStatement: " + e.getMessage());
        }
    }
    if (conexion != null) {
        try {
            conexion.close();
        } catch (SQLException e) {
            out.println("Error cerrando la conexion: " + e.getMessage());
        }
    }
}
%>
