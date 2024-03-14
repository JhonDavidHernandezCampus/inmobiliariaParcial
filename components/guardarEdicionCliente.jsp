<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
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
String id_cli = request.getParameter("id_cli");
String papellido_cli = request.getParameter("papellido_cli");
String sapellido_cli = request.getParameter("sapellido_cli");
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

    String updateQuery = "UPDATE clientes SET papellido_cli=?, sapellido_cli=?, estado_civil_cli=?, direccion_cli=?, num_telefono_cli=? WHERE id_cli=?";
    ps = conexion.prepareStatement(updateQuery);
    ps.setString(1, papellido_cli);
    ps.setString(2, sapellido_cli);
    ps.setString(3, estado_civil_cli);
    ps.setString(4, direccion_cli);
    ps.setString(5, num_telefono_cli);
    ps.setString(6, id_cli);

    int rowsAffected = ps.executeUpdate();

    if (rowsAffected > 0) {
        response.sendRedirect("./dashboard.jsp");
    } else {
        // Manejar error en caso de que no se actualicen los datos
        out.println("Error: No se pudieron actualizar los datos.");
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
            out.println("Error cerrando la conexión: " + e.getMessage());
        }
    }
}
%>
