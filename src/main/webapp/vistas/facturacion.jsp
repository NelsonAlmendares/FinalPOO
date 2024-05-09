<%--
  Created by IntelliJ IDEA.
  User: nelson
  Date: 4/5/2024
  Time: 23:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ include file="/conexion.jsp" %>

<%
    HttpSession session_actual = request.getSession(false);
    String usuario = (String) session_actual.getAttribute("USER");
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fontawesome/4.7.0/css/fontawesome.min.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <title>Facturación</title>
</head>
<body>
<jsp:include page="/menu.jsp"/>
<br>
<br>
<br>
<div class="container">
    <form role="form" action="${pageContext.request.contextPath}/controller.jsp" method="POST">
        <div class="col-md-12" id="conten">

            <input type="hidden" name="id" id="ID">

            <input type="hidden" value="insertar" name="operacion" id="operacion">

            <div class="form-group">
                <label for="equipo">Estado de la reservacion:</label>
                <div class="input-group">
                    <select name="equipo" id="equipo" class="form-control" required>
                        <%
                            st = conexion.prepareStatement("SELECT * FROM EstadoReserva");
                            rs = st.executeQuery( );
                            while (rs.next( )) {
                        %>
                        <option
                                value="<%=rs.getInt("id_EstadoReserva")%>">
                            <%=rs.getString("nombre_Estado")%>
                        </option>
                        <%}%>
                    </select>
                </div>
            </div>


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
    <jsp:include page="/consultas/consulta_facturacion.jsp"/>
</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>

