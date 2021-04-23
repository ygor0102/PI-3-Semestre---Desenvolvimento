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
            function confirmarExclusao(cpf) {
                console.log("Sucesso!" , cpf);
                $("#cpfCliente").html(cpf);
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
                    url: "ExcluirCliente?cpf="+cpfCliente
                })
                .done(function( msg ) {
                   location.reload();
                });
                
                
            }
            
                
            
        </script>
        
        <h5>Lista de Clientes</h5>
        
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
                        <td><a href="AlterarCliente?CPF=${cliente.CPF}" >Alterar</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
    </body>
</html>
