<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.*" %>
<%

String usuario = request.getParameter("usuario");
String password = request.getParameter("idPassword");

Connection conexion = null;
PreparedStatement ps = null;
ResultSet rs=null;

try {
    Class.forName("com.mysql.jdbc.Driver");
    String nameDataBase = "inmueble";
    String localhost = "localhost";
    String puerto = "3306";
    String userName = "root";

    conexion = DriverManager.getConnection(
            "jdbc:mysql://"+localhost+":"+puerto+"/"+nameDataBase+"",userName,"");

    String consultaMysql = "SELECT * FROM clientes WHERE correo_cli = ? AND id_cli = ?";
    ps = conexion.prepareStatement(consultaMysql);
    ps.setString(1,usuario);
    ps.setString(2,password);
    
    rs = ps.executeQuery();

    // response.sendRedirect("mostrar.jsp");
    if(rs.next()){ // <- como puedo hacer esta validacion?
        response.sendRedirect("dashboar.jsp");
    }else{
        response.sendRedirect("./../../index.jsp?error=true");
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
            out.println("Error cerrando la sentencia: " + e.getMessage());
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
