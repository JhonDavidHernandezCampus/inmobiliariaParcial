<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="icon"
      href="./img/09cc414a7f9aaa6cea8b5bcdfd1d6b70.jpg"
      type="image/x-icon"
    />
    <link rel="stylesheet" type="text/css" href="./CSS/login/login.css">
    <title>Document</title>
  </head>
  <body>
    <div class="login-container">
      <div class="img-fondo">
        <img src="./img/09cc414a7f9aaa6cea8b5bcdfd1d6b70.jpg" alt="img" width="100px" height="100px" >
      </div>

        <h2>Iniciar Sesion</h2>
        <form action="./js/formulario/login.jsp" method="POST">
            <div>
                <label for="usuario">Usuario</label>
                <input type="text" required name="usuario" />
            </div>
            <div>
                <label for="idPassword">Contrasena</label>
                <input type="password" required name="idPassword" />
            </div>
            <button type="submit">Ingresar</button>
        </form>
        <% if (request.getParameter("error") != null && request.getParameter("error").equals("true")) { %>
            <div class="error-message">Usuario o contrasena incorrectos</div>
        <% } %>
    </div>
  </body>
</html>
