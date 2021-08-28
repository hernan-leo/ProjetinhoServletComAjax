package br.com.clinica.repositorios;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import br.com.clinica.enums.StatusConsulta;
import br.com.clinica.interfaces.Controle;
import br.com.clinica.modelos.Consultas;
import br.com.clinica.modelos.Medicos;
import fabrica_Conexao.Conexao;

/*Classe DAO da tabela Consulta */
public class ConsultasDao extends Conexao implements Controle<Consultas> {
	
	private String sql;

	@Override
	public void criar(Consultas consultas) {
		try {
			sql= "INSERT INTO CONSULTAS (id_medico, data_consulta, hora_consulta, id_clientes, status, registrada )"
					+ "VALUES(?,?,?,?,?,?)";
			Connection con = getConecta();
			PreparedStatement stmt = null;
			stmt = con.prepareStatement(sql);
			
			stmt.setInt(1, consultas.getId_medico());
			stmt.setDate(2, (java.sql.Date.valueOf(consultas.getData_consulta())));
			stmt.setTime(3,(java.sql.Time.valueOf(consultas.getHora_consulta())));
			stmt.setInt(4, consultas.getId_clientes());
			stmt.setString(5, StatusConsulta.PENDETE.toString()); //O Status da Consulta é salvo por padrão como Pendente.
			stmt.setInt(6, consultas.getRegistrada()); //É necessário salvar o Id do usuário que o registrou.
			
			stmt.execute();
			stmt.close();
			
		
			
		}catch(SQLException e) {
			System.out.println("Erro ai criar nova consulta");
			e.printStackTrace();
		}
		
	}

	@Override
	public Consultas editar(Consultas entidade) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Consultas> listar() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deletar(Consultas entidade) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public Consultas validar(Consultas entidade) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
	public List<Consultas> peganomedoMedico(int id_medico) { //Método que busca o nome do médico, comparando a Id desse,
		//salva na tabela Consulta e na tabela medicos.
		List<Consultas> lista = new ArrayList<>();
		Connection con = getConecta();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			sql = "SELECT m.id_medico, m.nome FROM medicos m JOIN consultas c ON c.id_medico = m.id_medico "
					+ "WHERE c.id_medico=? "; 
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, id_medico);
			rs = stmt.executeQuery();
			
			if (rs.next()) {
				Consultas consultas = new Consultas();
				
				
			
				consultas.setId_medico(rs.getInt("id_medico"));
				consultas.setNome(rs.getString("nome"));
				
				lista.add(consultas);
				
				
			}
			rs.close();
			stmt.close();
			
			
		}catch(SQLException  e) {
			System.out.println("não foi possivel listar");
			e.printStackTrace();
		}finally {
			fechaConexao();
		}
		
		return lista;
	}
	
	
	public boolean disponibilidade(int id_medico, LocalDate data_consulta, LocalTime hora_consulta) { //Verifica se existe essa linha na tabela consulta.
		
		boolean teste = false;
		try {
			sql = "SELECT id_medico, data_consulta, hora_consulta FROM consultas "
					+ "WHERE id_medico = ? AND data_consulta = ? AND hora_consulta = ?";
			
			Connection con = getConecta();
			PreparedStatement stmt = null;
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, id_medico);
			stmt.setDate(2,(java.sql.Date.valueOf(data_consulta)));
			stmt.setTime(3,(java.sql.Time.valueOf(hora_consulta)));
			
			ResultSet rs = stmt.executeQuery();
			teste = rs.next();
			stmt.close();
			
			
		} catch(SQLException e) {
			System.out.println("Erro Metodo disponibilidade");
			e.printStackTrace();
		}finally {
			fechaConexao();
		}
		return teste;
		
	}




}

