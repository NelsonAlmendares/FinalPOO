<%--
  Created by IntelliJ IDEA.
  User: nelson
  Date: 1/5/2024
  Time: 18:34
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo.css">
</head>
<body class="container" >
<div id="login">
    <h1 class="text-center text-white pt-5">Universidad Don Bosco</h1>
    <div class="container">
        <div id="login-row" class="row justify-content-center align-items-center">
            <div id="login-column" class="col-md-6">
                <div id="login-box" class="col-md-12">
                    <form id="login-form" class="form" action="controller.jsp"
                          method="post">
                        <h3 class="text-center text-dark">Login</h3>
                        <div class="form-group mt-3">
                            <label for="username" class="text-dark">
                                Usuario:</label><br>
                            <input type="text" name="usuario" id="username"
                                   class="form-control">
                        </div>
                        <div class="form-group mt-3">
                            <label for="password" class="text-dark">Password:</label><br>
                            <input type="password" name="password" id="password" class="formcontrol">
                        </div>
                        <div class="form-group mt-3 text-center">
                            <input type="submit" name="operacion" class="btn btn-outline-success" value="logueo">
                            <input type="hidden" name="operacion" value="logueo">
                        </div>
                        <br>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>