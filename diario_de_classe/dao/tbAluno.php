<?php

include("conexao.php");

///////////////////////////////////////////
///Criando a Tabela Turma
///////////////////////////////////////////

//  $sql = "CREATE TABLE tb_aluno(tb_aluno_id 			INT(100) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
// 							   tb_aluno_nome 		VARCHAR(50) NOT NULL,
// 							   tb_aluno_data 		TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
// 							   tb_aluno_turma 		INT, 
// 							   tb_aluno_email 		VARCHAR(50) NOT NULL,
// 							   tb_aluno_telefone 	VARCHAR(20) NOT NULL,
// 							CONSTRAINT fk_AlunoTurma FOREIGN KEY (tb_aluno_turma) REFERENCES tb_turma(tb_turma_id))" ;
	
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





$conn->close();
?>