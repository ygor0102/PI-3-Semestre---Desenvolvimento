/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Cliente;

import DAO.ClienteDAO;
import Model.Cliente;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
public class AlterarCliente extends HttpServlet {
    
     // Recuperar o cliente e direcionar para tela de atualização
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String cpf = request.getParameter("cpf");
        Cliente cliente = ClienteDAO.getCliente(cpf);
        
        request.setAttribute("cliente", cliente);
        
         request.getRequestDispatcher("/Protegido/Cadastro.jsp").forward(request, response);
        
        
    }

    // Atualizar o BD e direcionar para tela de sucesso
   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         // Passo 1: Recuperar dados do formulário
        String nome = request.getParameter("nome");
        Date nascimento = null;
        try {
            nascimento = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("nascimento"));
        } catch (ParseException ex) {
            Logger.getLogger(ClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        String CPF = request.getParameter("CPF");
        String sexo = request.getParameter("sexo");
        String estado = request.getParameter("estado");
        String UF = request.getParameter("UF");
        String logradouro = request.getParameter("logradouro");
        int numero = Integer.parseInt(request.getParameter("numero"));
        String complemento = request.getParameter("complemento");
        String telefone = request.getParameter("telefone");
        String celular = request.getParameter("celular");
        String email = request.getParameter("email");
         
         Cliente cliente = new Cliente(nome, nascimento, CPF, sexo, estado, 
                                            UF, logradouro, numero, complemento, telefone, celular, email);
         boolean ok = ClienteDAO.atualizarCliente(cliente);
         
          // Passo 3: Redirecionar para sucesso.jsp
            if (ok) {
                System.out.println("Sucesso!");
                response.sendRedirect("Sucesso.jsp");
            } else {
                System.out.println("Falha!");
            }
    }
    
}
