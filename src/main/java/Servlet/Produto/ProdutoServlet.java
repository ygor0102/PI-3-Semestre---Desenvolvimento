
package Servlet.Produto;

import DAO.ProdutoDAO;
import Model.Produto;
import Model.Usuario;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ygor.oliveira
 */
public class ProdutoServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nome = request.getParameter("nome");
        String modelo = request.getParameter("modelo");
        String tipo = request.getParameter("tipo");
        double preco = Double.parseDouble(request.getParameter("preco"));
        int qtdEstoque = Integer.parseInt(request.getParameter("qtdEstoque"));
        int FKFilial = Integer.parseInt(request.getParameter("filial"));
        
        Produto produto = new Produto(nome, modelo, tipo, preco, qtdEstoque, FKFilial);
        boolean ok = ProdutoDAO.cadastrarProduto(produto);
        
        // Passo 3: Redirecionar para sucesso.jsp
            if (ok) {
                System.out.println("Sucesso!");
                response.sendRedirect("Sucesso.jsp");
            } else {
                System.out.println("Falha!");
                response.sendRedirect("Erro.jsp");
            }
   
    }
    
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        Usuario usuario = (Usuario) httpServletRequest.getSession().getAttribute("usuario");
        
        if(usuario.isGerente()){
            List<Produto> listaProdutos = ProdutoDAO.listaProdutos();
            request.setAttribute("listaProdutos", listaProdutos);
        }else{
            
            List<Produto> listaProdutos = ProdutoDAO.listaProdutosFilial(Integer.parseInt(usuario.getFilial()));
            request.setAttribute("listaProdutos", listaProdutos);  
        }
        
         request.getRequestDispatcher("/Protegido/Pesquisa.jsp").forward(request, response);
    }
    
}
