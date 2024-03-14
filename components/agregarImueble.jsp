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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./../CSS/global.css">
    <title>Agregar Inmueble</title>
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
        <div class="formulario">
            <h2>Agregar Inmueble</h2>
            <form action="./guardarInmueble.jsp" method="POST" class="formulario">
                <div>
                    <label for="nombre_imu">Nombre:</label>
                    <input type="text" name="nombre_imu" />
                </div>
                <div>
                    <label for="direccion_imu">Direccion:</label>
                    <input type="text" name="direccion_imu" />
                </div>
                <div>
                    <label for="codigoPostal_imu">Codigo Postal:</label>
                    <input type="text" name="codigoPostal_imu" />
                </div>
                <div>
                    <label for="descripcion_imu">Descripcion:</label>
                    <textarea name="descripcion_imu"></textarea>
                </div>
                <div>
                    <label for="precio_imu">Precio:</label>
                    <input type="text" name="precio_imu" />
                </div>
                <button type="submit">Guardar Inmueble</button>
            </form>
        </div>
    </div>
    <footer>
        <!-- Footer content here -->
    </footer>
</body>
</html>
