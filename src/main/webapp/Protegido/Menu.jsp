<%-- 
    Document   : Menu
    Author     : Ygor Oliveira | Yasmim Candelária | Juan Dias
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/menu.css">
        <title>Menu</title>
        
      <header>  
        <div id="navbar">
            
            <a class="nav-link" href="index.jsp">Menu</a>
            <a class="nav-link" href="VendaServlet">Realizar vendas</a>
            <a class="nav-link" href="ClienteServlet">Gerenciar clientes e produtos</a>
             <c:if test="${sessionScope.usuario.isGerente() || sessionScope.usuario.isAdmin()}">
                 <a class="nav-link" href="Admin_e_Gerente/RelatorioServlet">Extrair relatórios</a>
          </c:if>
        </div>
        <script>     
          // When the user scrolls the page, execute myFunction
            window.onscroll = function() {myFunction()};

            // Get the navbar
                var navbar = document.getElementById("navbar");

           // Get the offset position of the navbar
            var sticky = navbar.offsetTop;

            // Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
            function myFunction() {
            if (window.pageYOffset >= sticky) {
             navbar.classList.add("sticky")
        }
        else {
             navbar.classList.remove("sticky");
  }
}
        </script>
          
        </header>
    </body>
</html>
