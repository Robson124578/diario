<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<meta charset="utf-8">
	<script src="../js/jquery.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="sortcut icon" href="img/favicon.ico.png" type="image/png" />;
	<link rel="stylesheet" type="text/css" href="../css/diarioDeClasse.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="../css/anotacoes.css">
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
					<li class="filho3"><a href="anotacoes.php">anotações</a></li>
					<li><a href="planoDeAula.php">plano de aula</a></li>
					<li><a href="chamada.php">chamada</a></li>
				</ul>
			</div>
		</nav>
		<section class="col-12 row">
			<div class="container-conteudo col-12 row">
				<div class="botao col-12 row" onclick="botaoanotacoes()">
					<i class="fas fa-pencil-alt" title="Adicionar anotação."></i>
					<h3 title="Adicionar anotação." id="adicionar">Adicionar Anotação</h3>
				</div>
				<div class="insercao-anotacao col-12 row" id="idAnotacao">
					<form  action="../dao/tbAnotacao.php?acao=cadastrar" method="post">
							<label for="anotacao-assunto">assunto:</label>
							<input type="text" name="tb_anotacao_assunto" id="anotacao-assunto" required>
							<label for="anotacao-data">data:</label>
							<input type="date" name="tb_anotacao_data_criacao" id="anotacao-data" required>	
							<label for="info">Anotação:</label><br>
							<textarea id="info" name="tb_anotacao_anotacao" required></textarea><br>
							<button type="submit" title="Salvar Anotação">Salvar</button>
					</form>
				</div>
				<div class="anotacoesSalvas col-12 row" id="idAnotacoesSalvas">
					<h3>Registro de Anotações</h3>
					<div class="anotacao col-12 row" id="anot">
						<h4>minhas anotações</h4>
						<?php 

							include("../dao/conexao.php");

							$sql = "SELECT tb_anotacao_id_anotacao, tb_anotacao_assunto, tb_anotacao_data_criacao, tb_anotacao_anotacao FROM tb_anotacao";
							$result = $conn->query($sql);

								echo "<table class='tabela'>";
							if ($result->num_rows > 0) {
									while($row = $result->fetch_assoc()) {
										echo "<thead><tr><th>assunto</th><th>data</th><th>anotação</th><th>editar</th><th>Excluir</th></tr></thead><tr><td>" . $row["tb_anotacao_assunto"] . "</td><td>" . $row["tb_anotacao_data_criacao"] . "</td><td>" . $row["tb_anotacao_anotacao"]  . "</td><td class='anotacao-btn-alterar'><button data-id='div".$row["tb_anotacao_id_anotacao"]."'>alterar</button></td>
										<td>
											<form  action='../dao/tbAnotacao.php?acao=excluir' method='post'>
												<input type='hidden' name='tb_anotacao_id_anotacao' value='".$row["tb_anotacao_id_anotacao"]."'>
												<input type='hidden' name='acao' value='excluir'>
												<button type='submit' title='excluir Anotação'>excluir</button>
											</form>
										</td>
										</tr> 
										 <tr><td colspan='5'>

											<div id='div".$row["tb_anotacao_id_anotacao"]."' class='cont-edit-anotacao'>
													<form  action='../dao/tbAnotacao.php?acao=alterar' method='post'>
														<input type='hidden' name='tb_anotacao_id_anotacao' value='".$row["tb_anotacao_id_anotacao"]."'>
														<input title='data' type='date' name='tb_anotacao_data_criacao' id='anotacao-data' required >	
														<input title='assunto' type='text' name='tb_anotacao_assunto' id='anotacao-assunto' required >
														<textarea title='anotação' id='info' name='tb_anotacao_anotacao' required ></textarea>
														<button type='submit' title='Salvar Anotação'>Salvar</button>
													</form>
											</div>
										</td></tr>";
									}
							} else {
								echo "<tr><td>Sem Anotações (-_-)</td></tr>";
							}
							echo"</table>";
						$conn->close();	
						 ?>
					</div>
				</div>
			</div>
		</section>
		<footer>
			<div class="rodape col-12 row" id="rodapee">
				<p>Desenvolvido por: Robson Alves Moreira Pires.</p>
				<p>robson.amp@outlook.com</p>
			</div>
		</footer>
	</div>
	<script type="text/javascript" src="../js/diario_de_classe.js"></script>
	<script type="text/javascript"> 
		$(document).ready(function(){
			$(".anotacao-btn-alterar").on("click", "button",function(){
				var valor = $(this).attr("data-id");

				$("#"+valor+"").toggle("slow");
			});
		});
	</script>
</body>
</html>