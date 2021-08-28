$(document).ready(function () {



//Códigos Ajax retirados do Tutorial: https://www.techtutorial.cn/2020/08/dynamic-dependent-selec-option-using-jsp-servlet-mysql-and-jquery-ajax.html
      $.ajax({
        url: "/clinica/listajax", //Endereço Servlet
        method: "GET", //Método HTTP, Post, GET, PUT etc
        data: {operation: 'especializacao'} , //Parâmetros: Variável: 'valor'
        success: function (data, textStatus, jqXHR) { //Se tudo ter certo, chama uma função passando 3 argumentos.
        console.log(data);
        let obj = $.parseJSON(data); //converte a respota do servlet em JSON.
            $.each(obj, function (key, value) { //loop do jquery para criar a lista.
                $('#especializacao').append('<option value="' + value.espe_id + '">' + value.nome +'</option>') //O <option> é criado dinamicamente pelo Jquery
                 //value.espe.id é o Id da especialização(que não será impressa) e o value.nome que é o nome da especialização.
            });
          
        },
        error: function (jqXHR, textStatus, errorThrown) { //caso o retorno falhe, haverá essa tratarativa:
            $('#especializacao').append('<option>Especialidades não encontradas</option>');
        },
        cache: false
    });

    $('#especializacao').change(function () { //Mudando o valor #especializacao essa função é chamada:
       
        $('#listaMedicos').find('option').remove();//Remove os valores no option dos médicos.
        $('#listaMedicos').append('<option>Selecione o Médico</option>'); //Inseri novamente o valor inicial.

       let med = $('#especializacao').val();
console.log(med);
       let data = {operation: "listaMedicos",
       especial: med};

         $.ajax({
            url: "/clinica/listajax",
            method: "GET",
            data: data,
            success: function(data, textStatus, jqXHR){
            console.log(data);
            let obj = $.parseJSON(data);
            $.each(obj, function (key, value){
                    $('#listaMedicos').append('<option value="' + value.id_medico + '">' + value.nome + '</option>')
               
                });
                
            },
            error: function (jqXHR, textStatus, errorThrown){
                    $('#listaMedicos').append('<option>Lista não encontrada</option>');
            },
            cache: false
        });
       
    });
});





//Função do botão "Buscar" 
$(document).on('click',"#btnBuscar", function(){
	$('#tableConsulta').find('tbody').remove();//Remove a linha da tabela para evitar duplicidade na busca.
	//Atribui os valores dos options e da data nas variáveis 
     let id_medico = $('#listaMedicos').val();
     //let nome_medico = $('#listaMedicos').nome;
     let horario = $('#horarios').val();
     verificafds(); //Chama função que válida se é sabado ou domingo.
     
if(dataOk == null){ //Caso a função verificadfs() retorne "null"
	bootbox.alert("Consultas apenas em dias úteis")
	 $('#tableConsulta').find('tbody').remove();

}else{


 /*Código Ajax adaptado do turorial: https://stackoverflow.com/questions/4112686/how-to-use-servlets-and-ajax*/
     
$.post("/clinica/listajax", {operation	: 'checkaRow', //Envia os valores por método post para o servlet "listajax", operação "chekarow"
//e assim comparar com o BD
 id_medico_ajax : id_medico, dataOk : dataOk, horarios: horario }, function(responseJson) { //Se existir uma linha com os mesmos dados enviados então o retorno é ""

	if(responseJson.length != 0){ //Caso contrario, o retorno é um array e entrará nesse if
	$('#tableConsulta').find('tbody').remove();
	var $tbody = $("<tbody>").appendTo($("#tableConsulta"));
	$.each(responseJson, function(index, consulta){ //Loop que irá popular a tabela.
		$("<tr>").appendTo($tbody)
		.append($("<td>").text(consulta.id_medico))
		.append($("<td>").text(consulta.nome))
		.append($("<td>").text(dataOk))
		.append($("<td>").text(horario))
		.append($("<td <button type='button' class='btn btn-primary btn-sm' id='confirmaConsulta'> Sim </button>")) //Cria o botão de confirmar dinamicamente
		.append($("<td <button type='button' class='btn btn-warning btn-sm' id='limpa_linha'> Não </button>")); //Cria o botão de limpar dinamicamente
		console.log(responseJson.length);
	});	
	}else{
		$('#tableConsulta').find('tbody').remove();
		bootbox.alert({ //Biblioteca javascript que permite criar caixas de diálogos em bootstrap de forma super simples. http://bootboxjs.com/
		title: "Confirmação",
		message: "Data ou Horário indisponível"})
		console.log(responseJson.length);
	
}});
}
/*Verfica se a data não é final de semana */
function verificafds(){
	var data = $("#data").val();
	var v_fds = new Date(data);
	 v_fds.getDay() == 5 || v_fds.getDay() == 6 ? dataOk = null : dataOk = data;
	
}
return dataOk;

            
            
      
   
}) ;

/*Funcão que salva os dados da consulta no BD ao clicar em "Sim" */
$(document).on('click', '#confirmaConsulta',function(){
	
	$('#tableConsulta').each(function(){ //Loop que ira percorrer a tabela 
	//seleciona um elemento da tabela com um número especifico e atribuir na variável.
		let id_medico_consulta = $(this).find("td").eq(0).html(); // Começando do 0 da esquerda para direita.
		let nome_medico = $(this).find("td").eq(1).html();
		let data_consulta = $(this).find("td").eq(2).html();
		let hora_consulta = $(this).find("td").eq(3).html();
		console.log(id_medico_consulta, nome_medico, data_consulta, hora_consulta);
		
	bootbox.confirm("Confirma consulta com: " + nome_medico + " dia: " + data_consulta + " horas: "  + hora_consulta + " ?" , function(resultado){
		console.log(id_medico_consulta, nome_medico, data_consulta, hora_consulta);
		/*Após a confirmação que é realizada por uma caixa de diálogo os dados são enviados para o Serlvet */
		if(resultado){
			$.ajax({
			 url: "/clinica/listajax",
            method: "POST",
            data:  {operation: "confirmaConsulta",
         id_medico: id_medico_consulta, dataConsulta: data_consulta, horarios: hora_consulta  }

          })
        /*Callbacks*/
         .done(function(){
	     $('#tableConsulta').find('tbody').remove();
	     bootbox.alert({
		title: "Confirmação",
		message: "Cancele ou verifique a consulta em Histórico de Consultas"
	})
	})
	    .fail(function(){
		$('#tableConsulta').find('tbody').remove();
	     bootbox.alert({
		title: "Erro servidor",
	})

	
});
	/*A linha da tabela é removida se a confirmação da caixa de diálogo for negativa */ 	
		}else{
		$('#tableConsulta').find('tbody').remove();	
			
			
		}
	});
	
	});
	
	
	
		});
		$(document).on('click', '#limpa_linha', function(){
	$('#tableConsulta').find('tbody').remove();	
});	
		
	






