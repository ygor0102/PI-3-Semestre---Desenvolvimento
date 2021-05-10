<%-- 
    Document   : index
    Created on : 15/04/2021, 20:39:25
    Author     : ygor.oliveira
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
    </head>
    <body>
        <c:import url="Header.jsp"/>
        <header class ="container">
            <h1><img src="img/headPhone.png" alt ="Logo da LIS"></h1>
            <nav class ="menu-opcoes">
                <ul>
                    <li> <a href="VendaServlet">Realizar vendas</a></li>
                    <li> <a href="ClienteServlet">Gerenciar clientes e produtos</a></li>
                    <li> <a href="Cadastro.jsp">Realizar cadastros</a></li>
                    <li> <a href="RelatorioServlet">Extrair relatórios</a></li>
                </ul>
            </nav>
        </header> 
    </body>
</html>
