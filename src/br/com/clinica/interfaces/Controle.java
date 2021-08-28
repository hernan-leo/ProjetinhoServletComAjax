package br.com.clinica.interfaces;

import java.util.List;

import br.com.clinica.modelos.Clientes;

public interface Controle<Entidade> {
	
	
		
	void criar(Entidade entidade);
	
	Entidade editar(Entidade entidade);
	
	List<Entidade> listar();
	
	void deletar(Entidade entidade);
	
	Entidade validar(Entidade entidade);
	
	/*boolean testaUsuario(int entidade, String entidade2);*/

	
		
	

}
