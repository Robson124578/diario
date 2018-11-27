<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="../css/diarioDeClasse.css">
	<link rel="stylesheet" type="text/css" href="../css/turma.css">
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
					<li class="filho2"><a href="turmas.php">turmas</a></li>
					<li><a href="anotacoes.php">anotações</a></li>
					<li><a href="planoDeAula.php">plano de aula</a></li>
					<li><a href="chamada.php">chamada</a></li>
				</ul>
			</div>
		</nav>
		<section class="col-12 row">
			<div class="container-conteudo col-12 row">
				<div class="botao col-12 row" onclick="botaoGeral()">
					<i class="fas fa-plus-circle" title="Adicionar Plano de Aula."></i>
					<h3 title="Adicionar Plano de Aula." id="adicionar">Adicionar Turma</h3>
				</div>
				<div class="insercao-turma row col-12" id="insercaoTurma">
					<form action="../dao/tbTurma.php" method="post">
						<label for="nome-turma">nome da turma:</label>
						<input type="text" name="tb_turma_nome" id="nome-turma" placeholder="Preencha aqui..." title="Digite o nome da Turma">
						<label for="serie-turma">serie:</label>
						<input type="text" name="tb_turma_serie" id="serie-turma" placeholder="Preencha aqui..." title="Digite a Série da turma">
						<label for="id_periodo">periodo:</label>
						<input type="texte" name="tb_turma_periodo" id="id_periodo">
						<label for="qtd-alunos">quantidade de alunos:</label>
						<input type="number" min="1" max="100" name="tb_turma_qtd_alunos" id="qtd-alunos" placeholder="Preencha aqui..." title="Selecione a Quantidade de Alunos.">
						<label for="disciplina-turma">disciplina ministrada:</label>
						<input type="text" name="tb_turma_disciplina_ministrada" id="disciplina-turma" placeholder="Preencha aqui..." title="">
						<button type="submit" title="Salvar Cadastro de Turma.">Enviar</button>
					</form>
				</div>
				<div class="turmas col-12 row">
					<h3>Suas Turmas.</h3>
					<?php
							include("../dao/conexao.php");

							$sql = "SELECT tb_turma_id, tb_turma_nome, tb_turma_serie, tb_turma_periodo, tb_turma_qtd_alunos, tb_turma_disciplina_ministrada FROM tb_turma";
							$result = $conn->query($sql);
							echo"<table>";
								if ($result->num_rows > 0) {
									while ($row = $result->fetch_assoc()) {
										echo "<thead><tr><th>turma</th><th>serie</th><th>periodo</th><th>n° de alunos</th><th>discliplina</th></tr></thead><tr><td>"
									}
								} else { echo""; }
							echo"</table>";
					$conn->close();		
					?>
				</div>
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