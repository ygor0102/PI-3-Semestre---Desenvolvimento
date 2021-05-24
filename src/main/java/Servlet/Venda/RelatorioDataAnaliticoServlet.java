/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Venda;

import DAO.VendaDAO;
import Model.ItemVenda;
import Model.Usuario;
import Model.Venda;
import Servlet.Cliente.ClienteServlet;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ygor.oliveira
 */
public class RelatorioDataAnaliticoServlet extends HttpServlet {

 @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
         String dataIni = request.getParameter("start");
         String dataFim = request.getParameter("end");
         
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
        Date data01 = null;
        Date data02 = null;
     try {
          data01 = dateFormat.parse(dataIni);
          data02 = dateFormat.parse(dataFim);
     } catch (ParseException ex) {
         Logger.getLogger(RelatorioDataServlet.class.getName()).log(Level.SEVERE, null, ex);
     }
     
        String Inicial = dateFormat.format(data01);
        String Final = dateFormat.format(data02);
                 
         HttpServletRequest httpServletRequest = (HttpServletRequest) request;
         Usuario usuario = (Usuario) httpServletRequest.getSession().getAttribute("usuario");
        
        if(usuario.isGerente()){
             List<ItemVenda> listaVendas02 = VendaDAO.reporteAnaliticoPorDatas(Inicial, Final);
             request.setAttribute("listaVendas02", listaVendas02);
            
        }else{
            
            List<ItemVenda> listaVendas02 = VendaDAO.reporteAnaliticoPorDatasFilial(Inicial, Final, Integer.parseInt(usuario.getFilial()));
            request.setAttribute("listaVendas02", listaVendas02);
        }
        
         request.getRequestDispatcher("/Protegido/Admin_e_Gerente/RelatorioAnalitico.jsp").forward(request, response);
         
    }

}
