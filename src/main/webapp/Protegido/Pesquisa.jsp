<%-- 
    Document   : Pesquisa
    Created on : 15/04/2021, 21:10:43
    Author     : ygor.oliveira
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/index.css">
        
        <title>Gerenciar clientes e produtos</title>
    </head>
    <body>
        <c:import url="../Header.jsp"/>
        <c:import url="Menu.jsp"/>
        
        <script>
       
            function confirmarExclusao(CPF) {
                console.log("Sucesso!" , CPF);
                $("#cpfCliente").html(CPF);
                $("#modal1").show();
            }
         
            
            function confirmarExclusaoProduto(idProduto) {
                console.log("Sucesso!" , idProduto);
                $("#idProduto").html(idProduto);
                $("#modal2").show();
            }
            
              
            function fecharModal(){
                $(".modal").hide();
            }
            
            function fecharModal2(){
                $("#modal2").hide();
            }
            
            
            function deletarCliente() {
                var cpfCliente = $("#cpfCliente").html();
                $(".modal").hide();
               $.ajax({
                    method: "GET",
                    url: "ExcluirCliente?CPF="+cpfCliente
                })
                .done(function( msg ) {
                   location.reload();
                });
            }
            
            function deletarProduto() {
                var idProduto = $("#idProduto").html();
                $("#modal2").hide();
                //Chamada AJAX para o servlet
                $.ajax({
                    method: "GET",
                    url: "ExcluirProduto?idProduto="+idProduto
                })
                .done(function( msg ) {
                   location.reload();
                });
            }
            
        </script>
        
        <br>
        <img src="../img/user.png" alt ="cliente">
        <legend>Clientes cadastrados na loja</legend>
        <br>
       <center> <table>
            <thead>
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
                <th>Alterar</th>
                <th>Excluir</th>

                
            </thead>
            <tbody> 
                <c:forEach var="cliente" items="${listaClientes}">
                    <tr>
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
                        <td><a href="AlterarCliente?cpf=${cliente.CPF}">Alterar</a></td>
                        <td><button type="button" class="btn btn-link" onclick="confirmarExclusao(${cliente.CPF})">Excluir</button></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="modal" tabindex="-1" id="modal1">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title">Confirmar Exclusão</h5>
                  <button type="button" class="btn-close"
                          data-bs-dismiss="modal" aria-label="Close" onclick="fecharModal()"></button>
                </div>
                <div class="modal-body">
                    <p>Confirmar a exclusão do cliente <label id="cpfCliente"></label>?</p>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="fecharModal()">Cancelar</button>
                  <button type="button" class="btn btn-primary" onclick="deletarCliente()">Confirmar</button>
                </div>
              </div>
            </div>
          </div>
        <br>
        <br>
        <br>
        <img src="../img/product.png" alt ="product">
        <legend>Produtos cadastrados na loja</legend>
        <br>
        <table>
            <thead>
                <th>ID do produto</th>
                <th>Nome</th>
                <th>Modelo</th>
                <th>Tipo/Categoria</th>
                <th>Preço unitário</th>
                <th>Quantidade em estoque</th>
                <th>Filial hierarquica</th>
                <th>Alterar</th>
                <th>Excluir</th>
                
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
                        <td><a href="AlterarProduto?idproduto=${produto.idProduto}">Alterar</a></td>
                        <td><button type="button" class="btn btn-link" onclick="confirmarExclusaoProduto(${produto.idProduto})">Excluir</button></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <div class="modal" tabindex="-1" id="modal2">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title">Confirmar Exclusão</h5>
                  <button type="button" class="btn-close"
                          data-bs-dismiss="modal2" aria-label="Close" onclick="fecharModal2()"></button>
                </div>
                <div class="modal-body">
                    <p>Confirmar a exclusão do produto <label id="idProduto"></label>?</p>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal2" onclick="fecharModal()">Cancelar</button>
                  <button type="button" class="btn btn-primary" onclick="deletarProduto()">Confirmar</button>
                </div>
              </div>
            </div>
          </div>
        
        <c:import url="../Footer.jsp"/>
    </body>
</html>
