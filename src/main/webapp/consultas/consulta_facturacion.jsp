<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="net.sf.jasperreports.engine.design.JasperDesign" %>
<%@ page import="net.sf.jasperreports.engine.xml.JRXmlLoader" %>
<%@ page import="net.sf.jasperreports.engine.*" %>
<%@ page import="net.sf.jasperreports.view.JasperViewer" %>        <%--
  Created by IntelliJ IDEA.
  User: nelson
  Date: 5/5/2024
  Time: 23:58
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/conexion.jsp" %>
<div class="">
    <table class="table table-striped table-bordered table-hover text-center"> <thead>
    <br>
    <br>
    <tr>
        <th>Id</th>
        <th>Nombre cliente</th>
        <th>Local</th>
        <th>Estado</th>
        <th>Direccion</th>
        <th>Aritsta</th>
        <th>Editar</th>
        <th>Eliminar</th>
        <th>Mas info</th>
    </tr>
    </thead>
        <tbody>
        <%
            st = conexion.prepareStatement("SELECT id_reserva AS ID, CONCAT (nombre_Usuario, ' ', apellido_Usuario) AS Cliente, nombre_Estado AS Estado, horario AS Horario,\n" +
                    "\t\tCONCAT(horas_reserva, ' Horas') AS Horas, distribucion, nombre_local AS 'Nombre del Local', direccion ,artista,\n" +
                    "\t\tdistribucion, CONCAT('$ ', precio_base) AS Precio, nombre_Equipo AS Equipo,\n" +
                    "\t\tCONCAT(capacidad, ' Personas') AS Capacidad\n" +
                    "\t\tFROM Reserva RS\n" +
                    "\t\tINNER JOIN Locales LO ON RS.id_local = LO.id_Locales\n" +
                    "\t\tLEFT JOIN Equipo EQ ON LO.id_equipo = EQ.id_Equipo\n" +
                    "\t\tINNER JOIN Usuarios US ON RS.id_usuario = US.id_Usuario\n" +
                    "\t\tINNER JOIN EstadoReserva ER ON RS.estado_reserva = ER.id_EstadoReserva;");
            rs = st.executeQuery();
            int idLocal = 0;
            while (rs.next()) {
                idLocal = rs.getInt("ID");
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
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal<%= idLocal %>" data-id="<%= idLocal %>">
                    Expandir
                </button>
                <%
                    try {   stModal = conexion.prepareStatement("SELECT id_reserva AS ID, CONCAT (nombre_Usuario, ' ', apellido_Usuario) AS Cliente, nombre_Estado AS Estado, horario AS Horario,\n" +
                            "\t\tCONCAT(horas_reserva, ' Horas') AS Horas, distribucion, nombre_local AS 'Nombre del Local', direccion ,artista,\n" +
                            "\t\tdistribucion, CONCAT('$ ', precio_base) AS Precio, nombre_Equipo AS Equipo,\n" +
                            "\t\tCONCAT(capacidad, ' Personas') AS Capacidad\n" +
                            "\t\tFROM Reserva RS\n" +
                            "\t\tINNER JOIN Locales LO ON RS.id_local = LO.id_Locales\n" +
                            "\t\tLEFT JOIN Equipo EQ ON LO.id_equipo = EQ.id_Equipo\n" +
                            "\t\tINNER JOIN Usuarios US ON RS.id_usuario = US.id_Usuario\n" +
                            "\t\tINNER JOIN EstadoReserva ER ON RS.estado_reserva = ER.id_EstadoReserva\n" +
                            "        WHERE id_reserva = ?;");
                        stModal.setInt(1, idLocal);
                    } catch (SQLException e) {
                        System.out.println("Error at: " + e);
                    }
                    stModal.setInt(1, idLocal);
                    rsModal = stModal.executeQuery();
                    while (rsModal.next())
                    {%>
                    <!-- Modal -->
                    <div class="modal fade" id="exampleModal<%= idLocal %>" tabindex="-1" aria-labelledby="exampleModal<%= idLocal %>" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Generacion de Factura para el consumidor: </h5>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-md-12 d-flex text-center">

                                            <div class="col-md-6">
                                            <span class="d-flex justify-content-around">
                                                <h6 class="fw-bold text-center">ID: </h6>
                                                <p class="text-center"><%= rsModal.getInt("ID") %></p>
                                            </span>
                                                <span class="d-flex justify-content-around">
                                                <h6 class="fw-bold">Cliente: </h6> <p><%=rsModal.getString("Cliente")%></p>
                                            </span>
                                                <span class="d-flex justify-content-around">
                                                <h6 class="fw-bold">Estado: </h6> <p><%=rsModal.getString("Estado")%></p>
                                            </span>
                                                <span class="d-flex justify-content-around">
                                                <h6 class="fw-bold">Horario: </h6> <p><%=rsModal.getString("Horario")%></p>
                                            </span>
                                                <span class="d-flex justify-content-around">
                                                <h6 class="fw-bold">Horas de renta: </h6> <p><%=rsModal.getString("Horas")%></p>
                                            </span>
                                                <span class="d-flex justify-content-around">
                                                <h6 class="fw-bold">Nombre del local: </h6> <p><%=rsModal.getString("Nombre del Local")%></p>
                                            </span>
                                            </div>
                                            <div class="col-md-6">
                                            <span class="d-flex justify-content-around">
                                                <h6 class="fw-bold text-center">Distribucion: </h6>
                                                <p class="text-center"><%=rsModal.getString("distribucion")%></p>
                                            </span>
                                                <span class="d-flex justify-content-around">
                                                <h6 class="fw-bold">Direccion: </h6> <p><%=rsModal.getString("direccion")%></p>
                                            </span>
                                                <span class="d-flex justify-content-around">
                                                <h6 class="fw-bold">Artista: </h6> <p><%=rsModal.getString("artista")%></p>
                                            </span>
                                                <span class="d-flex justify-content-between">
                                                <h6 class="fw-bold">Equipo: </h6> <p><%=rsModal.getString("Equipo")%></p>
                                            </span>
                                                <span class="d-flex justify-content-around">
                                                <h6 class="fw-bold">Capacidad del Local: </h6> <p><%=rsModal.getString("Capacidad")%></p>
                                            </span>
                                                <span class="d-flex justify-content-around">
                                                <h6 class="fw-bold">Monto a pagar: </h6></p>
                                            </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div>

                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                    <button type="button" class="btn btn-primary">
                                        <%
                                            try {
                                                JasperDesign design = JRXmlLoader.load("/reports/Factura.jrxml");
                                                JasperReport jasperReport = JasperCompileManager.compileReport(design);
                                                JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, st.getConnection());
                                                JasperViewer.viewReport(jasperPrint, false);
                                            } catch (JRException ex) {
                                                System.out.println("ERROR" +  ex);
                                            } catch (SQLException e) {
                                                System.out.println("sql ERROR: " + e);
                                            }
                                        %>
                                        Generar factura
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
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
                    <%}%>
            </td>
        </tr>
        <% }
            conexion.close();%>
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
