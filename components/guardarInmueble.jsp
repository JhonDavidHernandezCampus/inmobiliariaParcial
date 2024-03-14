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
String nombre_imu = request.getParameter("nombre_imu");
String direccion_imu = request.getParameter("direccion_imu");
String codigoPostal_imu = request.getParameter("codigoPostal_imu");
String descripcion_imu = request.getParameter("descripcion_imu");
String precio_imu = request.getParameter("precio_imu");

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

    String consultaSql = "INSERT INTO imuebles (nombre_imu, direccion_imu, codigoPostal_imu, descripcion_imu, precio_imu) VALUES (?, ?, ?, ?, ?)";
    ps = conexion.prepareStatement(consultaSql);
    ps.setString(1, nombre_imu);
    ps.setString(2, direccion_imu);
    ps.setString(3, codigoPostal_imu);
    ps.setString(4, descripcion_imu);
    ps.setString(5, precio_imu);

    int filasInsertadas = ps.executeUpdate();

    if (filasInsertadas > 0) {
        response.sendRedirect("./listadoImuebles.jsp");
    } else {
        out.println("Error al agregar el inmueble.");
    }

} catch (ClassNotFoundException e) {
    out.println("Error en la carga del driver: " + e.getMessage());
} catch (SQLException e) {
    out.println("Error accediendo a la base de datos: " + e.getMessage());
} finally {
    if (ps != null) {
        try { ps.close(); } 
        catch (SQLException e) { out.println("Error cerrando el PreparedStatement: " + e.getMessage()); }
    }
    if (conexion != null) {
        try { conexion.close(); }
        catch (SQLException e) { out.println("Error cerrando la conexión: " + e.getMessage()); }
    }
}
%>
