<%--
  Created by IntelliJ IDEA.
  User: nelso
  Date: 4/5/2024
  Time: 23:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ include file="/conexion.jsp" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fontawesome/4.7.0/css/fontawesome.min.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <title>Title</title>
</head>
<body>
<jsp:include page="/menu.jsp"/>
<br>
<br>
<br>
<div class="container">
    <h2>Reservaciones: </h2>
    <form role="form" action="${pageContext.request.contextPath}/controller.jsp" method="POST">
        <div class="col-md-12 d-flex" id="conten">

            <div class="col-md-6 p-3">
                <input type="hidden" name="id" id="ID">
                <input type="hidden" value="insertar" name="operacion" id="operacion">

                <div class="form-group mt-3">
                    <label class="mb-1" for="horario">Ingrese el horario de reserva:</label>
                    <div class="input-group">
                        <input type="text" class="form-control" name="horario" id="horario" placeholder="Ingrese el horario de reserva" required>
                    </div>
                </div>
                <div class="form-group mt-3">
                    <label class="mb-1" for="horas">Ingrese las horas a reservar:</label>
                    <div class="input-group">
                        <input type="text" class="form-control" name="horas" id="horas" placeholder="Ingrese las horas a reservar" required>
                    </div>
                </div>

                <div class="form-group mt-3">
                    <label class="mb-1" for="inicio">Ingrese la hora de Inicio:</label>
                    <div class="input-group">
                        <input type="time" class="form-control" name="inicio" id="inicio" placeholder="Ingrese las horas a reservar" required>
                    </div>
                </div>
                <div class="form-group mt-3">
                    <label class="mb-1" for="fin">Ingrese la hora de Finalización:</label>
                    <div class="input-group">
                        <input type="time" class="form-control" name="fin" id="fin" placeholder="Ingrese las horas a reservar" required>
                    </div>
                </div>

            </div>
            <div class="col-md-6 p-3">
                <div class="form-group mt-3">
                    <label for="local">Ingrese el equipo para la reserva:</label>
                    <div class="input-group">
                        <select name="local" id="local" class="form-control" required>
                            <%
                                int local = (Integer.parseInt(request.getParameter("id")));
                                st = conexion.prepareStatement("SELECT * FROM Locales WHERE id_Locales = ?");
                                st.setInt(1, local);
                                rs = st.executeQuery( );
                                while (rs.next( )) {
                            %>
                            <option
                                    value="<%=rs.getInt("id_Locales")%>">
                                <%=rs.getString("nombre_local")%>
                            </option>
                            <%}%>
                        </select>
                    </div>
                </div>

                <div class="form-group mt-3">
                    <label class="mb-1" for="artista">Ingrese el nombre del artista:</label>
                    <div class="input-group">
                        <input type="text" class="form-control" name="artista" id="artista" placeholder="Ingrese el nombre del artista" required>
                    </div>
                </div>
                <div class="form-group mt-3">
                    <label class="mb-1" for="distribucion">Ingrese la distribucion para el evento:</label>
                    <div class="input-group">
                        <input type="text" class="form-control" name="distribucion" id="distribucion" placeholder="Ingrese la distribucion para el evento" required>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 text-center">
                <br>
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
    <jsp:include page="/consulta.jsp"/>
</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
