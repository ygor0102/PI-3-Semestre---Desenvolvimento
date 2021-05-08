<%-- 
    Document   : Cadastro
    Created on : 15/04/2021, 21:10:18
    Author     : ygor.oliveira
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <legend>..:: DADOS DO CLIENTE ::..</legend>
        
       
        <c:if test="${not empty cliente}">
             <form action="AlterarCliente" method="POST">
        <ul>
            
        <br>
                        <li> 
                             <label for="nome">Nome completo: </label>
                             <input type="text" name="nome" value="${cliente.nome}" class="form-control"/>
                            </li>
        <br>
                        <li> <div class ="form-group">
                             <label for="nascimento">Nascimento: </label>
                             <input type="text" class="form-control" id="nascimento" name="nascimento" value = "${cliente.nascimento}"placeholder ="Dia/Mês/Ano">
                         </div></li>
        <br>              
                         <li><div class ="form-group">
                             <label for="CPF">CPF: </label>
                             <input type="text" class="form-control" id="CPF" name="CPF" value = "${cliente.CPF}" readonly="true">
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
                         <button type="submit" class="btn btn-primary">Alterar!</button>
                         
         </ul>
             </form>
                         
             </c:if>
        

        
            <c:if test="${empty cliente}">
             <form action="ClienteServlet" method="POST">
        <ul>
            
        <br>
                        <li> <div class ="form-group">
                             <label for="nome">Nome completo: </label>
                             <input type="text" class="form-control" id="nome" name="nome" autofocus required>
                            </div></li>
        <br>
                        <li> <div class ="form-group">
                             <label for="nascimento">Nascimento: </label>
                             <input type="text" class="form-control" id="nascimento" name="nascimento" placeholder ="Dia/Mês/Ano">
                         </div></li>
        <br>              
                         <li><div class ="form-group">
                             <label for="cpf">CPF: </label>
                             <input type="text" class="form-control" id="CPF" name="CPF" >
                         </div></li>
        <br>              
                        <li> <div class ="form-group">
                             <label for="sexo">Sexo: </label>
                             <input type="text" class="form-control" id="sexo" name="sexo" placeholder="M / F" >
                         </div></li>
        <br>              
                        <li> <div class ="form-group">
                             <label for="estado">Estado: </label>
                             <input type="text" class="form-control" id="estado" name="estado">
                             </div></li>
         <br>              
                         <li><div class ="form-group">
                             <label for="UF">UF: </label>
                             <input type="text" class="form-control" id="UF" name="UF">
                         </div></li>
        <br>                
                         <li><div class ="form-group">
                             <label for="logradouro">Logradouro: </label>
                             <input type="text" class="form-control" id="logradouro" name="logradouro">
                         </div></li>
        <br>              
                         <li><div class ="form-group">
                             <label for="numero">Numero: </label>
                             <input type="text" class="form-control" id="numero" name="numero">
                         </div></li>
        <br>              
                        <li> <div class ="form-group">
                             <label for="complemento">Complemento: </label>
                             <input type="text" class="form-control" id="complemento" name="complemento" placeholder="Casa, Apto, Bloco...">
                         </div></li>
         <br>              
                        <li> <div class ="form-group">
                             <label for="telefone">Telefone: </label>
                             <input type="text" class="form-control" id="telefone" name="telefone" placeholder="1188884444">
                         </div></li>
         <br>              
                         <li><div class ="form-group">
                             <label for="celular">Celular: </label>
                             <input type="text" class="form-control" id="celular" name="celular" placeholder="11988884444">
                         </div></li>
         <br>              
                         <li><div class ="form-group">
                             <label for="email">E-mail: </label>
                             <input type="text" class="form-control" id="email" name="email" placeholder="Exemplo@mail.com">
                         </div></li>
                         <br>
                         <button type="submit" class="btn btn-primary">Salvar!</button>
                         
         </ul>
             </form>
             </c:if>
        
      <br>
        <br>
        <legend>..:: DADOS DO PRODUTO ::..</legend>
        <c:if test="${empty produto}">
             <form action="ProdutoServlet" method="POST">
        <ul>
            
        <br>
                        <li> <div class ="form-group">
                             <label for="nome">Nome do produto: </label>
                             <input type="text" class="form-control" id="nome" name="nome">
                            </div></li>
        <br>
                        <li> <div class ="form-group">
                             <label for="modelo">Modelo / Marca: </label>
                             <input type="text" class="form-control" id="nascimento" name="modelo">
                         </div></li>
        <br>              
                         <li><div class ="form-group">
                             <label for="tipo">Tipo / Categoria: </label>
                             <input type="text" class="form-control" id="CPF" name="tipo">
                         </div></li>
        <br>              
                        <li> <div class ="form-group">
                             <label for="preco">Preço unitário: </label>
                             <input type="text" class="form-control" id="sexo" name="preco" placeholder="0.00" >
                         </div></li>
        <br>              
                        <li> <div class ="form-group">
                             <label for="qtdEstoque">Quantidade para estoque: </label>
                             <input type="text" class="form-control" id="estado" name="qtdEstoque">
                             </div></li>
         <br>              
                         <li><div class ="form-group">
                             <label for="filial">Filial hierarquica: </label>
                             <input type="text" class="form-control" id="UF" name="filial" placeholder="Digite o número da filial..." >
                            </div></li>
                         <br>
                         <button type="submit" class="btn btn-primary">Salvar!</button>
                    
         </ul>
             </form>
             </c:if>
        
        <c:if test="${not empty produto}">
             <form action="AlterarProduto" method="POST">
        <ul>
            
        <br>
                        <li> <div class ="form-group">
                             <label for="idProduto">Código do produto: </label>
                             <input type="text" class="form-control" id="nome" name="idProduto" value = "${produto.idProduto}" readonly="true">
                            </div></li>
        <br>
            
        <br>
                        <li> <div class ="form-group">
                             <label for="nome">Nome do produto: </label>
                             <input type="text" class="form-control" id="nome" name="nome" value = "${produto.nome}">
                            </div></li>
        <br>
                        <li> <div class ="form-group">
                             <label for="modelo">Modelo / Marca: </label>
                             <input type="text" class="form-control" id="nascimento" name="modelo" value = "${produto.modelo}">
                         </div></li>
        <br>              
                         <li><div class ="form-group">
                             <label for="tipo">Tipo / Categoria: </label>
                             <input type="text" class="form-control" id="CPF" name="tipo" value = "${produto.tipo}">
                         </div></li>
        <br>              
                        <li> <div class ="form-group">
                             <label for="preco">Preço unitário: </label>
                             <input type="text" class="form-control" id="sexo" name="preco" placeholder="0.00" value = "${produto.preco}">
                         </div></li>
        <br>              
                        <li> <div class ="form-group">
                             <label for="qtdEstoque">Quantidade para estoque: </label>
                             <input type="text" class="form-control" id="estado" name="qtdEstoque" value = "${produto.qtdEstoque}">
                             </div></li>
         <br>              
                         <li><div class ="form-group">
                             <label for="filial">Filial hierarquica: </label>
                             <input type="text" class="form-control" id="UF" name="filial" value = "${produto.FKFilial}">
                            </div></li>
                         <br>
                         <button type="submit" class="btn btn-primary">Alterar produto!</button>    
         </ul>
             </form>
             </c:if>
       
        <br> 
        <li> <a href="index.jsp">Voltar</a></li>
    </body>
</html>
