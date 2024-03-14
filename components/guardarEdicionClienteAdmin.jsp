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
Connection conexion = null;
PreparedStatement ps = null;

try {
    Class.forName("com.mysql.jdbc.Driver");
    String nameDataBase = "inmueble";
    String localhost = "localhost";
    String puerto = "3306";
    String userName = "root";

    conexion = DriverManager.getConnection("jdbc:mysql://"+localhost+":"+puerto+"/"+nameDataBase+"",userName,"");

    String id_cli = request.getParameter("id_cli");
    String pnombre_cli = request.getParameter("pnombre_cli");
    
    String consultaMysql = "UPDATE clientes SET pnombre_cli = ? WHERE id_cli = ?";
    ps = conexion.prepareStatement(consultaMysql);
    ps.setString(1, pnombre_cli);
    ps.setString(2, id_cli);

    int filasActualizadas = ps.executeUpdate();
    if (filasActualizadas > 0) {
        response.sendRedirect("./listadoClientes.jsp");
    } else {
        out.println("Error al actualizar los datos del cliente.");
    }
} catch (ClassNotFoundException e) {
    out.println("Error en la carga del driver" + e.getMessage());
} catch (SQLException e) {
    out.println("Error accediendo a la base de datos" + e.getMessage());
} finally {
    if (ps != null) {
        try {
            ps.close();
        } catch (SQLException e) {
            out.println("Error cerrando el PreparedStatement" + e.getMessage());
        }
    }
    if (conexion != null) {
        try {
            conexion.close();
        } catch (SQLException e) {
            out.println("Error cerrando la conexión" + e.getMessage());
        }
    }
}
%>
