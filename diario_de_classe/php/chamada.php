<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="../css/diarioDeClasse.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
</head>
<body>
	<div class="container-geral col-11 row">
		<header>
			<div class="cabecalho col-12 row">
				<h1>diário de classe</h1>
				<a href="../index.html"><i class="fas fa-sign-out-alt" title="sair"></i></a>
			</div>
		</header>
		<nav>
			<div onclick="botaoMenu()" class="menu-para-celular col-12 row">
				<h2>menu</h2>
				<div class="menu-bar" onclick="transformarIcone()">
					<div class="barra-superior" id="superior"></div>
					<div class="barra-central"  id="centro"></div>
					<div class="barra-inferior" id="inferior"></div>	
				</div>
			</div>
			<div class="menu col-12 row" id="menu-cel">
				<ul>
					<li><a href="notas.php">notas</a></li>
					<li><a href="turmas.php">turmas</a></li>
					<li><a href="anotacoes.php">anotações</a></li>
					<li><a href="planoDeAula.php">plano de aula</a></li>
					<li class="filho5"><a href="chamada.php">chamada</a></li>
				</ul>
			</div>
		</nav>
		<section class="col-12 row">
			<div class="container-conteudo col-12 row">
				
			</div>
		</section>
		<footer>
			<div class="rodape col-12 row">
				<p>Desenvolvido por: Robson Alves Moreira Pires.</p>
				<p>robson.amp@outlook.com</p>
			</div>
		</footer>
	</div>
	<script type="text/javascript" src="../js/diario_de_classe.js"></script>
</body>
</html>