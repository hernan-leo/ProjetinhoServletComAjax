package br.com.clinica.enums;

public enum StatusConsulta {
	
	PENDETE("Pendete"), ENCERRADA("Encerrada"), CANCELADA("Cancelada");
	
	private String valor;
	
	private StatusConsulta(String valor) {
		this.valor = valor;
		}
	
	public String getValor() {
		return valor;
	}

}
