<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang=”pt-br”>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>
<header><jsp:include page="cabecalho.jsp"/></header>

<div class="container" style= "max-width: 1400px">


<!-- Cabecalho -->

<!--<header class="maincontainer">
<img id="logo" src="img\logo.jpg">


</header> -->


<div class="container-fluid">
<div class="row justify-content-md-left">
<div class="col-md-8" id="col1">

<!-- Inicio carrossel -->

<div id="caroussel" class="carousel slide" data-ride="carousel">
<ol class="carousel-indicators">
<li data-target="#caroussel" data-slide-to ="0" class="active"></li>
<li data-target="#caroussel" data-slide-to ="1"></li>
</ol>
<div class="carousel-inner">
<div class="carousel-item active">
<img id="imgcarrosel" class="d-block w-100" src="img\doutora1.jpg" alt="medica">
<div class="carousel-caption d-none d-md-block">
<h5 id="slidetext">Mauris vulputate</h5>
<p id="slidetext">Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
</div>
</div>
<div class="carousel-item">
<img id="imgcarrosel" class="d-block w-100" src="img\carousel2.jpg" alt="consultorio">
<div class="carousel-caption d-none d-md-block">
<h5 id="slidetext">Mauris vulputate</h5>
<p id="slidetext">Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
</div>
</div>
<a class="carousel-control-prev" href="#caroussel" role="button" data-slide="prev">
<span class="carousel-control-prev-icon" aria-hidden="true"></span>
<span class="sr-only">Anterior</span>
</a>
<a class="carousel-control-next" href="#caroussel" role="button" data-slide="next">
<span class="carousel-control-next-icon" aria-hidden="true"></span>
<span class="sr-only">Próximo</span>
</a>

<!-- Fim carrosel -->

</div>

</div>
<hr>
</div>

<div class="col-md-4" style="padding:0px;">
<div class="card text-center">
  <div class="card-header">
    <ul class="nav nav-tabs card-header-tabs">
      <li class="nav-item">
        <a class="nav-link active" href="#">Ativo</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#">Desativado</a>
      </li>
    </ul>
  </div>
  <div class="card-body">
    <h5 class="card-title">Login</h5>
  <form action="login_cliente" method= "post" >
    <div class="form-group row">
    <label for="labelLogin1" class="col-sm-4 col-form-label">Login</label>
    <div class="col-sm-8">
    <input type="text" class="form-control" name="login">
    </div>
    </div>
    <div class="form-group row">
    <label for="labelsenha1" class="col-sm-4 col-form-label">Senha</label>
    <div class="col-sm-8">
    <input type="password" class="form-control"  name="senha">
    </div>
    </div>
    <input type="submit" class="btn btn-primary" value="login"/>
    </form>
    
  </div>
  
</div>
</div>

</div>
</div>
</div>

</body>
</html>