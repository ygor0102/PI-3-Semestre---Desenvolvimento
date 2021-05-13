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
        <title>Reporte Sintético</title>
    </head>
    <body>
        <c:import url="Header.jsp"/>
         <nav class ="menu-opcoes">
                <ul>
                    <li> <a href="index.jsp">Menu</a></li>
                    <li> <a href="RelatorioServlet">Reporte Sintético</a></li>
                    <li> <a href="RelatorioAnaliticoServlet">Reporte Analítico</a></li>
                    <li> <a href="RelatorioFiliais">Vendas por filiais</a></li>
                </ul>
            </nav>
             <br>
        <br>
        <img src="img/report.png" alt ="report">
        <legend>Vendas por categorias de produto</legend>
        <br>
        <br>
   
       <center> <table>
            <thead>
                <th>Categoria</th>
                <th>Total receita faturada</th>
              
                
            </thead>
            <tbody> 
                <c:forEach var="item" items="${listaVendas04}">
                    <tr>
                       <td>${item.nomeProduto}</td>
                        <td>${item.valorFaturado}</td>  
                    </tr>
                </c:forEach>
            </tbody>
        </table>  
           <br>
           <br>
          
        
    </body>
</html>
