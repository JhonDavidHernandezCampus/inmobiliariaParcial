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
    <link rel="stylesheet" href="./../CSS/dashboard/dashboard.css">
    <title>Listado de Inmuebles</title>
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
        <h2>Listado de Inmuebles</h2>
        <button class="btn-agregar"><a href="./agregarImueble.jsp">Agregar Inmueble</a></button>
        <table>
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Direccion</th>
                    <th>Codigo Postal</th>
                    <th>Descripcion</th>
                    <th>Precio</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <% 
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

                    String consultaMysql = "SELECT * FROM imuebles";
                    ps = conexion.prepareStatement(consultaMysql);
                    rs = ps.executeQuery();

                    while(rs.next()) { 
                %>
                    <tr>
                      <td><%= rs.getString("nombre_imu") %></td>
                      <td><%= rs.getString("direccion_imu") %></td>
                      <td><%= rs.getString("codigoPostal_imu") %></td>
                      <td><%= rs.getString("descripcion_imu") %></td>
                      <td><%= rs.getString("precio_imu") %></td>
                      <td>
                          <form action="./editarImueble.jsp" method="post">
                              <input type="hidden" name="id_imu" value="<%= rs.getString("id_imu") %>" />
                              <input type="submit" class="btn-editar" value="Editar" />
                          </form>
                          <form action="./eliminarImueble.jsp" method="post">
                              <input type="hidden" name="id_imu" value="<%= rs.getString("id_imu") %>" />
                              <input type="submit" class="btn-eliminar" value="Eliminar" />
                          </form>
                      </td>
                    </tr>
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
                        catch (SQLException e) { out.println("Error cerrando la conexión" + e.getMessage()); }
                    }
                }
                %>
            </tbody>
        </table>
    </div>
    <footer>
        <!-- Footer content here -->
    </footer>
</body>
</html>
