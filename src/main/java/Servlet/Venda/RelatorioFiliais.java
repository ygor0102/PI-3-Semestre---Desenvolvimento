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

public class RelatorioFiliais extends HttpServlet {

   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
         HttpServletRequest httpServletRequest = (HttpServletRequest) request;
         Usuario usuario = (Usuario) httpServletRequest.getSession().getAttribute("usuario");
        
        if(usuario.isGerente()){
            List<ItemVenda> listaVendas03 = VendaDAO.reporteFiliais();
            request.setAttribute("listaVendas03", listaVendas03);
            
        }else{
            
            List<ItemVenda> listaVendas03 = VendaDAO.reporteFiliaisAdmin(Integer.parseInt(usuario.getFilial()));
            request.setAttribute("listaVendas03", listaVendas03);
        }
        
         request.getRequestDispatcher("/Protegido/Admin_e_Gerente/RelatorioFiliais.jsp").forward(request, response);
         
    }
}
