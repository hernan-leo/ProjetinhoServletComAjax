package fabrica_Conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Conexao {
	final static private String driver = "org.postgresql.Driver";
	final static private String usuario = "postgres";
	final static private String senha = "admin";
	final static private String url = "jdbc:postgresql://localhost:5432/clinica";
	
	Connection conn;
	PreparedStatement stmt;
	ResultSet rs;
	
	public Connection getConecta() {
		try {
			Class.forName(driver);

		} catch (ClassNotFoundException ex) {
			System.out.println("Driver não encontrado");
			ex.printStackTrace();

		}
		try {
			
			conn = DriverManager.getConnection(url, usuario, senha);
		}catch(SQLException e) {
			System.out.println("Url,Usuario ou senha incorretos");
			throw new RuntimeException(e);
		}
		return conn;
	}
	public void fechaConexao() {
		try {
		 conn.close();
		 System.out.println("Conexao Fechada");
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
