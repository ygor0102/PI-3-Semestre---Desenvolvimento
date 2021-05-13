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
        <title>Reporte Analítico</title>
    </head>
    <body>
        <c:import url="Header.jsp"/>
         <nav class ="menu-opcoes">
                <ul>
                    <li> <a href="index.jsp">Menu</a></li>
                    <li> <a href="RelatorioServlet">Reporte Sintético</a></li>
                    <li> <a href="RelatorioFiliais">Vendas por filiais</a></li>
                    <li> <a href="RelatorioCategorias">Vendas por categorias</a></li>
                </ul>
            </nav>
             <br>
             
        <br>
        <img src="img/report.png" alt ="report">
        <legend>Reporte Analítico de vendas<legend>
        <form action="RelatorioDataAnaliticoServlet" method="GET">
            <fieldset>
            <br>
            <p>Data inicial: <input type="date" id="start" name="start" required> Data final:  <input type="date" id="end" name="end" required> <button type="submit" class="btn btn-primary">Pesquisar</button></p>
            <br> 
            </fieldset>        
        </form>
       <center> <table>
            <thead>
                <th>Data da Venda</th>
                <th>ID da Venda</th>
                <th>ID do Produto</th>
                <th>Quantidade vendida</th>
                <th>Nome produto</th>
                <th>Categoria do produto</th>
                <th>Preço unitário do produto</th>
                <th>Valor faturado do produto</th>
                <th>Filial hierarquica</th>
                
            </thead>
            <tbody> 
                <c:forEach var="item" items="${listaVendas02}">
                    <tr>
                        <td>${item.dataVenda}</td>
                        <td>${item.fkIdVenda}</td>
                        <td>${item.fkIdProduto}</td>
                        <td>${item.qtdVendida}</td>
                        <td>${item.nomeProduto}</td>
                        <td>${item.tipoProduto}</td>
                        <td>${item.precoProduto}</td>
                        <td>${item.valorFaturado}</td>
                        <td>${item.fkIdFilial}</td>
                        
                    </tr>
                </c:forEach>
            </tbody>
        </table>  
           <br>
           <br>
          
        
    </body>
</html>
