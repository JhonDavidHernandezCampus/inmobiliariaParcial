
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <meta name="Description" content="Enter your description here" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
    />
    <link rel="stylesheet" href="./../css/global.css" />
    <link rel="stylesheet" href="assets/css/style.css" />
    <title>Title</title>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
    />
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  </head>
  <body>
    <div class="row">
      <div class="col-3 p-1 bg-secondary">
        <div class="">
          <h1 class="w-100 text-center mr-20">
            <button
              onclick="window.location.href='./../../index.html'"
              class="btn rounded-circle"
            >
              <img
                src="./../../img/atas.png"
                width="50px"
                height="50px"
                alt=""
              /></button
            >Ejercicios
          </h1>
        </div>
                   <div class="d-flex align-items-center flex-column spacing-2">
                   <button type="button" onclick="window.location.href='./../../corte1/formulario.html'" class="btn btn-warning w-50 m-1">Formulario</button>
                <button type="button" onclick="window.location.href='./../../corte1/ejercicio1.jsp'" class="btn btn-info w-50 m-1">Ejercicio 1</button>
                <button type="button" onclick="window.location.href='./../../corte1/ejercicio2.jsp'" class="btn btn-info w-50 m-1">Ejercicio 2</button>
                <button type="button" onclick="window.location.href='./../../corte1/ejercicio3.jsp'" class="btn btn-info w-50 m-1">Ejercicio 3</button>
                <button type="button" onclick="window.location.href='./../../corte1/ejercicio4.html'" class="btn btn-info w-50 m-1">Ejercicio 4</button>
                <button type="button" onclick="window.location.href='./../../corte1/ejercicio5.html'" class="btn btn-info w-50 m-1">Ejercicio 5</button>
                <button type="button" onclick="window.location.href='./../../corte1/ejercicio6.html'" class="btn btn-info w-50 m-1">Ejercicio 6</button>
                <button type="button" onclick="window.location.href='./../../corte1/ejercicio7.html'" class="btn btn-info w-50 m-1">Ejercicio 7</button>
                <button type="button" onclick="window.location.href='./../../corte1/ejercicio8.html'" class="btn btn-info w-50 m-1">Ejercicio 8</button>
                <button type="button" onclick="window.location.href='./../../corte1/ejercicio9.html'" class="btn btn-info w-50 m-1">Ejercicio 9</button>
                <button type="button" onclick="window.location.href='./../../corte1/ejercicio10.jsp'" class="btn btn-info w-50 m-1">Ejercicio 10</button>
                <button type="button" onclick="window.location.href='./../../corte1/ejercicio11.html'" class="btn btn-info w-50 m-1">Ejercicio 11</button>
                <button type="button" onclick="window.location.href='./../../corte1/ejercicio12.html'" class="btn btn-info w-50 m-1">Ejercicio 12</button>
                <button type="button" onclick="window.location.href='./../../corte1/ejercicio13.html'" class="btn btn-info w-50 m-1">Ejercicio 13</button>
                <button type="button" onclick="window.location.href='./../../corte1/ejercicio14.html'" class="btn btn-info w-50 m-1">Ejercicio 14</button>
                <button type="button" onclick="window.location.href='./../../corte1/ejercicio15.html'" class="btn btn-info w-50 m-1">Ejercicio 15</button>
                <button type="button" onclick="window.location.href='./../../corte1/ejercicio16.html'" class="btn btn-info w-50 m-1">Ejercicio 16</button>
            </div>
      </div>
      <div class="col-9 p-0">
        <div class="jumbotron text-center">
          <h1>Los usuarios actuales son</h1>
          <p>listado de todos los usuarios de la base de datos</p>
        </div>
        <div class="table-responsive">
  <table class="table table-striped table-bordered">
    <thead class="thead-dark">
      <tr>
        <th>CC</th>
        <th>Nombre</th>
        <th>Apellido</th>
        <th>Sexo</th>
        <th>Email</th>
        <th>Poblacion</th>
        <th>Descripcion</th>
        <th>Condiciones</th>
        <th>Acciones</th>
      </tr>
    </thead>
    <tbody>
      <% 
      Connection conexion=null;
      Statement  sentencia=null;
      ResultSet rs=null;
      try  {
      
        Class.forName("org.postgresql.Driver");
        String password = "12345";
        String nameDataBase = "formulario";
        String localhost = "localhost";
        String puerto = "5432";
        String userName = "postgres";
  
        conexion = DriverManager.getConnection(
          "jdbc:postgresql://"+localhost+":"+puerto+"/"+nameDataBase+"",userName,password);
        sentencia= conexion.createStatement();
  
        String consultaSQL=  "select ced, Nom, Apell, Sexo, Corr, Pobla, Descripcion, Cond from form";
  
        rs=sentencia.executeQuery(consultaSQL);
  
        while(rs.next()) { 
        %>
        <tr>
          <td><%= rs.getString("ced") %></td>
          <td><%= rs.getString("Nom") %></td>
          <td><%= rs.getString("Apell") %></td>
          <td><%= rs.getString("Sexo") %></td>
          <td><%= rs.getString("Corr") %></td>
          <td><%= rs.getString("Pobla") %></td>
          <td><%= rs.getString("Descripcion") %></td>
          <td><%= rs.getString("Cond") %></td>
          <td class="d-flex flex-column gap-2 p-2">
          <form action="actualizar.jsp" method="post">
            <input type="hidden" name="identificacion" value=<%= rs.getString("ced") %> />
            <input type='submit' class="btn btn-primary w-100" value='Editar'/>
          </form>
          <form action="eliminar.jsp" method="post">
            <input type="hidden" name="identificacion" value=<%= rs.getString("ced") %> />
            <input type='submit' class="btn btn-danger w-100"value='Eliminar' />
          </form>
            
          </td>
        </tr>
        <% 
        }
      }catch (ClassNotFoundException e) {
        out.println("Error en la carga del driver" 
                  + e.getMessage());
      }catch (SQLException e) {
        out.println("Error accediendo a la base de datos" 
                  + e.getMessage());
      }
       finally {
        if (rs != null) {
          try {rs.close();} catch (SQLException e)
          {out.println("Error cerrando el resultset" + e.getMessage());}
        }
        if (sentencia != null) {
          try {sentencia.close();} catch (SQLException e) 
          {out.println("Error cerrando la sentencia" + e.getMessage());}
        }
        if (conexion != null) {
          try {conexion.close();} catch (SQLException e) 
          {out.println("Error cerrando la conexion" + e.getMessage());}
        }
       }
      %>
    </tbody>
  </table>
</div>
      </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.2/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.1.0/js/bootstrap.min.js"></script>
  </body>
</html>
