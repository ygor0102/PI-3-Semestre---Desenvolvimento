<%-- 
    Document   : index
    Created on : 15/04/2021, 20:39:25
    Author     : ygor.oliveira
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
    </head>
    <body>
        <c:import url="Header.jsp"/>
         <b><i>Bem-vindo ${sessionScope.usuario.nome}!</i></b>
         <i><a href="LogoutServlet">Logout</a></i>
        <header class ="container">
            <a href="VendaServlet"><h1><img src="img/menu.png" alt ="Logo da LIS"></h1></a>
            <nav class ="menu-opcoes">
                <ul>
                    <li> <a href="VendaServlet">Realizar vendas</a></li>
                    <li> <a href="ClienteServlet">Gerenciar clientes e produtos</a></li>
                    <li> <a href="Cadastro.jsp">Realizar cadastros</a></li>
                    <li> <a href="RelatorioServlet">Extrair relatórios</a></li>
                </ul>
            </nav>
        </header>
        <c:import url="Footer.jsp"/>
    </body>
</html>
