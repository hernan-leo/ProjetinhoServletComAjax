package br.com.clinica.modelos;

import java.time.LocalDate;
import java.time.LocalTime;


public class Consultas {
	
	private int id_consulta;
	private int id_medico;
	private int id_clientes;
	private String nome;
	private LocalDate data_consulta;
	private LocalTime hora_consulta;
	private String status;
	private int registrada;
	
	public int getRegistrada() {
		return registrada;
	}
	public void setRegistrada(int registrada) {
		this.registrada = registrada;
	}
	private Medicos medicos;
	
	
	public int getId_consulta() {
		return id_consulta;
	}
	public void setId_consulta(int id_consulta) {
		this.id_consulta = id_consulta;
	}
	public int getId_medico() {
		return id_medico;
	}
	public void setId_medico(int id_medico) {
		this.id_medico = id_medico;
	}
	public int getId_clientes() {
		return id_clientes;
	}
	public void setId_cliente(int id_clientes) {
		this.id_clientes = id_clientes;
	}
	public LocalDate getData_consulta() {
		return data_consulta;
	}
	public void setData_consulta(LocalDate data_consulta) {
		this.data_consulta = data_consulta;
	}
	public LocalTime getHora_consulta() {
		return hora_consulta;
	}
	public void setHora_consulta(LocalTime hora_consulta) {
		this.hora_consulta = hora_consulta;
	}
	public Medicos getMedicos() {
		return medicos;
	}
	public void setMedicos(Medicos medicos) {
		this.medicos = medicos;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	

}
