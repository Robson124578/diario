<?php

include("conexao.php");

///////////////////////////////////////////
///Criando a Tabela usuário
///////////////////////////////////////////

// $sql = " CREATE TABLE tb_nota (tb_nota_id 				INT(100) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
// 							   tb_nota_turma			INT,
// 							   tb_nota_id_aluno			INT,
// 							   tb_nota_periodo			VARCHAR(50) NOT NULL,
// 							   tb_nota_nota				VARCHAR(10) NOT NULL,
// 							   tb_nota_data_registro	TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
// 							   CONSTRAINT FK_tb_nota_turma 	  FOREIGN KEY(tb_nota_turma)    REFERENCES tb_turma(tb_turma_id),
// 							   CONSTRAINT FK_tb_nota_id_aluno FOREIGN KEY(tb_nota_id_aluno) REFERENCES tb_aluno(tb_aluno_id)
// 								)";

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


$sql = "INSERT INTO tb_nota (tb_nota_turma, 
							 tb_nota_id_aluno, 
							 tb_nota_periodo, 
							 tb_nota_nota) VALUES(?,?,?,?)";

$stmt = $conn->prepare($sql);
$stmt->bind_param("iiss", $tb_nota_turma, 
						  $tb_nota_id_aluno, 
						  $tb_nota_periodo, 
						  $tb_nota_nota);
$stmt->execute();

	echo "<br><br><br>Dados inseridos na tabela ('tb_notas') com sucesso !";

$stmt->close();
$conn->close();
?>