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
        <th>Nombre Local</th>
        <th>Precio</th>
        <th>Descripcion</th>
        <th>Disponibilidad</th>
        <th>Direccion</th>
        <th>Capacidad</th>
        <th>Equipo (opcional)</th>
        <th>Eliminar</th>
        <th>Modificar</th>
    </tr>
    </thead>
        <tbody>
        <%  st = conexion.prepareStatement("SELECT id_Locales AS ID, nombre_local AS 'Nombre del Local', precio_base AS Precio, descripccion, disponibilidad, direccion, capacidad, nombre_Equipo AS Equipo\n" +
                "\tFROM Locales LO\n" +
                "    LEFT JOIN Equipo EQ ON LO.id_equipo = EQ.id_Equipo");
            rs = st.executeQuery( );
            while (rs.next( )) { %>
        <tr>
            <td>
                <%=rs.getInt("ID")%>
            </td>
            <td>
                <%=rs.getString("Nombre del Local")%>
            </td>
            <td>
                <%=rs.getDouble("Precio")%>
            </td>
            <td>
                <%=rs.getString("descripccion")%>
            </td>
            <td>
                <%=rs.getString("disponibilidad")%>
            </td>
            <td>
                <%=rs.getString("direccion")%>
            </td>
            <td>
                <%=rs.getInt("capacidad")%>
            </td>
            <td>
                <%=rs.getString("Equipo")%>
            </td>
            <td>
                <button class="btn btn-danger" onclick="alerta('<%=rs.getInt("ID")%>')">
                    Eliminar
                </button>
            </td>
            <td>
                <button class="btn btn-info"
                        onclick="modificar('<%=rs.getInt("ID")%>',
                                '<%=rs.getString("Nombre del Local")%>',
                                '<%=rs.getDouble("Precio")%>',
                                '<%=rs.getString("descripccion")%>',
                                '<%= rs.getString("disponibilidad")%>',
                                '<%=rs.getString("direccion")%>',
                                '<%= rs.getInt("capacidad")%>',
                                '<%= rs.getString("Equipo")%>')">
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
            location.href ="/controllers/controller_local.jsp?operacion=eliminar&id="+id;
        }
    }
    function modificar(id, nombre, precio, descripcion, disponibilidad, direccion, capacidad, equipo) {
        document.getElementById("ID").value = id;
        document.getElementById("nombre").value = nombre;
        document.getElementById("precio").value = precio;
        document.getElementById("descripcion").value = descripcion;
        document.getElementById("disponibilidad").value = disponibilidad;
        document.getElementById("direccion").value = direccion;
        document.getElementById("capacidad").value = capacidad;
        document.getElementById("equipo").value = equipo;
        document.getElementById("operacion").value = "modificar";
        <%--
        hijo = document.getElementById("passhidden");
        padre = hijo.parentNode;
        padre.removeChild(hijo);
        --%>
    }
</script>