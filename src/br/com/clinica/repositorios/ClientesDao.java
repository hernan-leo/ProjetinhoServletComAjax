package br.com.clinica.repositorios;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import br.com.clinica.interfaces.Controle;
import br.com.clinica.modelos.Clientes;
import br.com.clinica.modelos.Entidade;
import fabrica_Conexao.Conexao;

public class ClientesDao extends Conexao implements Controle<Clientes> {
	
	private String sql;
	
	

	@Override
	public void criar(Clientes clientes) {
		
		try {
		sql = "INSERT INTO CLIENTES (FUNCIONARIOS_IDFUNCIONARIOS,NOME,DATA_NASCIMENTO,TELEFONE,SENHA,SEXO)"
					+ "VALUES(?,?,?,?,?,?)";
		Connection con = getConecta();
		PreparedStatement stmt = null;
		stmt = con.prepareStatement(sql);
		
		stmt.setInt(1, clientes.getFuncionarios_idfuncionarios());
		stmt.setString(2, clientes.getNome());
		stmt.setDate(3,(java.sql.Date) clientes.getData_nascimento());	
		stmt.setString(4, clientes.getTelefone());
		stmt.setString(5, clientes.getSenha());
		stmt.setString(6, String.valueOf(clientes.getSexo()));	
		
		stmt.execute();
		stmt.close();
		
	}catch(SQLException  e) {
		System.out.println("não foi possivel criar um novo cliente");
		e.printStackTrace();
		
	}
		
	}

	@Override
	public Clientes editar(Clientes entidade) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Clientes> listar() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deletar(Clientes entidade) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public Clientes validar(Clientes clientes) {
		sql = "SELECT *  FROM CLIENTES WHERE id_clientes=? AND senha=?";
		Clientes cliente = null;
		
		try {
			Connection con = getConecta();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1,clientes.getId_clientes());
			stmt.setString(2, clientes.getSenha());
			
			ResultSet rs = null;
			rs = stmt.executeQuery();
			if(rs.next()) {
				cliente = new Clientes();
				cliente.setId_clientes(rs.getInt("id_clientes"));
				cliente.setSenha(rs.getString("senha"));
				
			}
			con.close();
		}catch(SQLException e) {
			System.out.println("não foi possivel encontrar");
			e.printStackTrace();
		}
		
		
		return cliente;
	}

	public Clientes pegaNomedoCliente(int id_clientes) { //Método que busca o nome do Cliente atráves de sua ID para impressão na sessão.
		Clientes clientes = new Clientes();
		
		try {
		sql = "SELECT id_clientes, nome FROM CLIENTES WHERE id_clientes=?";
			Connection con = getConecta();
			PreparedStatement stmt = null;
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, id_clientes);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				
				clientes.setId_clientes(rs.getInt(id_clientes));
				clientes.setNome(rs.getString("nome"));
				
				
			}
			stmt.close();
			
		}catch(SQLException e) {
			System.out.println("não foi possivel encontrar nome");
			e.printStackTrace();
			
		}finally {
			fechaConexao();
		}
		return clientes;
	}

	
	

}
	
	