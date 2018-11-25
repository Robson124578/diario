<?php

include("conexao.php");


///////////////////////////////////////////
///Criando a Tabela Turma
///////////////////////////////////////////

// $sql = "CREATE TABLE tb_plano_de_aula (tb_plano_de_aula_id_plano_de_aula 		INT(100) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
// 									   tb_plano_de_aula_id_turma 				INT,
// 									   tb_plano_de_aula_tema 					VARCHAR(100) NOT NULL,
// 									   tb_plano_de_aula_data					DATE NOT NULL,
// 									   tb_plano_de_aula_conteudo 				VARCHAR (70) NOT NULL,
// 									   tb_plano_de_aula_metodologia_de_ensino	VARCHAR(200),
// 									   tb_plano_de_aula_objetivo 				VARCHAR(200),
// 									   tb_plano_de_aula_recursos_necessarios 	VARCHAR(200),
// 									   tb_plano_de_aula_referencias 			VARCHAR(200),
// 									   tb_plano_de_aula_data_criacao			TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
// 									   CONSTRAINT FK_tb_plano_de_aula_id_turma FOREIGN KEY (tb_plano_de_aula_id_turma) REFERENCES tb_turma(tb_turma_id))";

// if ($conn->query($sql) === TRUE) {
// 	echo "/////////////////////////////////////////////////////////////<br>
// 		  INSERINDO DADOS...<br><br><br>		  
// 		  Resposta: Dados inseridos com Sucesso !!!<br> 
// 		  /////////////////////////////////////////////////////////////<br><br><br><br>";
// } else {
// 	echo "/////////////////////////////////////////////////////////////<br>
// 		  INSERINDO DADOS...<br><br><br>		  
// 		  Resposta: ERRO..<br>
// 		  /////////////////////////////////////////////////////////////<br><br><br><br>" . mysqli_error($conn);
// }

///////////////////////////////////////////
///Adicionando dados:
///////////////////////////////////////////

foreach ($_POST as $variavel => $valor) {
	$$variavel = $valor;

	echo "<br>" . $variavel . "=" . $valor;
}

$sql = "INSERT INTO tb_plano_de_aula (tb_plano_de_aula_id_turma, 
									  tb_plano_de_aula_tema,
									  tb_plano_de_aula_data,
									  tb_plano_de_aula_conteudo, 
									  tb_plano_de_aula_metodologia_de_ensino,
									  tb_plano_de_aula_objetivo,
									  tb_plano_de_aula_recursos_necessarios,
									  tb_plano_de_aula_referencias) VALUES(?,?,?,?,?,?,?,?)";

$stmt = $conn->prepare($sql);
$stmt->bind_param("isssssss", $tb_plano_de_aula_id_turma, 
							  $tb_plano_de_aula_tema,
							  $tb_plano_de_aula_data, 
							  $tb_plano_de_aula_conteudo, 
							  $tb_plano_de_aula_metodologia_de_ensino,
							  $tb_plano_de_aula_objetivo,
							  $tb_plano_de_aula_recursos_necessarios,
							  $tb_plano_de_aula_referencias);
$stmt->execute();

	echo "<br><br><br>Dados inseridos na tabela ('tb_plano_de_aula') com sucesso !";

$stmt->close();
$conn->close();
?>