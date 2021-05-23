<%-- 
    Document   : AcessoNegado
    Created on : 22/05/2021, 17:38:36
    Author     : ygor.oliveira
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Erro</title>
    </head>
    <body>
        <h1>Você não tem permissão para acessar o recurso!</h1>
        <c:import url="Footer.jsp"/>
        <i><a href="LogoutServlet">Fazer logout...</a></i>
    </body>
</html>
