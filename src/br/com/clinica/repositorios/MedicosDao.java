package br.com.clinica.repositorios;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.clinica.interfaces.Controle;
import br.com.clinica.modelos.Medicos;
import fabrica_Conexao.Conexao;

public class MedicosDao  extends Conexao implements Controle<Medicos> {

	private String sql;

	@Override
	public void criar(Medicos entidade) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Medicos editar(Medicos entidade) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Medicos> listar() {
		List<Medicos> lista = new ArrayList<>();
		try {
			sql = "SELECT * FROM MEDICOS";
			Connection con = getConecta();
			PreparedStatement stmt = null;
			stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Medicos medicos = new Medicos();
				medicos.setId_medico(rs.getInt("id_medico"));
				medicos.setNome(rs.getString("nome"));
				medicos.setEspe_id(rs.getInt("espe_id"));
				lista.add(medicos);
				
				
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

	@Override
	public void deletar(Medicos entidade) {
		// TODO Auto-generated method stub
		
	}


	
	public List<Medicos> listarPorEspecialidade(int  espe_id) {
		List<Medicos> lista = new ArrayList<>();
		Connection con = getConecta();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			sql = "SELECT * FROM MEDICOS WHERE espe_id=?";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, espe_id);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Medicos medicos = new Medicos();
				medicos.setId_medico(rs.getInt("id_medico"));
				medicos.setNome(rs.getString("nome"));
				medicos.setEspe_id(rs.getInt("espe_id"));
				lista.add(medicos);
				
				
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

	@Override
	public Medicos validar(Medicos entidade) {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
