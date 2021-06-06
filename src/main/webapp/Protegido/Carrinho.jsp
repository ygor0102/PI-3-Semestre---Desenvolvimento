<%-- 
    Document   : Carrinho
    Author     : Ygor Oliveira | Yasmim Candelária | Juan Dias
--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/navbar.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <title>Carrinho de compras</title>
    </head>
    <body>
        <header>  
        <div id="navbar">
            
            <a class="nav-link" href="index.jsp">Menu</a>
            <a class="nav-link" href="VendaServlet">Realizar vendas</a>
            <a class="nav-link" href="ClienteServlet">Gerenciar clientes e produtos</a>
             <c:if test="${sessionScope.usuario.isGerente() || sessionScope.usuario.isAdmin()}">
                 <a class="nav-link" href="Admin_e_Gerente/RelatorioServlet">Extrair relatórios</a>
          </c:if>
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
        
        <script>
      
          function validaCampos(){
              var idCliente = document.getElementById('id_cliente').value;
              var precoTotal = document.getElementById('precoTotal').value;
              
              if(precoTotal <=0){
                   alert("O carrinho de compras está vazio!");
                   document.getElementById("btnFinaliza").disabled = true;
                   return;
              }
              
              if(idCliente<=0){
                  alert("Digite o ID do cliente responsável pela compra!");
                  document.getElementById("btnFinaliza").disabled = true;
                  return;
              }else{
                  
                  document.getElementById("btnFinaliza").disabled = false;
                 
              }
             
        }
            
            function deletarCarrinho() {
                var idProduto = $("#idProduto").html();
                //Chamada AJAX para o servlet
                $.ajax({
                    method: "GET",
                    url: "ExcluirCarrinho?idProduto="+idProduto
                })
                .done(function( msg ) {
                   location.reload();
                });
            }
            
        </script>
        <br><br><br>
    <center><legend>Carrinho de compras</legend></center>
         <table class="table table-striped table-dark">
              
                 <thead>
                  <th>Código do produto</th>
                  <th>Nome</th>
                  <th>Modelo</th>
                  <th>Tipo</th>
                  <th>Valor unitário</th>
                  <th>Quantidade a ser comprada</th>
                  <th>Filial</th>
              </thead>
              
               
               <c:forEach var="produto" items="${listaCarrinho}">
                    <tr>
                     
                        <td>${produto.idProduto}</td>
                        <td>${produto.nome}</td>
                        <td>${produto.modelo}</td>
                        <td>${produto.tipo}</td>
                        <td>${produto.preco}</td>
                        <td>${produto.qtdEstoque}</td>
                        <td>${produto.FKFilial}</td>
                    </tr>
                </c:forEach>
                    
          </tbody>
        </table>
             <br>
             <center><form action="ExcluirCarrinho" method="GET">
                  <fieldset>
               <label>Digite o código do produto para remover: *</label><input type="number" min="1" class="form-control" id="id_produto" name="id_produto" placeholder="Digite o código..." required>
               <br>
               
               <button type="submit" class="btn btn-primary" disable>Remover item</button>
              
                  </fieldset>
                 </form></center>
        <br>
        
       
        <br>
        <center><legend>Clientes cadastrados na loja</legend>
        
        <form action="PesquisarCliente" method="GET">
                  <fieldset>
               <label>Pesquisar clientes: </label>
               <input type="text" class="form-control" id="nome_cliente" name="nome_cliente" placeholder="Digite o nome do cliente..." required>
               <br>
               <button type="submit" class="btn btn-primary" disable>Pesquisar</button>
              
                  </fieldset>
                 </form>
        
            <br>
        </center>
        <table class="table table-striped table-dark">
            <thead>
                <th>ID do cliente</th>
                <th>Nome</th>
                <th>Nascimento</th>
                <th>CPF</th>
                <th>Sexo</th>
                <th>Estado</th>
                <th>UF</th>
                <th>Logradouro</th>
                <th>Número residencial</th>
                <th>Complemento</th>
                <th>Telefone</th>
                <th>Celular</th>
                <th>E-mail</th>
                
            </thead>
            <tbody>
                 
                <c:forEach var="cliente" items="${listaClientes}">
                    <tr>
                        <td>${cliente.idCliente}</td>
                        <td>${cliente.nome}</td>
                        <td>${cliente.nascimento}</td>
                        <td>${cliente.CPF}</td>
                        <td>${cliente.sexo}</td>
                        <td>${cliente.estado}</td>
                        <td>${cliente.UF}</td>
                        <td>${cliente.logradouro}</td>
                        <td>${cliente.numero}</td>
                        <td>${cliente.complemento}</td>
                        <td>${cliente.telefone}</td>
                        <td>${cliente.celular}</td>
                        <td>${cliente.email}</td>
                    </tr>
                </c:forEach>
            </tbody>
            </table>
        <center><br>
         <br>
               <label>  Preço total da compra:</label>
               <input type="number" class="form-control" id="precoTotal" name ="precoTotal" value="${PrecoTotal}" readonly ="true">
         <br>
         
         <form action="VendaServlet" method="POST">
        <fieldset>
        <label>Digite o ID do cliente responsável pela compra: *</label><input type="number" min="1" class="form-control" id="id_cliente" name="id_cliente" placeholder="" required>
        <br>
        <button type="submit" class="btn btn-primary" id="btnFinaliza" name ="btnFinaliza">Clique aqui para finalizar!</button>
        
        </fieldset>
             </form></center>
         
       <c:import url="../Footer.jsp"/>
    
    </body>
</html>
