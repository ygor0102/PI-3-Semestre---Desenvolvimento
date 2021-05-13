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
         <nav class ="menu-opcoes">
                <ul>
                    <li> <a href="index.jsp">Menu</a></li>
                    <li> <a href="RelatorioAnaliticoServlet">Reporte Analítico</a></li>
                    <li> <a href="RelatorioFiliais">Vendas por filiais</a></li>
                    <li> <a href="RelatorioCategorias">Vendas por categorias</a></li>
                </ul>
            </nav>
             <br>
        <br>
        <img src="img/report.png" alt ="report">
        <legend>Reporte Sintético de vendas<legend>
           
        <form action="RelatorioDataServlet" method="GET">
            <fieldset>
            <br>
            <p>Data inicial: <input type="date" id="start" name="start" required> Data final:  <input type="date" id="end" name="end" required> <button type="submit" class="btn btn-primary">Pesquisar</button></p>
            <br> 
            </fieldset>        
        </form>
                
       <center> <table>
            <thead>
                <th>ID da venda</th>
                <th>Data da venda</th>
                <th>Total faturado</th>
                <th>ID do consumidor</th>
                <th>Nome do consumidor</th>
                
            </thead>
            <tbody> 
                <c:forEach var="venda" items="${listaVendas01}">
                    <tr>
                        <td>${venda.idVenda}</td>
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
