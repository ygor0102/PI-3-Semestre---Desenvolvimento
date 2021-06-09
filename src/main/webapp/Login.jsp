<%-- 
    Document   : Login
    Author     : Ygor Oliveira | Yasmim Candelária | Juan Dias | Filipe Vital
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
               Senha ou usuário incorretos!
            </div>
        </c:if>
          
    <center><form action="LoginServlet" method="POST">
            <img src="img/menu.png" alt ="Logo da LIS">
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
        </form></center>
        <c:import url="Footer.jsp"/>
          
    </body>
    
 
</html>
