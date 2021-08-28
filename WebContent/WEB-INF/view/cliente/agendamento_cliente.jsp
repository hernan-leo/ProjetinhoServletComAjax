<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Agendamento de Consultas</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" type="text/css" href="css/areacliente.css">
</head>
<body onload="dataPc()">
 <header><jsp:include page="cabecalho_cliente.jsp"></jsp:include></header>
 
        <main class="container">
          <hr>
          <!--<section class="row">
            
              <div class="col-lg-3 col-md-3"></div>
              <div class="col-lg-6 col-md-6" > -->
                <div class="jumbotron" id="form-coluna">
        
        
            <div class="form-group row">
              <label for="staticEmail" class="col-sm-2 col-form-label">Usuário</label>
              <div class="col-sm-10">
                <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="email@exemplo.com">
              </div>
            </div>
            
            <div class="form-group row">
              <label for="exampleFormControlSelect1" class="col-sm-2 col-form-label">Select de exemplo</label>
              <div class="col-sm-10">
               <form action="salvaEspecial" method="post" >
       <select class="form-control" name="especializacao" id="especializacao" onchange="submit()">
       <option>Especialidade</option>
         <option value="Cardiologia">Cardiologia</option>
         <option value="Clínica Médica">Clínica Médica</option>
       
       </select>
        </form>
     </div>
   </div>
     <div class="form-group row">
       <label for="exampleFormControlSelect1" class="col-sm-2 col-form-label">Select de exemplo</label>
       <div class="col-sm-10">
      
       <select class="form-control" id="exampleFormControlSelect1">
         <!-- Instanciando POJOs-->
      <jsp:useBean id = "medico" class="br.com.clinica.modelos.Medicos"/>  
       <jsp:useBean id = "dao" class="br.com.clinica.repositorios.MedicosDao"/>
        <!-- Instanciando POJOs-->
       <c:forEach var="medico" items="${daoListar}">
         <option>${medico.nome}</option>
         

         </c:forEach>
       </select>
  
     </div>
   </div>
        <div class="form-group row">
          <label for="calendario" class="col-sm-2 col-form-label">Data</label>
          <div class="col-auto">
              <input type="date" id="data" >
            <div class="input-group-addon">
              <span class="glyphicon glyphicon-th"></span>
          </div>
          </div>
        </div>
        </div>


        </main>
        
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
                crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
                crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
                integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
                crossorigin="anonymous"></script>
                <script type="text/javascript" src="js/scripts.js"> </script> 
                
        


</body>
</html>