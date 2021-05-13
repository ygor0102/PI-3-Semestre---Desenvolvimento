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
        <title>Realizar cadastro</title>
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
                 <fieldset>
        <ul>
            
        <br>
                         
                             <label for="nome">Nome completo: *</label>
                             <input type="text" class="form-control" name="nome" value="${cliente.nome}" required>
                            
        <br>
                         
                             <label for="nascimento">Nascimento: *</label>
                             <input type="text" class="form-control" id="nascimento" name="nascimento" value = "${cliente.nascimento}"placeholder ="Dia/Mês/Ano" required>
                        
        <br>              
                         
                             <label for="CPF">CPF: *</label>
                             <input type="text" class="form-control" id="CPF" name="CPF" value = "${cliente.CPF}" readonly="true">
                        
        <br>              
                       
                             <label for="sexo">Sexo: *</label>
                             <input type="text" class="form-control" id="sexo" name="sexo" placeholder="M / F" value = "${cliente.sexo}" required>
                       
        <br>              
                        
                             <label for="estado">Estado: *</label>
                             <input type="text" class="form-control" id="estado" name="estado" value = "${cliente.estado}" required>
                     
        <br>              
                         
                             <label for="UF">UF: *</label>
                             <input type="text" class="form-control" id="UF" name="UF" value = "${cliente.UF}" required>
                       
        <br>              
                       
                             <label for="logradouro">Logradouro: *</label>
                             <input type="text" class="form-control" id="logradouro" name="logradouro" value = "${cliente.logradouro}" required>
                     
        <br>              
                     
                             <label for="numero">Numero: *</label>
                             <input type="text" class="form-control" id="numero" name="numero" value = "${cliente.numero}" required>
                       
        <br>              
                       
                             <label for="complemento">Complemento: </label>
                             <input type="text" class="form-control" id="complemento" name="complemento" placeholder="Casa, Apto, Bloco..." value = "${cliente.complemento}">
                       
         <br>              
                    
                             <label for="telefone">Telefone: </label>
                             <input type="text" class="form-control" id="telefone" name="telefone" placeholder="1188884444" value = "${cliente.telefone}">
                        
         <br>              
                       
                             <label for="celular">Celular: *</label>
                             <input type="text" class="form-control" id="celular" name="celular" placeholder="11988884444" value = "${cliente.celular}" required>
                      
         <br>              
                   
                             <label for="email">E-mail: *</label>
                             <input type="text" class="form-control" id="email" name="email" placeholder="Exemplo@mail.com" value = "${cliente.email}" required>
                      
                         <br>
                         <button type="submit" class="btn btn-primary">Alterar cliente!</button>
                         
         </ul>
             </fieldset>
             </form>
                         
             </c:if>
        

        
            <c:if test="${empty cliente}">
             <form action="ClienteServlet" method="POST">
                 <fieldset>
        <ul>
            
        <br>
                     
                             <label for="nome">Nome completo: *</label>
                             <input type="text" class="form-control" id="nome" name="nome" required>
                       
        <br>
                      
                             <label for="nascimento">Nascimento: *</label>
                             <input type="text" class="form-control" id="nascimento" name="nascimento" placeholder ="Dia/Mês/Ano" required>
                     
        <br>              
                      
                             <label for="cpf">CPF: *</label>
                             <input type="text" class="form-control" id="CPF" name="CPF" required>
                   
        <br>              
                       
                             <label for="sexo">Sexo: *</label>
                             <input type="text" class="form-control" id="sexo" name="sexo" placeholder="M / F" required>
                       
        <br>              
                       
                             <label for="estado">Estado: *</label>
                             <input type="text" class="form-control" id="estado" name="estado" required>
                          
         <br>              
                       
                             <label for="UF">UF: *</label>
                             <input type="text" class="form-control" id="UF" name="UF" required>
                       
        <br>                
                         
                             <label for="logradouro">Logradouro: *</label>
                             <input type="text" class="form-control" id="logradouro" name="logradouro" required>
                       
        <br>              
                        
                             <label for="numero">Numero: *</label>
                             <input type="text" class="form-control" id="numero" name="numero" required>
                       
        <br>              
                      
                             <label for="complemento">Complemento: </label>
                             <input type="text" class="form-control" id="complemento" name="complemento" placeholder="Casa, Apto, Bloco...">
                       
         <br>              
                     
                             <label for="telefone">Telefone: </label>
                             <input type="text" class="form-control" id="telefone" name="telefone" placeholder="1188884444">
                        
         <br>              
                       
                             <label for="celular">Celular: *</label>
                             <input type="text" class="form-control" id="celular" name="celular" placeholder="11988884444" required>
                    
         <br>              
                         
                             <label for="email">E-mail: *</label>
                             <input type="text" class="form-control" id="email" name="email" placeholder="Exemplo@mail.com" required>
                      
                         <br>
                         <button type="submit" class="btn btn-primary">Salvar!</button>
                         
         </ul>
                 </fieldset>
             </form>
             </c:if>
        
    <br>
        <img src="img/product.png" alt ="cliente">
        <legend>Preencha os dados do produto</legend>
        <c:if test="${empty produto}">
             <form action="ProdutoServlet" method="POST">
                 <fieldset>
        <ul>
            
        <br>
                 
                             <label for="nome">Nome do produto: *</label>
                             <input type="text" class="form-control" id="nome" name="nome" required>
                         
        <br>
                      
                             <label for="modelo">Modelo / Marca: *</label>
                             <input type="text" class="form-control" id="nascimento" name="modelo" required>
                       
        <br>              
                      
                             <label for="tipo">Tipo / Categoria: *</label>
                             <input type="text" class="form-control" id="CPF" name="tipo" required>
                     
        <br>              
                       
                             <label for="preco">Preço unitário: *</label>
                             <input type="text" class="form-control" id="sexo" name="preco" placeholder="0.00" required>
                       
        <br>              
                      
                             <label for="qtdEstoque">Quantidade para estoque: *</label>
                             <input type="text" class="form-control" id="estado" name="qtdEstoque" required>
                       
         <br>              
                       
                             <label for="filial">Filial hierarquica: *</label>
                             <input type="text" class="form-control" id="UF" name="filial" placeholder="Digite o número da filial..." required>
                     
                         <br>
                         <button type="submit" class="btn btn-primary">Salvar!</button>
                    
         </ul>
                 </fieldset>        
             </form>
             </c:if>
        
        <c:if test="${not empty produto}">
             <form action="AlterarProduto" method="POST">
                 <fieldset>
        <ul>
            
        <br>
                     
                             <label for="idProduto">Código do produto: </label>
                             <input type="text" class="form-control" id="nome" name="idProduto" value = "${produto.idProduto}" readonly="true">
                       
        <br>
            
        <br>
                  
                             <label for="nome">Nome do produto: *</label>
                             <input type="text" class="form-control" id="nome" name="nome" value = "${produto.nome}" required>
                   
        <br>
                      
                             <label for="modelo">Modelo / Marca: *</label>
                             <input type="text" class="form-control" id="nascimento" name="modelo" value = "${produto.modelo}" required>
                        
        <br>              
                      
                             <label for="tipo">Tipo / Categoria: *</label>
                             <input type="text" class="form-control" id="CPF" name="tipo" value = "${produto.tipo}" required>
                  
        <br>              
                     
                             <label for="preco">Preço unitário: *</label>
                             <input type="text" class="form-control" id="sexo" name="preco" placeholder="0.00" value = "${produto.preco}" required>
                      
        <br>              
                    
                             <label for="qtdEstoque">Quantidade para estoque: *</label>
                             <input type="text" class="form-control" id="estado" name="qtdEstoque" value = "${produto.qtdEstoque}" required>
                    
         <br>              
                      
                             <label for="filial">Filial hierarquica: *</label>
                             <input type="text" class="form-control" id="UF" name="filial" value = "${produto.FKFilial}" required>
                         
                         <br>
                         <button type="submit" class="btn btn-primary">Alterar produto!</button>    
         </ul>
                 </fieldset>
             </form>
             </c:if>
    
       
    </body>
</html>
