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
        String equipo = request.getParameter("equipo");

        try {
            st = conexion.prepareStatement("INSERT INTO Equipo (nombre_Equipo) VALUES (?);");
            st.setString(1, equipo);

            st.executeUpdate();
            response.sendRedirect(request.getContextPath() + "/vistas/equipo.jsp?exito=si");

        } catch (SQLException e) {
            // Manejar la excepción de SQL
            e.printStackTrace();

        } catch (Exception e) {
            // Manejar otras excepciones
            e.printStackTrace();
        }

    } else if (operacion.equals("modificar")) {
        int id = Integer.parseInt(request.getParameter("id"));
        String equipo = request.getParameter("equipo");

        st = conexion.prepareStatement("UPDATE Equipo SET id_Equipo = ? WHERE id_Equipo = ?");
        st.setString(1, equipo);
        st.setInt(2, id);

        st.executeUpdate( );
        response.sendRedirect(request.getContextPath() + "/vistas/equipo.jsp?exito=si");
    }
    else if (operacion.equals("eliminar")) {
        int id = Integer.parseInt(request.getParameter("id"));
        st = conexion.prepareStatement("DELETE FROM Equipo WHERE id_Equipo = ?");
        st.setInt(1, id);
        st.executeUpdate( );
        response.sendRedirect(request.getContextPath() + "/vistas/equipo.jsp?exito=si");
    } else {
        response.sendRedirect(request.getContextPath() + "/vistas/equipo.jsp?exito=no");
    }%>
</body>
</html>

