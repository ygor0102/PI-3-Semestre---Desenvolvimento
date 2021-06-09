/**
 *
 * @author Ygor Oliveira | Yasmim Candelária | Juan Dias | Filipe Vital
 */
package Servlet.Venda;

import DAO.VendaDAO;
import Model.ItemVenda;
import Model.Usuario;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RelatorioAnaliticoServlet extends HttpServlet {

 @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
         
         
         HttpServletRequest httpServletRequest = (HttpServletRequest) request;
         Usuario usuario = (Usuario) httpServletRequest.getSession().getAttribute("usuario");
        
        if(usuario.isGerente()){
            List<ItemVenda> listaVendas02 = VendaDAO.reporteAnalitico();
            request.setAttribute("listaVendas02", listaVendas02);
            
        }else{
            
            List<ItemVenda> listaVendas02 = VendaDAO.reporteAnaliticoFilial(Integer.parseInt(usuario.getFilial()));
            request.setAttribute("listaVendas02", listaVendas02);
        }
        
         request.getRequestDispatcher("/Protegido/Admin_e_Gerente/RelatorioAnalitico.jsp").forward(request, response);
         
    }

}
