<%-- 
    Document   : RelatorioFiliais
    Created on : 09/05/2021, 22:22:16
    Author     : ygor.oliveira
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reporte Filiais</title>
    </head>
    <body>
        <c:import url="Header.jsp"/>
         <nav class ="menu-opcoes">
                <ul>
                    <li> <a href="index.jsp">Menu</a></li>
                    <li> <a href="RelatorioServlet">Reporte Sintético</a></li>
                    <li> <a href="RelatorioAnaliticoServlet">Reporte Analítico</a></li>
                    <li> <a href="RelatorioCategorias">Vendas por categorias</a></li>
                </ul>
            </nav>
             <br>
        <br>
        <img src="img/report.png" alt ="report">
        <legend>Vendas por filiais ativas</legend>
        <br>
   
       <center> <table>
            <thead>
                <th>Filial</th>
                <th>Total receita faturada</th>
              
                
            </thead>
            <tbody> 
                <c:forEach var="item" items="${listaVendas03}">
                    <tr>
                       <td>${item.nomeProduto}</td>
                        <td>${item.valorFaturado}</td>  
                    </tr>
                </c:forEach>
            </tbody>
        </table>  
           <br>
           <br>
          
        <c:import url="Footer.jsp"/>
    </body>
</html>
