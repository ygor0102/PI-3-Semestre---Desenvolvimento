<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : Carrinho
    Created on : 08/05/2021, 12:56:17
    Author     : ygor.oliveira
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/pesquisa.css">
        <title>Carrinho de compras</title>
    </head>
    <body>
        
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
        
        
         <center><table>
                 <thead>
                  <th>Código do produto</th>
                  <th>Nome</th>
                  <th>Modelo</th>
                  <th>Tipo</th>
                  <th>Valor unitário</th>
                  <th>Quantidade a ser comprada</th>
                  <th>Filial</th>
              </thead>
              <form action="ExcluirCarrinho" method="GET">
               <label>Digite o código do produto: </label><input type="number" min="1" class="form-control" id="id_produto" name="id_produto" placeholder="Digite o código...">
               <button type="submit" class="btn btn-primary"">Remover item</button>
              </form>
              
               <label>  Preço total da compra:</label>
               <input type="number" class="form-control" id="precoTotal" name ="precoTotal" value="${PrecoTotal}" disabled ="true">
            
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
        
        <form action="VendaServlet" method="POST">
            
        <label>Digite o ID responsável pela compra: </label><input type="number" min="1" class="form-control" id="id_cliente" name="id_cliente" placeholder="">
        <button type="submit" class="btn btn-primary" id="btnFinaliza" name ="btnFinaliza" disabled ="true">Clique aqui para finalizar!</button>

        </form>
        <br>
        <table>
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
        <br>
 
        <button type="submit" class="btn btn-primary" onclick="validaCampos()">Fechar Compra!</button>
        
        <br>
        <br>
       <br>
       <li> <a href="VendaServlet">Voltar</a></li>
     
    </body>
</html>
