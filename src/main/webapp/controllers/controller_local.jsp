<%--
  Created by IntelliJ IDEA.
  User: nelson
  Date: 5/5/2024
  Time: 23:52
--%>
<%@ include file="/conexion.jsp" %>
<html>
<body>

<%
    String operacion = request.getParameter("operacion");
    if (operacion.equals("insertar")) {

        String nombre = request.getParameter("nombre");
        String distribucion = request.getParameter("distribucion");
        Double precio = Double.parseDouble(request.getParameter("precio"));
        String descripccion = request.getParameter("descripcion");
        String disponibilidad = request.getParameter("disponibilidad");
        String direccion = request.getParameter("direccion");
        int capacidad = Integer.parseInt(request.getParameter("capacidad"));
        int equipo = Integer.parseInt(request.getParameter("equipo"));
        try {
            st = conexion.prepareStatement("INSERT INTO Locales (nombre_local, distribucion, precio_base, descripccion, disponibilidad, direccion, capacidad, id_equipo)\n" +
                    "\tVALUES (?, ?, ?, ?, ?, ?, ?, ?);");
            st.setString(1, nombre);
            st.setString(2, distribucion);
            st.setDouble(3, precio);
            st.setString(4, descripccion);
            st.setString(5, disponibilidad);
            st.setString(6, direccion);
            st.setInt(7, capacidad);
            st.setInt(8, equipo);

            st.executeUpdate();
            response.sendRedirect(request.getContextPath() + "/vistas/locales.jsp?exito=si");

        } catch (SQLException e) {
            // Manejar la excepción de SQL
            e.printStackTrace();

        } catch (Exception e) {
            // Manejar otras excepciones
            e.printStackTrace();
        }

    } else if (operacion.equals("modificar")) {
        int id = Integer.parseInt(request.getParameter("ID"));
        String nombre = request.getParameter("nombre");
        String distribucion = request.getParameter("distribucion");
        Double precio = Double.parseDouble(request.getParameter("precio"));
        String descripccion = request.getParameter("descripcion");
        String disponibilidad = request.getParameter("disponibilidad");
        String direccion = request.getParameter("direccion");
        int capacidad = Integer.parseInt(request.getParameter("capacidad"));
        int equipo = Integer.parseInt(request.getParameter("equipo"));

        st = conexion.prepareStatement("UPDATE Locales SET nombre_local = ?, distribucion = ?, precio_base = ?, descripccion = ?, disponibilidad = ?, direccion = ?, capacidad = ?, id_equipo = ? WHERE id_Locales = ?;");
        st.setString(1, nombre);
        st.setString(2, distribucion);
        st.setDouble(3, precio);
        st.setString(4, descripccion);
        st.setString(5, disponibilidad);
        st.setString(6, direccion);
        st.setInt(7, capacidad);
        st.setInt(8, equipo);
        st.setInt(9, id);
        st.executeUpdate( );
        response.sendRedirect(request.getContextPath() + "/vistas/locales.jsp?exito=si");
    }
    else if (operacion.equals("eliminar")) {
        int id = Integer.parseInt(request.getParameter("id"));
        st = conexion.prepareStatement("DELETE FROM Locales WHERE id_Locales = ? ");
        st.setInt(1, id);
        st.executeUpdate( );
        response.sendRedirect(request.getContextPath() + "/vistas/locales.jsp?exito=si");
    } else {
        response.sendRedirect(request.getContextPath() + "/vistas/locales.jsp?exito=no");
    }%>
</body>
</html>

