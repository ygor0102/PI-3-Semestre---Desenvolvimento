/**
 *
 * @author Ygor Oliveira | Yasmim Candelária | Juan Dias | Filipe Vital
 */
package Servlet.Venda;

import DAO.VendaDAO;
import Model.Venda;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RelatorioServlet extends HttpServlet {

 @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
         List<Venda> listaVendas01 = VendaDAO.reporteSintetico();
         request.setAttribute("listaVendas01", listaVendas01);
         request.getRequestDispatcher("/Protegido/Admin_e_Gerente/RelatorioSintetico.jsp").forward(request, response);
         
    }

}
