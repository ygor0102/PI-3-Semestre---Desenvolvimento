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
        <title>Cadastros</title>
    </head>
    <body>
        <c:import url="Header.jsp"/>
        <br>
         <c:import url="Menu.jsp"/>
    <br>
    <img src="img/user.png" alt ="cliente">
    <legend>Preencha os dados do cliente</legend>
       
        <c:if test="${not empty cliente}">
             <form action="AlterarCliente" method="POST">
        <ul>
            
        <br>
                         
                             <label for="nome">Nome completo: </label>
                             <input type="text" name="nome" value="${cliente.nome}" class="form-control"/>
                            
        <br>
                         
                             <label for="nascimento">Nascimento: </label>
                             <input type="text" class="form-control" id="nascimento" name="nascimento" value = "${cliente.nascimento}"placeholder ="Dia/Mês/Ano">
                        
        <br>              
                         
                             <label for="CPF">CPF: </label>
                             <input type="text" class="form-control" id="CPF" name="CPF" value = "${cliente.CPF}" readonly="true">
                        
        <br>              
                       
                             <label for="sexo">Sexo: </label>
                             <input type="text" class="form-control" id="sexo" name="sexo" placeholder="M / F" value = "${cliente.sexo}">
                       
        <br>              
                        
                             <label for="estado">Estado: </label>
                             <input type="text" class="form-control" id="estado" name="estado" value = "${cliente.estado}">
                     
        <br>              
                         
                             <label for="UF">UF: </label>
                             <input type="text" class="form-control" id="UF" name="UF" value = "${cliente.UF}">
                       
        <br>              
                       
                             <label for="logradouro">Logradouro: </label>
                             <input type="text" class="form-control" id="logradouro" name="logradouro" value = "${cliente.logradouro}">
                     
        <br>              
                     
                             <label for="numero">Numero: </label>
                             <input type="text" class="form-control" id="numero" name="numero" value = "${cliente.numero}">
                       
        <br>              
                       
                             <label for="complemento">Complemento: </label>
                             <input type="text" class="form-control" id="complemento" name="complemento" placeholder="Casa, Apto, Bloco..." value = "${cliente.complemento}">
                       
         <br>              
                    
                             <label for="telefone">Telefone: </label>
                             <input type="text" class="form-control" id="telefone" name="telefone" placeholder="1188884444" value = "${cliente.telefone}">
                        
         <br>              
                       
                             <label for="celular">Celular: </label>
                             <input type="text" class="form-control" id="celular" name="celular" placeholder="11988884444" value = "${cliente.celular}">
                      
         <br>              
                   
                             <label for="email">E-mail: </label>
                             <input type="text" class="form-control" id="email" name="email" placeholder="Exemplo@mail.com" value = "${cliente.email}">
                      
                         <br>
                         <button type="submit" class="btn btn-primary">Alterar!</button>
                         
         </ul>
             </form>
                         
             </c:if>
        

        
            <c:if test="${empty cliente}">
             <form action="ClienteServlet" method="POST">
        <ul>
            
        <br>
                     
                             <label for="nome">Nome completo: </label>
                             <input type="text" class="form-control" id="nome" name="nome" autofocus required>
                       
        <br>
                      
                             <label for="nascimento">Nascimento: </label>
                             <input type="text" class="form-control" id="nascimento" name="nascimento" placeholder ="Dia/Mês/Ano">
                     
        <br>              
                      
                             <label for="cpf">CPF: </label>
                             <input type="text" class="form-control" id="CPF" name="CPF" >
                   
        <br>              
                       
                             <label for="sexo">Sexo: </label>
                             <input type="text" class="form-control" id="sexo" name="sexo" placeholder="M / F" >
                       
        <br>              
                       
                             <label for="estado">Estado: </label>
                             <input type="text" class="form-control" id="estado" name="estado">
                          
         <br>              
                       
                             <label for="UF">UF: </label>
                             <input type="text" class="form-control" id="UF" name="UF">
                       
        <br>                
                         
                             <label for="logradouro">Logradouro: </label>
                             <input type="text" class="form-control" id="logradouro" name="logradouro">
                       
        <br>              
                        
                             <label for="numero">Numero: </label>
                             <input type="text" class="form-control" id="numero" name="numero">
                       
        <br>              
                      
                             <label for="complemento">Complemento: </label>
                             <input type="text" class="form-control" id="complemento" name="complemento" placeholder="Casa, Apto, Bloco...">
                       
         <br>              
                     
                             <label for="telefone">Telefone: </label>
                             <input type="text" class="form-control" id="telefone" name="telefone" placeholder="1188884444">
                        
         <br>              
                       
                             <label for="celular">Celular: </label>
                             <input type="text" class="form-control" id="celular" name="celular" placeholder="11988884444">
                    
         <br>              
                         
                             <label for="email">E-mail: </label>
                             <input type="text" class="form-control" id="email" name="email" placeholder="Exemplo@mail.com">
                      
                         <br>
                         <button type="submit" class="btn btn-primary">Salvar!</button>
                         
         </ul>
             </form>
             </c:if>
        
    <br>
        <img src="img/product.png" alt ="cliente">
        <legend>Preencha os dados do produto</legend>
        <c:if test="${empty produto}">
             <form action="ProdutoServlet" method="POST">
        <ul>
            
        <br>
                 
                             <label for="nome">Nome do produto: </label>
                             <input type="text" class="form-control" id="nome" name="nome">
                         
        <br>
                      
                             <label for="modelo">Modelo / Marca: </label>
                             <input type="text" class="form-control" id="nascimento" name="modelo">
                       
        <br>              
                      
                             <label for="tipo">Tipo / Categoria: </label>
                             <input type="text" class="form-control" id="CPF" name="tipo">
                     
        <br>              
                       
                             <label for="preco">Preço unitário: </label>
                             <input type="text" class="form-control" id="sexo" name="preco" placeholder="0.00" >
                       
        <br>              
                      
                             <label for="qtdEstoque">Quantidade para estoque: </label>
                             <input type="text" class="form-control" id="estado" name="qtdEstoque">
                       
         <br>              
                       
                             <label for="filial">Filial hierarquica: </label>
                             <input type="text" class="form-control" id="UF" name="filial" placeholder="Digite o número da filial..." >
                     
                         <br>
                         <button type="submit" class="btn btn-primary">Salvar!</button>
                    
         </ul>
             </form>
             </c:if>
        
        <c:if test="${not empty produto}">
             <form action="AlterarProduto" method="POST">
        <ul>
            
        <br>
                     
                             <label for="idProduto">Código do produto: </label>
                             <input type="text" class="form-control" id="nome" name="idProduto" value = "${produto.idProduto}" readonly="true">
                       
        <br>
            
        <br>
                  
                             <label for="nome">Nome do produto: </label>
                             <input type="text" class="form-control" id="nome" name="nome" value = "${produto.nome}">
                   
        <br>
                      
                             <label for="modelo">Modelo / Marca: </label>
                             <input type="text" class="form-control" id="nascimento" name="modelo" value = "${produto.modelo}">
                        
        <br>              
                      
                             <label for="tipo">Tipo / Categoria: </label>
                             <input type="text" class="form-control" id="CPF" name="tipo" value = "${produto.tipo}">
                  
        <br>              
                     
                             <label for="preco">Preço unitário: </label>
                             <input type="text" class="form-control" id="sexo" name="preco" placeholder="0.00" value = "${produto.preco}">
                      
        <br>              
                    
                             <label for="qtdEstoque">Quantidade para estoque: </label>
                             <input type="text" class="form-control" id="estado" name="qtdEstoque" value = "${produto.qtdEstoque}">
                    
         <br>              
                      
                             <label for="filial">Filial hierarquica: </label>
                             <input type="text" class="form-control" id="UF" name="filial" value = "${produto.FKFilial}">
                         
                         <br>
                         <button type="submit" class="btn btn-primary">Alterar produto!</button>    
         </ul>
             </form>
             </c:if>
    
       
    </body>
</html>
