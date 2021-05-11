<%-- 
    Document   : RelatorioSintetico
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
                    <li> <a href="RelatorioAnaliticoServlet">Reporte Analítico</a></li>
                    <li> <a href="#">Vendas por filiais</a></li>
                    <li> <a href="#">Vendas por categorias</a></li>
                </ul>
            </nav>
             <br>
        <h4>Reporte Sintético de vendas<h4>
   
       <center> <table>
            <thead>
                <th>Data da venda</th>
                <th>Preço total</th>
                <th>ID do consumidor</th>
                <th>Nome do consumidor</th>    
            </thead>
            <tbody> 
                <c:forEach var="venda" items="${listaVendas01}">
                    <tr>
                        <td>${venda.dataVenda}</td>
                        <td>${venda.precoTotal}</td>
                        <td>${venda.fkIdCliente}</td>
                        <td>${venda.nomeCliente}</td>
           
                    </tr>
                </c:forEach>
            </tbody>
        </table>  
           <br>
           <br>
          
        
    </body>
</html>
