/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Venda;

import DAO.VendaDAO;
import Model.ItemVenda;
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
public class RelatorioAnaliticoServlet extends HttpServlet {

 @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
         List<ItemVenda> listaVendas02 = VendaDAO.reporteAnalitico();
         request.setAttribute("listaVendas02", listaVendas02);
         request.getRequestDispatcher("/Protegido/Admin_e_Gerente/RelatorioAnalitico.jsp").forward(request, response);
         
    }

}
