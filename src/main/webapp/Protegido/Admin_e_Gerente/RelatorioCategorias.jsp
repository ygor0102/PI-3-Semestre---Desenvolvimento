<%-- 
    Document   : Relatório de Categorias
    Author     : Ygor Oliveira | Yasmim Candelária | Juan Dias
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
        <title>Reporte Categorias</title>
    </head>
    <body>
        
        <header>  
        <div id="navbar">
            
            <a class="nav-link" href="../index.jsp">Menu</a>
            <a class="nav-link" href="RelatorioServlet">Reporte Sintético</a>
            <a class="nav-link" href="RelatorioAnaliticoServlet">Reporte Analítico</a>
            <a class="nav-link" href="RelatorioFiliais">Vendas por filiais</a>
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
    <center>
        <br><br><br>
        <img src="../../img/report.png" alt ="report">
        <legend>Vendas por categorias de produto</legend>
       <br>
    </center>
       <table class="table table-striped table-dark">
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
          
        <c:import url="../../Footer.jsp"/>
    </body>
</html>
