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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./../CSS/global.css">
    <title>Agregar Cliente</title>
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
        <h2>Agregar Cliente</h2>
        <form action="./agregarClienteDataBase.jsp" method="POST">
        <div>
                <label for="id_cli">Identificacion:</label>
                <input type="text" name="id_cli" required />
            </div>
            <div>
                <label for="pnombre_cli">Primer Nombre:</label>
                <input type="text" name="pnombre_cli" required />
            </div>
            <div>
                <label for="snombre_cli">Segundo Nombre:</label>
                <input type="text" name="snombre_cli" />
            </div>
            <div>
                <label for="papellido_cli">Primer Apellido:</label>
                <input type="text" name="papellido_cli" required />
            </div>
            <div>
                <label for="sapellido_cli">Segundo Apellido:</label>
                <input type="text" name="sapellido_cli" />
            </div>
            <div>
                <label for="correo_cli">Correo Electronico:</label>
                <input type="email" name="correo_cli" required />
            </div>
            <div>
                <label for="estado_civil_cli">Estado Civil:</label>
                <input type="text" name="estado_civil_cli" required />
            </div>
            <div>
                <label for="direccion_cli">Direccion:</label>
                <input type="text" name="direccion_cli" required />
            </div>
            <div>
                <label for="num_telefono_cli">Numero de Telefono:</label>
                <input type="text" name="num_telefono_cli" required />
            </div>
            <button type="submit">Agregar Cliente</button>
        </form>
       </div>
    </div>
    <footer>
        <!-- Footer content here -->
    </footer>
</body>
</html>
