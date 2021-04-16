<%-- 
    Document   : Cadastro
    Created on : 15/04/2021, 21:10:18
    Author     : ygor.oliveira
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/cadastro.css">
        <title>Cadastros</title>
    </head>
    <body>
        <h1>Cadastros - LIS</h1>
        <legend>Preencha os dados do cliente</legend>
            <c:if test="${empty cliente}">
             <form action="ClienteServlet" method="POST">
        <ul>
            
        <br>
                        <li> <div class ="form-group">
                             <label for="nome">Nome completo: </label>
                             <input type="text" class="form-control" id="nome" name="nome" value = "${cliente.nome}"autofocus required>
                            </div></li>
        <br>
                        <li> <div class ="form-group">
                             <label for="nascimento">Nascimento: </label>
                             <input type="text" class="form-control" id="nascimento" name="nascimento" value = "${cliente.nascimento}"placeholder ="Dia/Mês/Ano">
                         </div></li>
        <br>              
                         <li><div class ="form-group">
                             <label for="cpf">CPF: </label>
                             <input type="text" class="form-control" id="CPF" name="CPF" value = "${cliente.CPF}">
                         </div></li>
        <br>              
                        <li> <div class ="form-group">
                             <label for="sexo">Sexo: </label>
                             <input type="text" class="form-control" id="sexo" name="sexo" placeholder="M / F" value = "${cliente.sexo}">
                         </div></li>
        <br>              
                        <li> <div class ="form-group">
                             <label for="estado">Estado: </label>
                             <input type="text" class="form-control" id="estado" name="estado" value = "${cliente.estado}">
                         </div></li>
        <br>              
                         <li><div class ="form-group">
                             <label for="UF">UF: </label>
                             <input type="text" class="form-control" id="UF" name="UF" value = "${cliente.UF}">
                         </div></li>
        <br>              
                         <li><div class ="form-group">
                             <label for="logradouro">Logradouro: </label>
                             <input type="text" class="form-control" id="logradouro" name="logradouro" value = "${cliente.logradouro}">
                         </div></li>
        <br>              
                         <li><div class ="form-group">
                             <label for="numero">Numero: </label>
                             <input type="text" class="form-control" id="numero" name="numero" value = "${cliente.numero}">
                         </div></li>
        <br>              
                        <li> <div class ="form-group">
                             <label for="complemento">Complemento: </label>
                             <input type="text" class="form-control" id="complemento" name="complemento" placeholder="Casa, Apto, Bloco..." value = "${cliente.complemento}">
                         </div></li>
         <br>              
                        <li> <div class ="form-group">
                             <label for="telefone">Telefone: </label>
                             <input type="text" class="form-control" id="telefone" name="telefone" placeholder="1188884444" value = "${cliente.telefone}">
                         </div></li>
         <br>              
                         <li><div class ="form-group">
                             <label for="celular">Celular: </label>
                             <input type="text" class="form-control" id="celular" name="celular" placeholder="11988884444" value = "${cliente.celular}">
                         </div></li>
         <br>              
                         <li><div class ="form-group">
                             <label for="email">E-mail: </label>
                             <input type="text" class="form-control" id="email" name="email" placeholder="Exemplo@mail.com" value = "${cliente.email}">
                         </div></li>
                         <br>
                         <button type="submit" class="btn btn-primary">Salvar!</button>
                         
         </ul>
             </form>
             </c:if>
        
        
        <br> 
        <li> <a href="index.jsp">Voltar</a></li>
    </body>
</html>
