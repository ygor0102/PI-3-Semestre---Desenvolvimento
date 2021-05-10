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
        
        <title>Realizar venda</title>
 
    </head>
    
    
    <body>
              <c:import url="Header.jsp"/>
              <br>
               <a href="index.jsp">Voltar</a>
               <a href="CarrinhoServlet">Carrinho de compras</a>
              <br>
               
        <script>
       
            function ValidaQtd(qtdEstoque){
                var qtdProduto = document.getElementById('qtd_produto').value;
                
                if(qtdProduto > qtdEstoque) {
                    alert("O produto não possui essa quantidade disponível!");
                    document.getElementById("btAdd").disabled = true;
                }
                
                else if(qtdProduto <=0) {
                    alert("A quantidade precisa ser maior que 0!");
                    document.getElementById("btAdd").disabled = true;
                }
                else{
                    alert("Quantidade válida!");
                    document.getElementById("btAdd").disabled = false;
                }
            }
            
        </script>
        
              <br>
              <form action="CarrinhoServlet" method="POST">
                    <p>Quantidade desejada: </p><input type="number" min="1" class="form-control" id="qtd_produto" name="qtd_produto" placeholder="Digite a quantidade..."/>
                    <br>
                    <p>Código do produto: </p><input type="number" min="1" class="form-control" id="id_produto" name="id_produto" placeholder="Digite o código..."/>          
                    <br>
                    <button type="submit" class="btn btn-primary" id="btAdd" name="btAdd" disabled="true">Adicionar ao carrinho</button>
            </form>
              <br>
              <br>
         <center><table>
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
                <h5>Lista de produtos:</h5>
                <c:forEach var="produto" items="${listaProdutos}">
                    <tr>
                        <td>${produto.idProduto}</td>
                        <td>${produto.nome}</td>
                        <td>${produto.modelo}</td>
                        <td>${produto.tipo}</td>
                        <td>${produto.preco}</td>
                        <td>${produto.qtdEstoque}</td>
                        <td>${produto.FKFilial}</td>
                        <td><button type="button" class="btn btn-link" onclick="ValidaQtd(${produto.qtdEstoque})">Validar qtd.</button></td>
                    </tr>
                </c:forEach>
            </tbody>
            </table></center>  
    </body>
</html>
