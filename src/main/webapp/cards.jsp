<%--
  Created by IntelliJ IDEA.
  User: nelson
  Date: 4/5/2024
  Time: 20:37
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="conexion.jsp" %>

<div class="container">
    <div class="row">
        <%
            st = conexion.prepareStatement("SELECT id_Locales, nombre_local, precio_base, descripccion, disponibilidad, direccion, capacidad, id_equipo FROM Locales");
            rs = st.executeQuery();
            while (rs.next()) {
                int idLocal = rs.getInt("id_Locales");
        %>
        <div class="col-md-3">
            <div class="card mb-4">
                <h5 class="card-header"> <%= rs.getString("nombre_local") %> </h5>
                <div class="card-body">
                    <h5 class="card-title"> <%= rs.getDouble("precio_base") %> </h5>
                    <p class="card-text"> <%= rs.getString("descripccion") %>.</p>
                    <a href="/vistas/reserva.jsp?id=<%= idLocal %>" class="btn btn-primary">Elegir local</a>
                </div>
            </div>
        </div>
        <%
            }
            conexion.close();
        %>
    </div>
</div>

