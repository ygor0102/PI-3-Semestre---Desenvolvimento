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
        <title>Menu</title>
    </head>
    <body>
        <header class ="container">
            <nav class ="menu-opcoes">
                <ul>
                    <li> <a href="index.jsp">Menu</a></li>
                    <li> <a href="VendaServlet">Realizar vendas</a></li>
                    <li> <a href="ClienteServlet">Gerenciar clientes e produtos</a></li>
                    <li> <a href="Cadastro.jsp">Realizar cadastros</a></li>
                    <c:if test="${sessionScope.usuario.isGerente() || sessionScope.usuario.isAdmin()}">
                    <li> <a href="Admin_e_Gerente/RelatorioServlet">Extrair relatórios</a></li>
                    </c:if>
                </ul>
            </nav>
        </header> 
    </body>
</html>
