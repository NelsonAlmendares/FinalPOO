<%--
  Created by IntelliJ IDEA.
  User: nelson
  Date: 1/5/2024
  Time: 19:17
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="conexion.jsp" %>
<div class="">
    <table class="table table-striped table-bordered table-hover"> <thead>
    <br>
    <tr>
        <th>Id</th>
        <th>Horario</th>
        <th>Horas</th>
        <th>Hora de Inicio</th>
        <th>Hora de Fin</th>
        <th>Artista</th>
        <th>Distribucion</th>
        <th>Cliente</th>
        <th>Local</th>
        <th>Eliminar</th>
        <th>Modificar</th>
    </tr>
    </thead>
        <tbody>
        <%  st = conexion.prepareStatement("SELECT id_reserva AS ID, horario, horas_reserva AS Horas, hora_inicio AS Inicio, hora_fin AS Fin, artista, distribucion, concat(nombre_usuario, '', apellido_usuario) AS Cliente,  nombre_local AS Reserva\n" +
                "\t\tFROM Reserva RS\n" +
                "\t\tINNER JOIN Usuarios US ON RS.id_usuario = US.id_Usuario\n" +
                "\t\tINNER JOIN Locales LO ON RS.id_local = LO.id_Locales;");
            rs = st.executeQuery( );
            while (rs.next( )) { %>
        <tr>
            <td>
                <%=rs.getInt("ID")%>
            </td>
            <td>
                <%=rs.getString("horario")%>
            </td>
            <td>
                <%=rs.getInt("Horas")%>
            </td>
            <td>
                <%=rs.getString("Inicio")%>
            </td>
            <td>
                <%=rs.getString("Fin")%>
            </td>
            <td>
                <%=rs.getString("artista")%>
            </td>
            <td>
                <%=rs.getString("distribucion")%>
            </td>
            <td>
                <%=rs.getString("Cliente")%>
            </td>
            <td>
                <%=rs.getString("Reserva")%>
            </td>
            <td>
                <button class="btn btn-danger" onclick="alerta('<%=rs.getInt("ID")%>')">
                Eliminar
                </button>
            </td>
            <td>
                <button class="btn btn-info"
                        onclick="modificar('<%=rs.getInt("ID")%>',
                                '<%=rs.getString("horario")%>',
                                '<%=rs.getInt("Horas")%>',
                                '<%=rs.getString("Inicio")%>',
                                '<%= rs.getString("Fin")%>',
                                '<%=rs.getString("artista")%>',
                                '<%= rs.getString("distribucion")%>',
                                '<%= rs.getString("Cliente")%>',
                                '<%= rs.getString("Reserva")%>')">
                    Modificar
                </button>
            </td>
        </tr>
        <% } conexion.close( );%>
        </tbody>
    </table>
</div>
<script>
    function alerta(id) {
        var mensaje;
        var opcion = confirm("Esta seguro de eliminar este registro");
        if (opcion == true) {
            location.href ="controller.jsp?operacion=eliminar&id="+id;
        }
    }
    function modificar(id, horario, horas, hora_inicio, hora_fin, artista, distribucion, cliente, local) {
        document.getElementById("ID").value = id;
        document.getElementById("horario").value = horario;
        document.getElementById("horas").value = horas;
        document.getElementById("inicio").value = artista;
        document.getElementById("fin").value = distribucion;
        document.getElementById("local").value = horas;
        document.getElementById("artista").value = artista;
        document.getElementById("distribucion").value = distribucion;
        document.getElementById("operacion").value = "modificar";
        <%--
        hijo = document.getElementById("passhidden");
        padre = hijo.parentNode;
        padre.removeChild(hijo);
        --%>
    }
</script>
