<?php

include("conexao.php");

///////////////////////////////////////////
///Criando a Tabela Turma
///////////////////////////////////////////

// $sql = "CREATE TABLE tb_turma (tb_turma_id 						INT(100) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
// 							   	  tb_turma_nome 					VARCHAR(50) NOT NULL,
// 							   	  tb_turma_serie					VARCHAR(20) NOT NULL,
// 							      tb_turma_periodo 				    VARCHAR(20) NOT NULL,
// 							      tb_turma_qtd_alunos 				VARCHAR(50) NOT NULL,
// 							      tb_turma_disciplina_ministrada 	VARCHAR(50) NOT NULL,
// 							      tb_turma_data 					TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP
									   
// 									   )";

// if ($conn->query($sql) === TRUE) {
// 	echo "Tabela Criada com sucesso !!!";
// } else {
// 	echo "Tabela Criada Com Sucesso " . mysqli_error($conn);
// }


///////////////////////////////////////////
///Adicionando dados
///////////////////////////////////////////

foreach ($_POST as $variavel => $valor) {
	$$variavel = $valor;

	echo "<br>" . $variavel . "=" . $valor;
}

$sql = "INSERT INTO tb_turma (tb_turma_nome, tb_turma_serie, tb_turma_periodo, tb_turma_qtd_alunos, tb_turma_disciplina_ministrada)
		VALUES(?,?,?,?,?)";

$stmt = $conn->prepare($sql);
$stmt->bind_param("sssss", $tb_turma_nome, $tb_turma_serie, $tb_turma_periodo, $tb_turma_qtd_alunos, $tb_turma_disciplina_ministrada);
$stmt->execute();

	echo "<br><br><br>Dados inseridos na tabela ('tb_turmas') com sucesso !";

$stmt->close();
$conn->close();
?>