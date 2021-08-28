<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<htmllang=”pt-br”>
<head>
  <meta charset="utf-8"/>
<title>Home Page</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" type="text/css" href="css/areacliente.css">
</head>
<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<main class="container" id="container-header">
<div class="row">
<div class="col col-md-10">
<img id="logo" src="img/logoclinicatransparente.png">
<section class="navcontainer" style= "max-width: 100%">

    <!-- Navbar -->
    
    <nav class="navbar navbar-expand-lg navbar-light" 
    style="background-color:#E8E8E8;">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03"
                    aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                  <div class="navbar-item brand"><img id="home" src="img/iconedahome.png" onclick="homeCliente()"></div>
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
          <li class="nav-item active">
            <div class="nav-link" onclick="consultas()" id="consultas">Marcar Consultas <span class="sr-only">(P�gina atual)</span></div>
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="/clinica/Select">Cancelar/Confirmar Consultas</a>
          </li>
          <li class="nav-item active">
            <a class="nav-link disabled" href="#">Seu Cadastro</a>
          </li>
        </ul>
    </nav>
    </div>

  </section>
<aside class="col col-md-2">
  <div class="container" id="containerSession">
    <p id="dadosbox" class="text-center">Olá! ${sessionScope.nome}- Código ${sessionScope.id_clientes}  </p>
   
    <form action="Logout" method="get">
    <button type="submit" class="btn btn-light" id="btnSair" value="logout">Sair</button>
    </form>
    </div>
  </div>
</aside>
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