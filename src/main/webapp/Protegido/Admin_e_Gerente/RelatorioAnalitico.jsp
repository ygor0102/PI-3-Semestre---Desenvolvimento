<%-- 
    Document   : Relatório Analítico
    Author     : Ygor Oliveira | Yasmim Candelária | Juan Dias | Filipe Vital
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../../css/navbar.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <title>Reporte Analítico</title>
    </head>
    <body>
        
        <header>  
        <div id="navbar">
            
            <a class="nav-link" href="../index.jsp">Menu</a>
            <a class="nav-link" href="RelatorioServlet">Reporte Sintético</a>
            <a class="nav-link" href="RelatorioFiliais">Vendas por filiais</a>
            <a class="nav-link" href="RelatorioCategorias">Vendas por categorias</a>
        </div>
        <script>     
          // When the user scrolls the page, execute myFunction
            window.onscroll = function() {myFunction()};

            // Get the navbar
                var navbar = document.getElementById("navbar");

           // Get the offset position of the navbar
            var sticky = navbar.offsetTop;

            // Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
            function myFunction() {
            if (window.pageYOffset >= sticky) {
             navbar.classList.add("sticky")
        }
        else {
             navbar.classList.remove("sticky");
  }
}
        </script>
        </header>
             <br><br><br>
    <center>     
        <br>
        <img src="../../img/report.png" alt ="report">
        <legend>Reporte Analítico de vendas<legend>
        <form action="RelatorioDataAnaliticoServlet" method="GET">
            <fieldset>
            <br>
            <p>Data inicial: <input type="date" id="start" name="start" required> até: <input type="date" id="end" name="end" required> <button type="submit" class="btn btn-primary">Pesquisar</button></p>
            <br> 
            </fieldset>        
        </form>
                </center>
            <table class="table table-striped table-dark">
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
          
         <c:import url="../../Footer.jsp"/>
    </body>
</html>
