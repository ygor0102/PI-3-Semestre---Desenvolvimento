<%-- 
    Document   : Login
    Created on : 13/05/2021, 20:05:18
    Author     : ygor.oliveira
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <c:import url="Header.jsp"/>
        <c:if test="${param.erroLogin}">
            <div class="alert alert-danger" role="alert">
               Erro de Login!
            </div>
        </c:if>
          <img src="img/menu.png" alt ="Logo da LIS">
        <form action="LoginServlet" method="POST">
              <fieldset>
         <br>
                <legend>Login: </legend>
                <input type="text" class="form-control" id="login" name="login" required>                  
         <br>
                         
                <legend>Senha: </legend>
                <input type="password" class="form-control" id="senha" name="senha" required>
                        
        <br>             
        <button type="submit" class="btn btn-primary">Entrar</button>
        
        </fieldset>
        </form>
        <c:import url="Footer.jsp"/>
          
    </body>
    
 
</html>
