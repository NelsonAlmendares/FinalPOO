<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Connection conexion =null;
    //private Statement s =null;
    ResultSet rs= null;
    PreparedStatement st =null;

    ResultSet rsModal = null;
    PreparedStatement stModal = null;
    // Se obtiene una conexión con la base de datos.
    Class.forName("com.mysql.jdbc.Driver");
    conexion =
            DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/reservaciones",
                    "NelsonAlmendares", "Nelson@1402");
    String valor;
%>
