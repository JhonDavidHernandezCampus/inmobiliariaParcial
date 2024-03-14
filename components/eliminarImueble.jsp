<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
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
String id_imu = request.getParameter("id_imu");

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

    String consultaMysql = "DELETE FROM imuebles WHERE id_imu = ?";
    ps = conexion.prepareStatement(consultaMysql);
    ps.setString(1, id_imu);

    int filasEliminadas = ps.executeUpdate();

    if (filasEliminadas > 0) {
        response.sendRedirect("./listadoImuebles.jsp");
    } else {
        out.println("No se pudo eliminar el inmueble.");
    }

} catch (ClassNotFoundException e) {
    out.println("Error en la carga del driver" + e.getMessage());
} catch (SQLException e) {
    out.println("Error accediendo a la base de datos" + e.getMessage());
} finally {
    if (ps != null) {
        try { ps.close(); } 
        catch (SQLException e) { out.println("Error cerrando el PreparedStatement" + e.getMessage()); }
    }
    if (conexion != null) {
        try { conexion.close(); } 
        catch (SQLException e) { out.println("Error cerrando la conexión" + e.getMessage()); }
    }
}
%>
