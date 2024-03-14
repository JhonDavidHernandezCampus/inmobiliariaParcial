<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.*" %>
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
    <title>Editar Informacion del Cliente</title>
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

                String consultaMysql = "SELECT * FROM clientes WHERE correo_cli = ?";
                ps = conexion.prepareStatement(consultaMysql);
                ps.setString(1,usuario);

                rs = ps.executeQuery();
               //  System.out.println(rs.next());

                // response.sendRedirect("mostrar.jsp");
                if(rs.next()){
                    String id_cli = rs.getString("id_cli");
                    String pnombre_cli= rs.getString("pnombre_cli");
                    String snombre_cli = rs.getString("snombre_cli");
                    String papellido_cli = rs.getString("papellido_cli");
                    String sapellido_cli = rs.getString("sapellido_cli");
                    String correo_cli = rs.getString("correo_cli");
                    String direccion_cli = rs.getString("direccion_cli");
                    String num_telefono_cli = rs.getString("num_telefono_cli");
                    String estado_civil_cli= rs.getString("estado_civil_cli");

                %> 

                <div class="formulario">
                <h2>Editar Informacion del Cliente</h2>
                <form action="./guardarEdicionCliente.jsp" method="POST" class='formulario'>
                    <div>
                        <label for="id_cli">Id:</label>
                        <input type="text" readonly name="id_cli" value="<%= id_cli %>" />
                    </div>
                    <div>
                        <label for="correo_cli">Correo Electronico:</label>
                        <input type="email" readonly name="correo_cli" value="<%= correo_cli %>" />
                    </div>
                    <div>
                        <label for="snombre_cli">Segundo Nombre:</label>
                        <input type="text" readonly name="snombre_cli" value="<%= snombre_cli %>" />
                    </div>
                    <div>
                        <label for="papellido_cli">Primer Apellido:</label>
                        <input type="text" name="papellido_cli" value="<%= papellido_cli %>" />
                    </div>
                    <div>
                        <label for="sapellido_cli">Segundo Apellido:</label>
                        <input type="text" name="sapellido_cli" value="<%= sapellido_cli %>" />
                    </div>
                    <div>
                        <label for="estado_civil_cli">Estado Civil:</label>
                        <input type="text" name="estado_civil_cli" value="<%= estado_civil_cli %>" />
                    </div>
                    <div>
                        <label for="direccion_cli">Direccion:</label>
                        <input type="text" name="direccion_cli" value="<%= direccion_cli %>" />
                    </div>
                    <div>
                        <label for="num_telefono_cli">Numero de Telefono:</label>
                        <input type="text" name="num_telefono_cli" value="<%= num_telefono_cli %>" />
                    </div>
                    <button type="submit">Guardar Cambios</button>
                </form>
               </div>
                <%
                }   

        	} catch (ClassNotFoundException e) {
        		out.println("Error en la carga del driver"
        				+ e.getMessage());
        	} catch (SQLException e) {
        		out.println("Error accediendo a la base de datos"
        				+ e.getMessage());
        	} finally {
        		if (ps != null) {
        			try {ps.close();} 
        			catch (SQLException e) 
        			{out.println("Error cerrando el PreparedStatement" +
        					e.getMessage());}
        		}
        		if (rs != null) {
        			try {rs.close();}
        			catch (SQLException e) 
        			{out.println("Error cerrando el ResultSet" +
        					e.getMessage());}
        		}
        		if (conexion != null) {
        			try {conexion.close();}
        			catch (SQLException e) 
        			{out.println("Error cerrando la conexion" +
        					e.getMessage());}
        		}
        	}
        %>
    </div>
    <footer>
        <!-- Footer content here -->
    </footer>
</body>
</html>
