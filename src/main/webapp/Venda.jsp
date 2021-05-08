<%-- 
    Document   : Venda
    Created on : 06/05/2021, 21:40:39
    Author     : ygor.oliveira
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <script>
       
            function ValidaQtd(qtdEstoque) {
               var qtdProduto = document.getElementById('qtdProduto').value;
                if (qtdProduto > qtdEstoque) {
                    alert("O produto não possui essa quantidade disponível!");
                }
                
                else if (qtdProduto <=0) {
                    alert("A quantidade precisa ser maior que 0!");
                }
                else{
                    
                    $.ajax({
                    method: "POST",
                    url: "CarrinhoServlet"
                })
                
                .done(function( msg ) {
                   location.reload();
                });
                
                    
                    alert("Produto adicionado com sucesso!");
                }
            }
            
            
   
            
        </script>
    
    <body>
              <c:import url="Header.jsp"/>
              <BR>
              <h5>..:: Lista de produtos disponíveis ::..</h5>
               <label for="qtd">Quantidade desejada: </label><input type="number" min="1" class="form-control" id="qtdProduto" name="qtdProduto" placeholder="Digite a quantidade...">
              <br>
              <table>
                 <thead>
                  <th>Código do produto</th>
                  <th>Nome</th>
                  <th>Modelo</th>
                  <th>Tipo</th>
                  <th>Valor unitário</th>
                  <th>Qtd. Disponível para venda</th>
                  <th>Filial</th>
                  <th>Adicionar</th>
              </thead>
             <tbody> 
                <c:forEach var="produto" items="${listaProdutos}">
                    <tr>
                        <td name="id_produto">${produto.idProduto}</td>
                        <td name="nome">${produto.nome}</td>
                        <td name="modelo">${produto.modelo}</td>
                        <td name="tipo">${produto.tipo}</td>
                        <td name="preco">${produto.preco}</td>
                        <td>${produto.qtdEstoque}</td>
                        <td name="filial">${produto.FKFilial}</td>
                        <td><button type="button" class="btn btn-primary" onclick="ValidaQtd(${produto.qtdEstoque})">Adicionar ao carrinho</button></td>

                    </tr>
                </c:forEach>
            </tbody>
        </table>
              
              <h5>..:: Carrinho de compras ::..</h5>
              <br>
              <table>
                 <thead>
                  <th>Código do produto</th>
                  <th>Nome</th>
                  <th>Modelo</th>
                  <th>Tipo</th>
                  <th>Valor unitário</th>
                  <th>Quantidade a ser comprada</th>
                  <th>Filial</th>
                  <th>Remover</th>
              </thead>
              
              <c:forEach var="carrinho" items="${listaCarrinho}">
                    <tr>
                        <td>${produto.idProduto}</td>
                        <td>${produto.nome}</td>
                        <td>${produto.modelo}</td>
                        <td>${produto.tipo}</td>
                        <td>${produto.preco}</td>
                        <td>${produto.qtdEstoque}</td>
                        <td>${produto.FKFilial}</td>
                        <td><button type="button" class="btn btn-primary">Remover do carrinho</button></td>

                    </tr>
                </c:forEach>
               
                 </tbody>
        </table>
       <li> <a href="index.jsp">Voltar</a></li>
 
              
    </body>
    
  
    
    
</html>
