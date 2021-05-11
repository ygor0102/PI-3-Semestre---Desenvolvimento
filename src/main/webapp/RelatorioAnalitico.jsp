<%-- 
    Document   : RelatorioAnalitico
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
        <br>
        
         <nav class ="menu-opcoes">
                <ul>
                    <li> <a href="index.jsp">Menu</a></li>
                    <li> <a href="RelatorioServlet">Reporte Sintético</a></li>
                    <li> <a href="#">Vendas por filiais</a></li>
                    <li> <a href="#">Vendas por categorias</a></li>
                </ul>
            </nav>
             <br>
        <h4>Reporte Analítico de vendas<h4>
   
       <center> <table>
            <thead>
                <th>ID da Venda</th>
                <th>ID do Produto</th>
                <th>Quantidade vendida</th>
                <th>Nome produto</th>
                <th>Preço unitário do produto</th>
                <th>Valor faturado do produto</th>
                
            </thead>
            <tbody> 
                <c:forEach var="item" items="${listaVendas02}">
                    <tr>
                        <td>${item.fkIdVenda}</td>
                        <td>${item.fkIdProduto}</td>
                        <td>${item.qtdVendida}</td>
                        <td>${item.nomeProduto}</td>
                        <td>${item.precoProduto}</td>
                        <td>${item.valorFaturado}</td>
           
                    </tr>
                </c:forEach>
            </tbody>
        </table>  
           <br>
           <br>
          
        
    </body>
</html>
