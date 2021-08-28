package br.com.clinica.repositorios;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.clinica.interfaces.Controle;
import br.com.clinica.modelos.Consultas;
import br.com.clinica.modelos.Especializacao;
import fabrica_Conexao.Conexao;

public class EspecializacaoDao extends Conexao implements Controle<Especializacao> {
	
	private String sql;

	@Override
	public void criar(Especializacao entidade) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Especializacao editar(Especializacao entidade) {
		
		return null;
	}

	@Override
	public List<Especializacao> listar() {
		List<Especializacao> lista = new ArrayList<>();
		try {
			sql = "SELECT * FROM ESPECIALIZACAO";
			Connection con = getConecta();
			PreparedStatement stmt = null;
			stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
			Especializacao espe = new Especializacao();
			espe.setEspe_id(rs.getInt("espe_id"));
			espe.setNome(rs.getString("nome"));
			lista.add(espe);
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
	public void deletar(Especializacao entidade) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Especializacao validar(Especializacao entidade) {
		// TODO Auto-generated method stub
		return null;
	}

	/*@Override
	public boolean testaUsuario(int entidade, String entidade2) {
		// TODO Auto-generated method stub
		return false;
	}*/
	
	

}
