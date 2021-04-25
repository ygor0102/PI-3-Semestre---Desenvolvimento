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
        <link rel="stylesheet" href="css/pesquisa.css">
        
        <title>Gerenciador</title>
    </head>
    <body>
        <c:import url="Header.jsp"/>
        
        <script>
            function confirmarExclusao(CPF) {
                console.log("Sucesso!" , CPF);
                $("#cpfCliente").html(CPF);
                $(".modal").show();
            }
            
            function fecharModal(){
                $(".modal").hide();
            }
            
            function deletarCliente() {
                var cpfCliente = $("#cpfCliente").html();
                $(".modal").hide();
                //Chamada AJAX para o servlet
                $.ajax({
                    method: "GET",
                    url: "ExcluirCliente?CPF="+cpfCliente
                })
                .done(function( msg ) {
                   location.reload();
                });
                
                
            }
            
                
            
        </script>
        
        <h5>..:: LISTA DE CLIENTES ::..</h5>
        <br>
        <table>
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
                        <td><a href="AlterarCliente?cpf=${cliente.CPF}" >Alterar</a></td>
                        <td><button type="button" class="btn btn-link" onclick="confirmarExclusao(${cliente.CPF})">Excluir</button></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="modal" tabindex="-1">
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
        <h5>..:: LISTA DE PRODUTOS ::..</h5>
        <br>
        <table>
            <thead>
                <th>Nome</th>
                <th>Modelo</th>
                <th>Tipo/Categoria</th>
                <th>Preço unitário</th>
                <th>Quantidade em estoque</th>
                <th>Filial hierarquica</th>
                
            </thead>
            <tbody> 
                <c:forEach var="produto" items="${listaProdutos}">
                    <tr>
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
        
        <li> <a href="index.jsp">Voltar</a></li>
    </body>
</html>
