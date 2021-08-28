package br.com.clinica.servers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import br.com.clinica.modelos.Clientes;
import br.com.clinica.modelos.Medicos;
import br.com.clinica.repositorios.ClientesDao;
import br.com.clinica.repositorios.MedicosDao;

/**
 * Servlet implementation class Login
 */
@WebServlet(
urlPatterns= {"/login_cliente"})

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	ClientesDao clientesDao = new ClientesDao(); //Instanciando classe ClienteDao no Servlet


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	

		}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String acaoSelecionada = request.getServletPath(); // Recupera a ação enviada pelo form da URL index.jsp linha 98
		/*Declarando e atribuindo as variáveis que vão receber os dados da Sessão */
		String nome = "";
		int id = 0;
		
		
		if(acaoSelecionada.equals("/login_cliente")) { // com .equals compara qual foi a ação desejada.
			
		
		/*Recebendo valores do Form e salvando nas variáveis. */
			
		String id_cliente = request.getParameter("login");
		String senha = request.getParameter("senha");
		
		/*Fazendo a conversão da String "login" para int */
		
		int id_clienteInt = 0;
		try {
			id_clienteInt = Integer.parseInt(id_cliente);
			
		}catch(NumberFormatException e) {
			System.out.println("Id inválida");
			e.printStackTrace();
		}
		
		/*Cria um objeto Cliente */
		
		Clientes clientes = new Clientes();
		
		/*Com os métodos Sets da classe Cliente inserimos os valores  */
		
		clientes.setId_clientes(id_clienteInt);
		clientes.setSenha(senha);
		
		/*Chama o método validar da classe passando o objeto recém criado */
		
		Clientes clienteAutenticado = clientesDao.validar(clientes);
		 
		if(clienteAutenticado != null) {
		/*Após o cliente validado, chamamos mais um método "pegaNome" para usar no JSP esses valores posteriormente */ 	
		clientes = clientesDao.pegaNomedoCliente(id_clienteInt); 
		nome = clientes.getNome();
		id = clientes.getId_clientes();	
		
		/*Cria um nova sessão*/
		
		HttpSession sessaoCliente = request.getSession();
		sessaoCliente.setAttribute("cliente", clienteAutenticado);
		sessaoCliente.setAttribute("id_clientes", id);
		sessaoCliente.setAttribute("nome", nome);
		sessaoCliente.setMaxInactiveInterval(30);
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/cliente/home_cliente.jsp");// Direciona para a página do cliente.
		dispatcher.forward(request, response);
		
		}else {
			System.out.println("Não logado");
			RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/index.jsp");
			dispatcher.forward(request, response);
			
		}
		
		
			
		
	}
				
		}
		
		}
		
		
		
		
	
	
	
	


