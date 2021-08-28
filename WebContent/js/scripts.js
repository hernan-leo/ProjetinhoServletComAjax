 function dataPc(){
    var data = new Date();
    let diamin = ("0" + data.getDate()).slice(-2);
    let diamax = ("0" + data.getDate() + 30).slice(-2);
    let mes = ("0" + (data.getMonth() +1)).slice(-2);
    let ano = data.getFullYear();
    let hoje = ano + "-" + mes + "-" + diamin;
    let datamax = ano + "-" + mes + "-" + diamax;
    document.getElementById("data").value = hoje;
    document.getElementById("data").setAttribute("min", hoje);
    document.getElementById("data").setAttribute("max", datamax);



    


}

function homeCliente(){
    var home = document.getElementById("home_id");
    var agendamento = document.getElementById("agendamento");
    home.style.display = 'block';
    agendamento.style.display = 'none';
    

    
    
}

function consultas(){
    var home = document.getElementById("home_id");
    var agendamento = document.getElementById("agendamento");
    home.style.display = 'none';
    agendamento.style.display = 'block';
}






