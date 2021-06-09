/**
 *
 * @author Ygor Oliveira | Yasmim Candelária | Juan Dias | Filipe Vital
 */
package Servlet.Venda;

import DAO.VendaDAO;
import Model.ItemVenda;
import Model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RelatorioCategorias extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
         HttpServletRequest httpServletRequest = (HttpServletRequest) request;
         Usuario usuario = (Usuario) httpServletRequest.getSession().getAttribute("usuario");
        
        if(usuario.isGerente()){
            List<ItemVenda> listaVendas04 = VendaDAO.reporteCategorias();
            request.setAttribute("listaVendas04", listaVendas04);
            
        }else{
            
            List<ItemVenda> listaVendas04 = VendaDAO.reporteCategoriasFilial(Integer.parseInt(usuario.getFilial()));
            request.setAttribute("listaVendas04", listaVendas04);
        }
        
         request.getRequestDispatcher("/Protegido/Admin_e_Gerente/RelatorioCategorias.jsp").forward(request, response);
         
    }

}
