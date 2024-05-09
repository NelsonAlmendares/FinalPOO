<%--
  Created by IntelliJ IDEA.
  User: nelson
  Date: 1/5/2024
  Time: 19:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ include file="conexion.jsp" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    HttpSession session_actual = request.getSession(false);
    String user = (String) session_actual.getAttribute("USER");
%>
<%
    // Código para obtener el ID del usuario
    st = conexion.prepareStatement("SELECT id_Usuario FROM Usuarios WHERE acceso_Usuario = ?");
    int idUsuario = 0;
    try {
        st.setString(1, user);
        rs = st.executeQuery();

    } catch (SQLException e) {
        System.out.println("Error" + e);
    }
%>

<%
    String operacion = request.getParameter("operacion");
    if (operacion.equals("salir")) {
        session_actual.setAttribute("USER", null);
        session_actual.setAttribute("NAME", null);
        response.sendRedirect("login.jsp");
    } else if (operacion.equals("logueo")) {

        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");
        try {
            st = conexion.prepareStatement(
                    "select count(acceso_Usuario),nombre_Usuario,tipo_Usuario from Usuarios where acceso_Usuario = ? and contrasena_Usuario=SHA2(?,256) ");
            st.setString(1, usuario);
            st.setString(2, password);
            rs = st.executeQuery( );
            rs.next( );
            if (rs.getInt(1) == 1) { //solo una coincidencia es permitida

                // Seleccionamos el tipo de Usuario con el que se ha hecho el Login
                int tipoUsuario = rs.getInt("tipo_Usuario");

                // Asignamos los atributos apartir de la sesion
                session.setAttribute("isLoggedIn", true);
                session.setAttribute("tipoUsuario", tipoUsuario);

                session_actual.setAttribute("USER", usuario);
                session_actual.setAttribute("NAME", rs.getString(2));
                response.sendRedirect("index.jsp");

            } else {
                response.sendRedirect("login.jsp");
            }
            rs.close( );
            conexion.close( );
        } catch (SQLException throwables) {
            throwables.printStackTrace( );
        }
    } else if (operacion.equals("insertar")) {
        String horario = request.getParameter("horario");
        int horas = Integer.parseInt(request.getParameter("horas"));
        String inicio = request.getParameter("inicio");
        String fin = request.getParameter("fin");
        String artista = request.getParameter("artista");
        int local = Integer.parseInt(request.getParameter("local"));

        try {
            st = conexion.prepareStatement("INSERT INTO Reserva (horario, horas_reserva, hora_inicio , hora_fin, artista, estado_reserva, id_usuario, id_local)\n" +
                    "\tVALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            st.setString(1, horario);
            st.setInt(2, horas);
            st.setString(3, inicio);
            st.setString(4, fin);
            st.setString(5, artista);
            st.setDouble(6, 1);
            int get_user = 0;
            if (rs.next()) { get_user = rs.getInt("id_Usuario");}
            st.setInt(7, get_user);
            // Traemos el ID del local seleccionado
            st.setInt(8, local);
            st.executeUpdate();
            response.sendRedirect(request.getContextPath() + "/vistas/reserva.jsp?exito=si");

        } catch (SQLException e) {
            // Manejar la excepción de SQL
            e.printStackTrace(); // Imprimir la traza de la excepción para diagnóstico
        } catch (Exception e) {
            // Manejar otras excepciones
            e.printStackTrace(); // Imprimir la traza de la excepción para diagnóstico
            response.sendRedirect("index.jsp?exito=no&error=" + e.getMessage());
        } finally {
            // Cerrar recursos
            try {
                if (st != null) {
                    st.close();
                }
            } catch (SQLException e) {
                e.printStackTrace(); // Imprimir la traza de la excepción para diagnóstico
            }
        }

    } else if (operacion.equals("modificar")) {
        String horario = request.getParameter("horario");
        int horas = Integer.parseInt(request.getParameter("horas"));
        String inicio = request.getParameter("inicio");
        String fin = request.getParameter("fin");
        String artista = request.getParameter("artista");
        int local = Integer.parseInt(request.getParameter("local"));

        st = conexion.prepareStatement(
                "UPDATE Reserva \n" +
                        "\tSET horario = ?,\n" +
                        "\t\thoras_reserva = ?,\n" +
                        "artista = ?,\n" +
                        "distribucion = ?,\n" +
                        "precio_total = ?\n" +
                        "\tWHERE id_reserva = ?;");
        st.setString(1,horario);
        st.setInt(2, horas);
        st.setString(3, artista);
        st.executeUpdate( );
        response.sendRedirect(request.getContextPath() + "/vistas/reserva.jsp?exito=si");
    }else if (operacion.equals("eliminar")) {
        int id = Integer.parseInt(request.getParameter("id"));
        st = conexion.prepareStatement("DELETE FROM Reserva WHERE id_reserva = ? ");
        st.setInt(1, id);
        st.executeUpdate( );
        response.sendRedirect(request.getContextPath() + "/vistas/reserva.jsp?exito=si");
    }%>
</body>
</html>
