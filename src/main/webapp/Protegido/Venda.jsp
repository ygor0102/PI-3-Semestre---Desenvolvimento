<%-- 
    Document   : Venda
    Author     : Ygor Oliveira | Yasmim Candelária | Juan Dias | Filipe Vital
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/navbar.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <title>Realizar venda</title>
 
    </head>
    
    <body>
        <header>  
        <div id="navbar">
            
            <a class="nav-link" href="index.jsp">Menu</a>
            <a class="nav-link" href="ClienteServlet">Gerenciar clientes e produtos</a>
            <a class="nav-link" href="Cadastro.jsp">Realizar cadastros</a>
            <c:if test="${sessionScope.usuario.isGerente() || sessionScope.usuario.isAdmin()}">
            <a class="nav-link" href="Admin_e_Gerente/RelatorioServlet">Extrair relatórios</a>
            </c:if>
            <a class="nav-link" href="CarrinhoServlet">Carrinho de compras</a>
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
      
        <br>    
        <script>
       
            function ValidaQtd(qtdEstoque, idProduto){
                var qtdProduto = document.getElementById('qtd_produto').value;
                
                if(qtdProduto > qtdEstoque) {
                    alert("O produto não possui essa quantidade disponível!");
                    document.getElementById("btAdd").disabled = true;
                    document.getElementById('qtd_produto').readOnly = false;
                    
                }
                
                else if(qtdProduto <=0) {
                    alert("A quantidade precisa ser maior que 0!");
                    document.getElementById("btAdd").disabled = true;
                    document.getElementById('qtd_produto').readOnly = false;
                }
                else{
                    alert("Quantidade válida!");
                    document.getElementById("btAdd").disabled = false;
                    document.getElementById("id_produto").value = idProduto;
                    document.getElementById('qtd_produto').readOnly = true;
                    
                }
            }
            
        </script>
    
         <table class="table table-striped table-dark">
                 <thead>
                  <th>Código do produto</th>
                  <th>Nome</th>
                  <th>Modelo</th>
                  <th>Tipo</th>
                  <th>Valor unitário</th>
                  <th>Qtd. em estoque</th>
                  <th>Filial</th>
                  <th>Valida quantia</th>
              </thead>
             <tbody> 
             <center><legend>Produtos disponíveis:</legend></center>
                <c:forEach var="produto" items="${listaProdutos}">
                    <tr>
                        <td>${produto.idProduto}</td>
                        <td>${produto.nome}</td>
                        <td>${produto.modelo}</td>
                        <td>${produto.tipo}</td>
                        <td>${produto.preco}</td>
                        <td>${produto.qtdEstoque}</td>
                        <td>${produto.FKFilial}</td>
                        <td><button type="button" style="color:white" class="btn btn-link" onclick="ValidaQtd(${produto.qtdEstoque}, ${produto.idProduto})">Validar qtd.</button></td>
                    </tr>
                </c:forEach>
            </tbody>
            </table>
    
                <br>
                <center><form action="CarrinhoServlet" method="POST">
                  <fieldset>
                    <p>Quantidade desejada: </p><input type="number" min="1" class="form-control" id="qtd_produto" name="qtd_produto" placeholder="Digite a quantidade..." required>
                    <br>
                    <p>Código do produto: </p><input type="number" min="1" class="form-control" id="id_produto" name="id_produto" placeholder="Digite o código..." required readonly="true" required>          
                    <br>
                    <button type="submit" class="btn btn-primary" id="btAdd" name="btAdd" disabled="true">Adicionar ao carrinho</button>
                  </fieldset>
                    </form></center>
                <c:import url="../Footer.jsp"/>
    </body>
</html>
