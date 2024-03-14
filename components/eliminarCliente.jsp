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

    // Eliminar registros relacionados de la tabla imuebles
    String consultaImuebles = "DELETE FROM imuebles WHERE fk_id_cli = ?";
    ps = conexion.prepareStatement(consultaImuebles);
    ps.setString(1, id_cli);
    ps.executeUpdate();

    // Eliminar el cliente
    String consultaClientes = "DELETE FROM clientes WHERE id_cli = ?";
    ps = conexion.prepareStatement(consultaClientes);
    ps.setString(1, id_cli);

    int filasEliminadas = ps.executeUpdate();

    if(filasEliminadas > 0){
        response.sendRedirect("./listadoClientes.jsp");
    } else {
        out.println("Error al eliminar el cliente.");
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
