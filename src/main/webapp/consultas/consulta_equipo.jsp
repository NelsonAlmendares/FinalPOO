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
        <th>Nombre del Equipo</th>
        <th>Eliminar</th>
        <th>Modificar</th>
    </tr>
    </thead>
        <tbody>
        <%  st = conexion.prepareStatement("SELECT id_Equipo AS ID, nombre_equipo AS 'Nombre del Equipo:' FROM Equipo");
            rs = st.executeQuery( );
            while (rs.next( )) { %>
        <tr>
            <td>
                <%=rs.getInt("ID")%>
            </td>
            <td>
                <%=rs.getString("Nombre del Equipo:")%>
            </td>
            <td>
                <button class="btn btn-danger" onclick="alerta('<%=rs.getInt("ID")%>')">
                    Eliminar
                </button>
            </td>
            <td>
                <button class="btn btn-info"
                        onclick="modificar('<%=rs.getInt("ID")%>',
                                '<%=rs.getString("Nombre del Equipo:")%>')">
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
            location.href ="/controllers/controller_equipo.jsp?operacion=eliminar&id="+id;
        }
    }
    function modificar(id, equipo) {
        document.getElementById("ID").value = id;
        document.getElementById("equipo").value = equipo;
    }
</script>
