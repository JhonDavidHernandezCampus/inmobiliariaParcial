<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./../CSS/global.css">
    <title>Editar Inmueble</title>
</head>
<body>
    <header>
         <nav>
            <ul>
                <li><a href="./dashboard.jsp">Inicio</a></li>
                <li><a href="./editarInfoCliente.jsp">Editar mi informacion</a></li>
                <li><a href="./listadoFiadores.jsp">Fiadores disponibles</a></li>
                <%
                String rol = (String) session.getAttribute("rol");
                if("admin".equals(rol)){ %>
                    <li><a href="./listadoClientes.jsp">Clientes</a></li>
                    <li><a href="./listadoImuebles.jsp">Inmuebles</a></li>
                <% }
                %>
            </ul>
            <div class="user-info">
            <%
            String usuario = (String) session.getAttribute("usuario");
            String nombreCompleto = (String) session.getAttribute("nombreCompleto");
            %>
                <div style="display: flex; flex-direction: column;">
                    <span><%=usuario %></span>
                    <span><%=nombreCompleto %></span>
                </div>
              <a href="./cerrarSesion.jsp"><img src="./../img/cerrarSession.png" width="30px" height="30px"></img></a>
            </div>
        </nav>
    </header>
    <div class="container">
        
        <%
        String id_imu = request.getParameter("id_imu");

        Connection conexion = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String nameDataBase = "inmueble";
            String localhost = "localhost";
            String puerto = "3306";
            String userName = "root";

            conexion = DriverManager.getConnection(
                    "jdbc:mysql://"+localhost+":"+puerto+"/"+nameDataBase+"",userName,"");

            String consultaMysql = "SELECT * FROM imuebles WHERE id_imu = ?";
            ps = conexion.prepareStatement(consultaMysql);
            ps.setString(1, id_imu);
            rs = ps.executeQuery();

            if(rs.next()) {
                String nombre_imu = rs.getString("nombre_imu");
                String direccion_imu = rs.getString("direccion_imu");
                String codigoPostal_imu = rs.getString("codigoPostal_imu");
                String descripcion_imu = rs.getString("descripcion_imu");
                String precio_imu = rs.getString("precio_imu");
        %>
        <div class="formulario">
        <h2>Editar Inmueble</h2>
        <form action="./guardarEdicionImueble.jsp" method="POST" class="formulario">
            <input type="hidden" name="id_imu" value="<%= id_imu %>" />
            <div>
                <label for="nombre_imu">Nombre:</label>
                <input type="text" name="nombre_imu" value="<%= nombre_imu %>" />
            </div>
            <div>
                <label for="direccion_imu">Direccion:</label>
                <input type="text" name="direccion_imu" value="<%= direccion_imu %>" />
            </div>
            <div>
                <label for="codigoPostal_imu">Codigo Postal:</label>
                <input type="text" name="codigoPostal_imu" value="<%= codigoPostal_imu %>" />
            </div>
            <div>
                <label for="descripcion_imu">Descripcion:</label>
                <input type="text" name="descripcion_imu" value="<%= descripcion_imu %>" />
            </div>
            <div>
                <label for="precio_imu">Precio:</label>
                <input type="text" name="precio_imu" value="<%= precio_imu %>" />
            </div>
            <button type="submit">Guardar Cambios</button>
        </form>
        </div>
        <% 
            }
        } catch (ClassNotFoundException e) {
            out.println("Error en la carga del driver" + e.getMessage());
        } catch (SQLException e) {
            out.println("Error accediendo a la base de datos" + e.getMessage());
        } finally {
            if (rs != null) {
                try { rs.close(); } 
                catch (SQLException e) { out.println("Error cerrando el resultset" + e.getMessage()); }
            }
            if (ps != null) {
                try { ps.close(); } 
                catch (SQLException e) { out.println("Error cerrando el PreparedStatement" + e.getMessage()); }
            }
            if (conexion != null) {
                try { conexion.close(); } 
                catch (SQLException e) { out.println("Error cerrando la conexion" + e.getMessage()); }
            }
        }
        %>
    </div>
    <footer>
        <!-- Footer content here -->
    </footer>
</body>
</html>
