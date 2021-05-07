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
       
            function ValidaQtd() {
               var qtdProduto = document.getElementById('qtdProduto').value;
               var qtdEstoque = 10;
                if (qtdProduto > qtdEstoque) {
                    alert("O produto não possui essa quantidade disponível!");
                }
                
                else if (qtdProduto <=0) {
                    alert("A quantidade precisa ser maior que 0!");
                }
                else{
                    alert("Produto adicionado com sucesso!");
                }
            }
            
            
   
            
        </script>
    
    <body>
              <c:import url="Header.jsp"/>
              <BR>
              <h5>..:: Lista de produtos disponíveis ::..</h5>
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
                  <th>Qtd desejada</th>
              </thead>
             <tbody> 
                <c:forEach var="produto" items="${listaProdutos}">
                    <tr>
                        <td>${produto.idProduto}</td>
                        <td>${produto.nome}</td>
                        <td>${produto.modelo}</td>
                        <td>${produto.tipo}</td>
                        <td>${produto.preco}</td>
                        <td>${produto.qtdEstoque}</td>
                        <td>${produto.FKFilial}</td>
                        <td><input type="number" min="1" class="form-control" id="qtdProduto" name="qtdProduto" placeholder="Digite a quantidade..."></td>
                        <td><button type="button" class="btn btn-primary" onclick="ValidaQtd()">Adicionar ao carrinho</button></td>

                    </tr>
                </c:forEach>
            </tbody>
        </table>
              
              <h5>..:: Carrinho de compras ::..</h5>
               
              
       <li> <a href="index.jsp">Voltar</a></li>
 
              
    </body>
    
  
    
    
</html>
