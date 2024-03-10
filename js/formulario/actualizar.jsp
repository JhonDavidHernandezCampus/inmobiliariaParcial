<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.*" %>
<%
String ced = request.getParameter("identificacion");
Connection conexion = null;
Statement sentencia = null;
ResultSet respuesta = null;
%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <meta name="Description" content="Enter your description here" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
  <link rel="stylesheet" href="./../css/global.css" />
  <link rel="stylesheet" href="assets/css/style.css" />
  <title>Title</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
  <div class="row">
    <div class="col-3 p-1 bg-secondary">
      <div class="">
        <h1 class="w-100 text-center mr-20">
          <button onclick="window.location.href='./../../index.html'" class="btn rounded-circle">
            <img src="./../../img/atas.png" width="50px" height="50px" alt="" /></button>Ejercicios
        </h1>
      </div>
      <div class="d-flex align-items-center flex-column spacing-2">
        <button type="button" onclick="window.location.href='./../../corte1/formulario.html'" class="btn btn-warning w-50 m-1">
          Formulario
        </button>
        <button type="button" onclick="window.location.href='./../../corte1/ejercicio1.jsp'" class="btn btn-info w-50 m-1">
          Ejercicio 1
        </button>
        <button type="button" onclick="window.location.href='./../../corte1/ejercicio2.jsp'" class="btn btn-info w-50 m-1">
          Ejercicio 2
        </button>
        <button type="button" onclick="window.location.href='./../../corte1/ejercicio3.jsp'" class="btn btn-info w-50 m-1">
          Ejercicio 3
        </button>
        <button type="button" onclick="window.location.href='./../../corte1/ejercicio4.html'" class="btn btn-info w-50 m-1">
          Ejercicio 4
        </button>
        <button type="button" onclick="window.location.href='./../../corte1/ejercicio5.html'" class="btn btn-info w-50 m-1">
          Ejercicio 5
        </button>
        <button type="button" onclick="window.location.href='./../../corte1/ejercicio6.html'" class="btn btn-info w-50 m-1">
          Ejercicio 6
        </button>
        <button type="button" onclick="window.location.href='./../../corte1/ejercicio7.html'" class="btn btn-info w-50 m-1">
          Ejercicio 7
        </button>
        <button type="button" onclick="window.location.href='./../../corte1/ejercicio8.html'" class="btn btn-info w-50 m-1">
          Ejercicio 8
        </button>
        <button type="button" onclick="window.location.href='./../../corte1/ejercicio9.html'" class="btn btn-info w-50 m-1">
          Ejercicio 9
        </button>
        <button type="button" onclick="window.location.href='./../../corte1/ejercicio10.jsp'" class="btn btn-info w-50 m-1">
          Ejercicio 10
        </button>
        <button type="button" onclick="window.location.href='./../../corte1/ejercicio11.html'" class="btn btn-info w-50 m-1">
          Ejercicio 11
        </button>
        <button type="button" onclick="window.location.href='./../../corte1/ejercicio12.html'" class="btn btn-info w-50 m-1">
          Ejercicio 12
        </button>
        <button type="button" onclick="window.location.href='./../../corte1/ejercicio13.html'" class="btn btn-info w-50 m-1">
          Ejercicio 13
        </button>
        <button type="button" onclick="window.location.href='./../../corte1/ejercicio14.html'" class="btn btn-info w-50 m-1">
          Ejercicio 14
        </button>
        <button type="button" onclick="window.location.href='./../../corte1/ejercicio15.html'" class="btn btn-info w-50 m-1">
          Ejercicio 15
        </button>
        <button type="button" onclick="window.location.href='./../../corte1/ejercicio16.html'" class="btn btn-info w-50 m-1">
          Ejercicio 16
        </button>
      </div>
    </div>
    <div class="col-9 p-0">
      <div class="jumbotron text-center">
        <h1>Ejercicio 1</h1>
        <p>En este Formulario manipulamos los datos de una base de datos</p>
      </div>
        <h5 class="w-100 text-center">Editar el usuario con el id <% out.println(ced); %></h5>
      <div class="d-flex w-100 justify-content-center">
<%
	try {

		Class.forName("org.postgresql.Driver");
        String password = "12345";
        String nameDataBase = "formulario";
        String localhost = "localhost";
        String puerto = "5432";
        String userName = "postgres";

	    conexion = DriverManager.getConnection(
				"jdbc:postgresql://"+localhost+":"+puerto+"/"+nameDataBase+"",userName,password);

		sentencia = conexion.createStatement();

		String consultaSQL = "SELECT * FROM form WHERE ced = '" +ced+ "'";
	
		respuesta = sentencia.executeQuery(consultaSQL);
        System.out.println(respuesta);
		if(respuesta.next()){
            String nombre = respuesta.getString("Nom");
            String apellido = respuesta.getString("Apell");
            String sexo = respuesta.getString("Sexo");
            String correo = respuesta.getString("Corr");
            String poblacion = respuesta.getString("Pobla");
            String descripcion = respuesta.getString("Descripcion");
            String condiciones = respuesta.getString("Cond");


        %> 
        
        <form action="actualizar-db.jsp" method="post" class="container w-50">
         <div class="form-group">
    <label for="identificacion">Identificacion:</label>
    <input type="text" name="identificacion" readonly value="<%=ced %>" class="form-control" maxlength="50" />
  </div>
  <div class="form-group">
    <label for="nombre">Nombre:</label>
    <input type="text" name="nombre" value="<%=nombre %>" class="form-control" maxlength="50" />
  </div>
  <div class="form-group">
    <label for="apellido">Apellidos:</label>
    <input type="text" name="apellido" value="<%=apellido%>" class="form-control" maxlength="50" />
  </div>
  <div class="form-group">
    <label>Sexo:</label><br>
    <div class="form-check form-check-inline">
      <input type="radio" name="sexo" value="hombre" <% if(sexo.equals("hombre")) out.print("checked"); %> class="form-check-input">
      <label class="form-check-label">Hombre</label>
    </div>
    <div class="form-check form-check-inline">
      <input type="radio" name="sexo" value="mujer" <%  if(sexo.equals("mujer")) out.print("checked"); %> class="form-check-input">
      <label class="form-check-label">Mujer</label>
    </div>
  </div>
  <div class="form-group">
    <label for="email">Correo:</label>
    <input type="text" name="email" value="<%=correo%>" class="form-control" />
  </div>
  <div class="form-group">
    <label for="poblacion">Poblacion:</label>
    <select name="poblacion" class="form-control">
      <option value="Bucaramanga">Bucaramanga</option>
      <option value="Giron">Giron</option>
      <option value="Piedecuesta">Piedecuesta</option>
      <option value="Florida">Florida</option>
    </select>
  </div>
  <div class="form-group">
    <label for="descripcion">Descripcion:</label>
    <textarea name="descripcion" rows="3" class="form-control"><%=descripcion %></textarea>
  </div>
  <div class="form-check">
    <input type="checkbox" name="condiciones" required class="form-check-input">
    <label class="form-check-label">Acepto terminos y condiciones</label>
  </div>
  <button type="submit" class="btn btn-primary mt-3">Enviar</button>
</form>
        <%
        }

	} catch (ClassNotFoundException e) {
		out.println("Error en la carga del driver"
				+ e.getMessage());
	} catch (SQLException e) {
		out.println("Error accediendo a la base de datos"
				+ e.getMessage());
	} finally {
		if (sentencia != null) {
			try {sentencia.close();} 
			catch (SQLException e) 
			{out.println("Error cerrando la sentencia" +
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
    </div>
  </div>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.2/umd/popper.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.1.0/js/bootstrap.min.js"></script>
</body>

</html>