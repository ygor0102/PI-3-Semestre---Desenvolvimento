<%-- 
    Document   : Index
    Author     : Ygor Oliveira | Yasmim Candelária | Juan Dias
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/index.css">
        <title>Inicio</title>
    </head>
    <body>
        <c:import url="../Header.jsp"/>
       
    <center><header class ="container">
            <a href="VendaServlet"><h1><img src="../img/menu.png" alt ="Logo da LIS"></h1></a>
             <b><i>Usuário logado:</b> ${sessionScope.usuario.nome} - 
                     <b>Perfil:</b> ${sessionScope.usuario.perfil} - 
                     <b>Filial hierarquica: </b> ${sessionScope.usuario.filial}</i>
             <br><br>
            <nav class ="menu-opcoes">
                <ul>
                    <li> <a href="VendaServlet" style="color:white">Realizar vendas</a></li>
                    <li> <a href="ClienteServlet" style="color:white">Gerenciar clientes e produtos</a></li>
                    <li> <a href="Cadastro.jsp" style="color:white">Realizar cadastros</a></li>
                    <c:if test="${sessionScope.usuario.isGerente() || sessionScope.usuario.isAdmin()}">
                    <li> <a href="Admin_e_Gerente/RelatorioServlet" style="color:white">Extrair relatórios</a></li>
                    </c:if>
                </ul>
            </nav>
        </header>
        
        <i><a href="../LogoutServlet">Fazer logout...</a></i></center>
        <c:import url="../Footer.jsp"/>
    </body>
</html>
