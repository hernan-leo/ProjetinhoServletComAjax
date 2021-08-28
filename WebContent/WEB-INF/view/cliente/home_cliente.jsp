<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang=”pt-br”>
<head>
<meta charset=”UTF-8”>
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Área do Cliente</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
   
        <link rel="stylesheet" type="text/css" href="css/areacliente.css">
</head>
<body onload="dataPc()">
     
<header><jsp:include page="cabecalho_cliente.jsp"></jsp:include></header>

<!-- Inicio Home-->

<main id="home_id"class="container-fluid" style= "max-width: 100%;">
  <div class="row justify-content-md-left">  
  <section class="col-md-4 col-lg-4">
    <picture>
      <source srcset="img/calendarioteste.png" media="(min-width:600px)">
    <img href="#" id="calendario" src="img/calendariopequeno.png">
   </picture>
    <div class="desc"> Marcar Consultas</div>
 
 </section> 
  <section class="col-md-4 col-lg-4">
    <picture>
      <source srcset="img/consultas_cliente.png" media="(min-width:600px">
   <img id="relatorio" src="img/consultas_pequeno.png">
   </picture>
   <div class="desc"> Histórico</div>
 
 </section> 
 <section class="col-md-4 col-lg-4">
   <picture>
     <source srcset="img/cadastro_cliente.png" media="(min-width:600px">
  <img id="relatorio" src="img/cadastro_cliente_mob.png">
  </picture>
  <div class="desc"> Dados de Cadastro</div>
 
 </section>
  </div>
 </main>
 
<!--Inicio agendamento-->
 
 <main id="agendamento" class="container">
   <hr>
   <!--<section class="row">
     
       <div class="col-lg-3 col-md-3"></div>
       <div class="col-lg-6 col-md-6" > -->
         <div class="jumbotron" id="form-coluna">
 
 <form>
     <div class="form-group row">
       <label for="staticEmail" class="col-sm-2 col-form-label">Usuário</label>
       <div class="col-sm-10">
        <input type="text" readonly class="form-control-plaintext" value= "${sessionScope.nome}">
       </div>
     </div>
     
 
     <div class="form-group row">
   
       
       <label for="exampleFormControlSelect1" class="col-sm-2 col-form-label">Especialidade</label>
       
       <div class="col-sm-10">
       
       <select class="form-control" name="especializacao" id="especializacao">
       <option>Especialidade</option>
         
       
       </select>
       
     </div>
   </div>
     <div class="form-group row">
       <label for="exampleFormControlSelect1" class="col-sm-2 col-form-label">Médicos</label>
       <div class="col-sm-10">
      
       <select class="form-control" id="listaMedicos" required> 
       <option> Selecione o Medico</option>
        </select>
         <!-- Instanciando POJOs
      <jsp:useBean id = "medico" class="br.com.clinica.modelos.Medicos"/>  
       <jsp:useBean id = "dao" class="br.com.clinica.repositorios.MedicosDao"/>
        Instanciando POJOs
       <c:forEach var="medico" items="${daoListar}">
         <option>${medico.nome}</option>
         

         </c:forEach>-->  
      
  
     </div>
   </div>
  
 
 <div class="form-group row">
 
   <label for="calendario" class="col-sm-2 col-form-label">Data</label>
   <div class="col-auto">
       <input type="date" id="data" required>
     <!--  <div class="input-group-addon">  -->
       <span class="glyphicon glyphicon-th"></span>      
   </div>   
  </div> 
 
 <div class="form-group row">
   <label for="labelHorario" class="col-sm-2 col-form-label">Horários</label>
   <div class="col-auto">
    <select class="form-control" id="horarios"> 
       <option value="08:00"> 08:00 </option>
       <option value="09:00"> 09:00 </option>
       <option value="10:00"> 10:00 </option>
       <option value="11:00"> 11:00 </option>
       <option value="12:00"> 12:00 </option>
        </select>
      </div>
   
 <!-- Botão Consultar --> 
 </div>
   <div class="btnconsulta">
   <button type="button" class="btn btn-secondary" id="btnBuscar"> Buscar </button>
  </div>
 </div>
 </form>
<hr>
<table id="tableConsulta" class="table table-hover">
 <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Médico</th>
      <th scope="col">Data Consulta</th>
      <th scope="col">Horário</th>
      <th scope="col">Confirmar</th>
     
    </tr>
  </thead>

</table>


 
 

 
 </main>
 


 <script type="text/javascript" src="js/scripts.js"> </script> 
 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
 integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
 crossorigin="anonymous"></script>
 <script src="http://code.jquery.com/jquery-latest.min.js"></script>
 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" ></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/5.5.2/bootbox.min.js"></script>     


  <script type="text/javascript" src="js/ajax.js"> </script> 
 
</body>
</html>