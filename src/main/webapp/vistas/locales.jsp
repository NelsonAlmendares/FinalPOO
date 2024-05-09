<%--
  Created by IntelliJ IDEA.
  User: nelso
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
    <title>Registro de locales</title>
</head>
<body>
<jsp:include page="/menu.jsp"/>
<br>
<br>
<br>
<div class="container">
    <h2>Reserva de Locales</h2>
    <br>
    <form role="form" action="/controllers/controller_local.jsp" method="POST">
        <div class="col-md-12 d-flex" id="conten">
            <div class="col-md-6 p-3">
                <input type="hidden" name="ID" id="ID">
                <input type="hidden" value="insertar" name="operacion" id="operacion">
                <div class="form-group mt-3">
                    <label for="nombre">Ingrese nombre del local:</label>
                    <div class="input-group">
                        <input type="text" class="form-control" name="nombre" id="nombre" placeholder="Nombre del local: " required>
                    </div>
                </div>
                <div class="form-group mt-3">
                    <label for="precio">Ingrese el precio del local:</label>
                    <div class="input-group">
                        <input type="number" class="form-control" name="precio" id="precio" placeholder="Ingrese las horas a reservar" required>
                    </div>
                </div>
                <div class="form-group mt-3">
                    <label for="descripcion">Ingresa la descripcion del Local:</label>
                    <div class="input-group">
                        <input type="text" class="form-control" name="descripcion" id="descripcion" placeholder="Descripcion del Local" required>
                    </div>
                </div>
                <div class="form-group mt-3">
                    <label for="disponibilidad">Ingrese la Disponibilidad:</label>
                    <div class="input-group">
                        <input type="text" class="form-control" name="disponibilidad" id="disponibilidad" placeholder="Dispobibilidad: " required>
                    </div>
                </div>
            </div>
            <div class="col-md-6 p-3">
                <div class="form-group mt-3">
                    <label for="direccion">Ingrese la Direccion:</label>
                    <div class="input-group">
                        <input type="text" class="form-control" name="direccion" id="direccion" placeholder="Dispobibilidad: " required>
                    </div>
                </div>
                <div class="form-group mt-3">
                    <label for="capacidad">Capacidad de personas:</label>
                    <div class="input-group">
                        <input type="number" class="form-control" name="capacidad" id="capacidad" placeholder="Personas que se pueden almacenar: " required>
                    </div>
                </div>

                <div class="form-group mt-3">
                    <label for="equipo">Ingrese el equipo para la reserva:</label>
                    <div class="input-group">
                        <select name="equipo" id="equipo" class="form-control" required>
                            <%
                                st = conexion.prepareStatement("SELECT * FROM Equipo");
                                rs = st.executeQuery( );
                                while (rs.next( )) {
                            %>
                            <option
                                    value="<%=rs.getInt("id_Equipo")%>">
                                    <%=rs.getString("nombre_Equipo")%>
                            </option>
                            <%}%>
                        </select>
                    </div>
                </div>

            </div>
        </div>
        <div class="row">
            <div class="col-md-12 text-center">
                <input type="submit" style="width: 300px" class="btn btn-success col-md-6 " value="Guardar">
            </div>
        </div>
    </form>

    <%
        if(request.getParameter("exito") != null){
            out.println("<div class='alert alert-success' role='alert'>Operacion realizada con exito</div>");
        }
    %>

    <!--notese el uso de jsp:include -->
    <jsp:include page="/consultas/consulta_local.jsp"/>
</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
