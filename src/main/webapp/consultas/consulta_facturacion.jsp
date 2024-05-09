<%--
  Created by IntelliJ IDEA.
  User: nelson
  Date: 5/5/2024
  Time: 23:58
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/conexion.jsp" %>
<div class="">
    <table class="table table-striped table-bordered table-hover text-center"> <thead>
    <tr>
        <th>Id</th>
        <th>Nombre cliente</th>
        <th>Local</th>
        <th>Estado</th>
        <th>Direccion</th>
        <th>Aritsta</th>
        <th>Total</th>
        <th>Editar</th>
        <th>Eliminar</th>
        <th>Mas info</th>
    </tr>
    </thead>
        <tbody>
        <%
            st = conexion.prepareStatement("SELECT id_reserva AS ID, CONCAT (nombre_Usuario, ' ', apellido_Usuario) AS Cliente, nombre_Estado AS Estado, horario AS Horario, \n" +
                "\tCONCAT(horas_reserva, ' Horas') AS Horas, distribucion, nombre_local AS 'Nombre del Local', direccion ,artista, \n" +
                "    distribucion, CONCAT('$ ', precio_base) AS Precio, nombre_Equipo AS Equipo, CONCAT('$', precio_total) AS Cover, CONCAT('$ ', (precio_base + precio_total)) AS Total,\n" +
                "\tCONCAT(capacidad, ' Personas') AS Capacidad\n" +
                "\tFROM Reserva RS \n" +
                "    INNER JOIN Locales LO ON RS.id_local = LO.id_Locales\n" +
                "    LEFT JOIN Equipo EQ ON LO.id_equipo = EQ.id_Equipo\n" +
                "    INNER JOIN Usuarios US ON RS.id_usuario = US.id_Usuario\n" +
                "    INNER JOIN EstadoReserva ER ON RS.estado_reserva = ER.id_EstadoReserva;");
            rs = st.executeQuery( );
            while (rs.next( )) {
                int idLocal = rs.getInt("ID");
        %>
        <tr>
            <td>
                <%=rs.getInt("ID")%>
            </td>
            <td>
                <%=rs.getString("Cliente")%>
            </td>
            <td>
                <%=rs.getString("Nombre del Local")%>
            </td>
            <td>
                <%=rs.getString("Estado")%>
            </td>
            <td>
                <%=rs.getString("direccion")%>
            </td>
            <td>
                <%=rs.getString("artista")%>
            </td>
            <td>
                <%=rs.getString("Total")%>
            </td>
            <td>
                <button class="btn btn-warning" onclick="alerta('<%=rs.getInt("ID")%>')">
                    Editar
                </button>
            </td>

            <td>
                <button class="btn btn-danger" onclick="alerta('<%=rs.getInt("ID")%>')">
                    Eliminar
                </button>
            </td>
            <td>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Expandir
                    <% out.println(idLocal); %>
                </button>
            </td>
        </tr>
        <% } conexion.close( );%>
        </tbody>
    </table>
</div>

<%
    try {
        stModal = conexion.prepareStatement("SELECT id_reserva AS ID, CONCAT (nombre_Usuario, ' ', apellido_Usuario) AS Cliente, nombre_Estado AS Estado, horario AS Horario, \n" +
                "\tCONCAT(horas_reserva, ' Horas') AS Horas, distribucion, nombre_local AS 'Nombre del Local', direccion ,artista, \n" +
                "    distribucion, CONCAT('$ ', precio_base) AS Precio, nombre_Equipo AS Equipo, CONCAT('$', precio_total) AS Cover, CONCAT('$ ', (precio_base + precio_total)) AS Total,\n" +
                "\tCONCAT(capacidad, ' Personas') AS Capacidad\n" +
                "\tFROM Reserva RS INNER JOIN Locales LO ON RS.id_local = LO.id_Locales\n" +
                "    LEFT JOIN Equipo EQ ON LO.id_equipo = EQ.id_Equipo\n" +
                "    INNER JOIN Usuarios US ON RS.id_usuario = US.id_Usuario\n" +
                "    INNER JOIN EstadoReserva ER ON RS.estado_reserva = ER.id_EstadoReserva\n" +
                "    WHERE id_reserva = ?");
    } catch (SQLException e) { throw new RuntimeException(e); }
    stModal.setInt(1, 1);
    rsModal = stModal.executeQuery( );
    while (rsModal.next()) { }
%>

<script>
    $(document).ready(function() {
        $('#exampleModal').on('show.bs.modal', function(event) {
            var button = $(event.relatedTarget);
            var idLocal = button.data('id');
            // Hacer una petición AJAX para obtener los datos correspondientes al ID del local
            $.ajax({
                url: '/obtener-datos-local?id=' + idLocal,
                method: 'GET',
                success: function(response) {
                    // Actualizar el contenido del modal con los datos obtenidos
                    $('#exampleModal .modal-content').html(response);
                },
                error: function() {
                    console.log('Error al cargar los datos del local.');
                }
            });
        });
    });
</script>

<script>
    function alerta(id) {
        var mensaje;
        var opcion = confirm("Esta seguro de eliminar este registro");
        if (opcion == true) {
            location.href ="controller.jsp?operacion=eliminar&id="+id;
        }
    }
    function modificar(id, horario, horas, artista, distribucion, total) {
        document.getElementById("ID").value = id;
        document.getElementById("horario").value = horario;
        document.getElementById("horas").value = horas;
        document.getElementById("artista").value = artista;
        document.getElementById("distribucion").value = distribucion;
        document.getElementById("total").value = total;
        document.getElementById("operacion").value = "modificar";
    }
</script>
