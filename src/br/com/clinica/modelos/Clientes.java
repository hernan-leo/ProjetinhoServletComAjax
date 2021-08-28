package br.com.clinica.modelos;

import java.util.Date;

public class Clientes extends Entidade{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id_clientes;
	private int funcionarios_idfuncionarios;
	private String nome;
	private Date data_nascimento;
	private String telefone;
	private String senha;
	private char sexo;
	
	
	public int getId_clientes() {
		return id_clientes;
	}
	public void setId_clientes(int id_clientes) {
		this.id_clientes = id_clientes;
	}
	
	public int getFuncionarios_idfuncionarios() {
		return funcionarios_idfuncionarios;
	}
	public void setFuncionarios_idfuncionarios(int funcionarios_idfuncionarios) {
		this.funcionarios_idfuncionarios = funcionarios_idfuncionarios;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public Date getData_nascimento() {
		return data_nascimento;
	}
	public void setData_nascimento(Date data_nascimento) {
		this.data_nascimento = data_nascimento;
	}
	public String getTelefone() {
		return telefone;
	}
	
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	public char getSexo() {
		return sexo;
	}
	
	public void setSexo(char sexo) {
		this.sexo = sexo;
	}
	
	public enum Genero {
		
		MASCULINO('M'), FEMININO('F');
		
		private char descricao;

		Genero(char descricao) {
			this.descricao = descricao;
		}
		
		public char getSexo() {
			return this.descricao;
		}
		
		public void imprime() {
			System.out.println(Genero.FEMININO.getSexo());
		}
	}
	

}
