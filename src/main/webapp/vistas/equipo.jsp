<%--
  Created by IntelliJ IDEA.
  User: nelson
  Date: 4/5/2024
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/conexion.jsp" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fontawesome/4.7.0/css/fontawesome.min.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <title>Registro de Equipos</title>
</head>
<body>
<jsp:include page="/menu.jsp"/>
<br>
<br>
<br>
<div class="container">
    <h2>Registro de Equipo</h2>
    <br>
    <form role="form" action="/controllers/controller_equipo.jsp" method="POST">
        <div class="col-md-12" id="conten">

            <input type="hidden" name="id" id="ID">

            <input type="hidden" value="insertar" name="operacion" id="operacion">

            <div class="form-group">
                <label for="equipo">Ingresa el nombre del equipo a registrar:</label>
                <div class="input-group">
                    <input type="text" class="form-control" name="equipo" id="equipo" placeholder="Equipo a registrar: " required>
                </div>
            </div>

            <br>
            <br>
            <div style="margin-left: 30%;">
                <input type="submit" class="btn btn-success col-md-6 " value="Guardar">
            </div>
        </div>
    </form>

    <%
        if(request.getParameter("exito") != null){
            out.println("<div class='alert alert-success' role='alert'>Operacion realizada con exito</div>");
        }
    %>
    <!--notese el uso de jsp:include -->
    <jsp:include page="/consultas/consulta_equipo.jsp"/>
</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
