package br.com.clinica.servers;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.time.DateTimeException;
import java.time.LocalDate;
import java.time.LocalTime;
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
import br.com.clinica.modelos.Consultas;
import br.com.clinica.modelos.Especializacao;
import br.com.clinica.modelos.Medicos;
import br.com.clinica.repositorios.ConsultasDao;
import br.com.clinica.repositorios.EspecializacaoDao;
import br.com.clinica.repositorios.MedicosDao;

/**
 *Servlet para trabalhar com Ajax do aplicativo de Consultas 
 */
@WebServlet("/listajax")
public class Listajax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
  
  

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		
		

			//Instanciando classes repositórios
		
			MedicosDao daoMedico = new MedicosDao();
			EspecializacaoDao dao = new EspecializacaoDao();
			
 			
			//Recebendo qual operação foi requisitada pela URL, dessa vez, sem o .equals.
			
			String acao = request.getParameter("operation");
			
			
			
			if(acao.equals("especializacao")) { //Verifica qual a especialização médica escolhida
				
				List<Especializacao> listaespecializacao = dao.listar(); // Lista os tipos de especialização salva no BD com o metodo .listar
				Gson json = new Gson(); //Instanciamos a biblioteca GSON para converter os dados recebidos do BD em JSON.
				String medicoList = json.toJson(listaespecializacao); // Atribui a variável uma lista com o formato JSON
				response.setContentType("text/html"); //Informando qual será o tipo de dados da resposta
				response.getWriter().write(medicoList); // Imprimindo a lista
			}
			
			if(acao.equals("listaMedicos")) { //Com a especialização escolhida podemos listar os nomes dos médicos
				
				int especial = Integer.parseInt(request.getParameter("especial")); 
				List<Medicos> listaMedicos = daoMedico.listarPorEspecialidade(especial); //Chama o método que recebera a Id da esoecialização e listará os médicos.
				Gson json = new Gson();
				String medicoList = json.toJson(listaMedicos);
				response.setContentType("text/html");
				response.getWriter().write(medicoList);
			}
			
			
			
			
		}

	
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		ConsultasDao daoConsulta = new ConsultasDao(); //Instanciando classe controladora da Consulta
		String acao = request.getParameter("operation");
		
		
		if(acao.equals("checkaRow")) { // Quando o botão "Buscar" foi acionado no HTML o Ajax enviará para o Servlet a Id do médico, data e hora da consulta.
			//Esses dados serão convertidos para os formados salvos no Banco e depois verifica se existir uma linha com esses dados nele.
			
			int id_medicoInt = 0;
			LocalDate dataBd = LocalDate.now();
			LocalTime hora_consulta = LocalTime.now();
			String hora_string = request.getParameter("horarios");
			String id_medico = request.getParameter("id_medico_ajax");
			String dataOk = request.getParameter("dataOk");
			
			try {
			dataBd = LocalDate.parse(dataOk);
			}catch(DateTimeException e) {
				System.out.println("Formato de data invalida");
				e.printStackTrace();
			}
			try {
				id_medicoInt = Integer.parseInt(id_medico);
			}catch(NumberFormatException e) {
				System.out.println("Id formato inválida");
				e.printStackTrace();
			}
			try {
				hora_consulta = LocalTime.parse(hora_string);
			}catch(DateTimeException e) {
				System.out.println("Horario formato inválida");
				e.printStackTrace();
			}
			
			if(daoConsulta.disponibilidade(id_medicoInt, dataBd , hora_consulta)) { 
			/*Caso a consulta retorne uma linha, o banco retorna true e entra nesse If que retornará "" para o Ajax */	
				
				
				
			}else { //Senão o Servlet enviará a lista com os dados pedidos pela função no Ajax.
				int id_medico_ajax = Integer.parseInt(request.getParameter("id_medico_ajax"));
				List<Consultas> listaConsultas = daoConsulta.peganomedoMedico(id_medico_ajax);
				Gson json = new Gson();
				String listaConsulta = json.toJson(listaConsultas);
				response.setContentType("application/json"); //Dessa vez o tipo de resposta será um JSON
				response.getWriter().write(listaConsulta);
				
			}
		
			
			
			
			
		}
		
		if(acao.equals("confirmaConsulta")) { //Salva no Banco de dados uma nova Consulta
			
			Clientes cliente = (Clientes)request.getSession().getAttribute("cliente"); //O Id do solicitante será retirado a sessão existente
			
			int id_medico_consulta = 0;
			
			LocalDate dataBd = LocalDate.now();
			LocalTime hora_consulta = LocalTime.now();
			String hora_string = request.getParameter("horarios");
			String id_medico = request.getParameter("id_medico");
			String dataOk = request.getParameter("dataConsulta");
			int id_cliente_logado = cliente.getId_clientes(); // Salvando a ID em um variável para nmelhor manipulação.
			
			try {
				dataBd = LocalDate.parse(dataOk);
				}catch(DateTimeException e) {
					System.out.println("Formato de data invalida");
					e.printStackTrace();
				}
				try {
					id_medico_consulta = Integer.parseInt(id_medico);
					
				}catch(NumberFormatException e) {
					System.out.println("Id formato inválida");
					e.printStackTrace();
				}
				try {
					hora_consulta = LocalTime.parse(hora_string);
				}catch(DateTimeException e) {
					System.out.println("Horario formato inválida");
					e.printStackTrace();
				}
				//Depois das conversões, instanciamos uma nova Consulta e atribuimos valores utilizando seus métodos Sets.
				
				Consultas consultas = new Consultas();
				consultas.setId_medico(id_medico_consulta);
				consultas.setData_consulta(dataBd);
				consultas.setHora_consulta(hora_consulta);
				consultas.setId_cliente(id_cliente_logado);
				consultas.setRegistrada(id_cliente_logado);
				//E finalmente salvamos no BD os dados com o método "criar" da classe "daoConsulta'
				daoConsulta.criar(consultas);
		}
	}

}
