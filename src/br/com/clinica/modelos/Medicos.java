package br.com.clinica.modelos;

public class Medicos extends Entidade{


	private static final long serialVersionUID = 1L;
		private int id_medico;
		private String nome;
		private int espe_id;
		
		
		public int getId_medico() {
			return id_medico;
		}
		
		public void setId_medico(int id_medico) {
			this.id_medico = id_medico;
		}
		
		public String getNome() {
			return nome;
		}
		
		public void setNome(String nome) {
			this.nome = nome;
		}
		public int getEspe_id() {
			return espe_id;
		}
		
		public void setEspe_id(int espe_id) {
			this.espe_id = espe_id;
		}
	

}
