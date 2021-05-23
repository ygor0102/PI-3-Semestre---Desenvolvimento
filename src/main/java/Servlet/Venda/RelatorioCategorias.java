/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Venda;

import DAO.VendaDAO;
import Model.ItemVenda;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ygor.oliveira
 */
public class RelatorioCategorias extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
         List<ItemVenda> listaVendas04 = VendaDAO.reporteCategorias();
         request.setAttribute("listaVendas04", listaVendas04);
         request.getRequestDispatcher("/Protegido/Admin_e_Gerente/RelatorioCategorias.jsp").forward(request, response);
         
    }

}
