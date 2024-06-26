<%--
  Created by IntelliJ IDEA.
  User: nelso
  Date: 1/5/2024
  Time: 19:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession session_actual = request.getSession(false);
    String usuario = (String) session_actual.getAttribute("USER");
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" role="navigation">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">Gestion de Reservas</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="${pageContext.request.contextPath}/index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="equipos" href="/vistas/equipo.jsp">Equipos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="locales" href="/vistas/locales.jsp">Locales</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="reservas" href="/vistas/facturacion.jsp" aria-disabled="true">Reservas</a>
                </li>
            </ul>
        </div>
        <button class="navbar-toggler border-0" type="button" data-toggle="collapse" datatarget="#exCollapsingNavbar"> &#9776;
        </button>
        <div class="collapse navbar-collapse d-flex flex-row-reverse" id="exCollapsingNavbar">
            <ul class="nav navbar-nav">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fa fauser"></i> <%=usuario%>
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <a class="dropdown-item" href="login.jsp">
                                <i class="fa fa-sign-out"></i> Logout</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<script type="text/javascript">
    // Espera a que el DOM esté completamente cargado
    document.addEventListener("DOMContentLoaded", function() {
        // Verifica si el usuario ha iniciado sesión
        var isLoggedIn = <%= session.getAttribute("isLoggedIn") %>;
        var tipoUsuario = <%= session.getAttribute("tipoUsuario") %>;

        if (isLoggedIn && tipoUsuario) {
            if (tipoUsuario === 2) {
                document.getElementById("elementoAdmin").style.display = "block";
            } else if (tipoUsuario === 1) {
                document.getElementById("equipos").style.display = "none";
                document.getElementById("locales").style.display = "none";
                document.getElementById("reservas").style.display = "none";
            } else if (tipoUsuario === 3) {
                document.getElementById("elementoUsuario").style.display = "block";
            }
        }
    });
</script>
