<?php

include("conexao.php");

///////////////////////////////////////////
///Criando a Tabela
///////////////////////////////////////////


// $sql = "CREATE TABLE tb_usuario (tb_usuario_id_usuario INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
// 								tb_usuario_nome_completo VARCHAR(30) NOT NULL,
// 								tb_usuario_data_nascimento DATE NOT NULL,
// 								tb_usuario_email VARCHAR (30) NOT NULL,
// 								tb_usuario_nome_usuario VARCHAR (30) NOT NULL,
// 								tb_usuario_senha INT(10) NOT NULL, 
// 								tb_usuario_data TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP
// 							)";

// if ($conn->query($sql) === TRUE) {
// 	echo "Tabela Criada com sucesso !!!";
// } else {
// 	echo "Tabela Criada Com Sucesso " . mysqli_error($conn);
// }


///////////////////////////////////////////
///adicionando os dados
///////////////////////////////////////////


foreach ($_POST as $variavel => $valor) {
	$$variavel = $valor;

	echo "<br>" . $variavel . "=" . $valor;
}


$sql = "INSERT INTO tb_usuario (tb_usuario_nome_completo, tb_usuario_data_nascimento, tb_usuario_email, tb_usuario_nome_usuario, tb_usuario_senha) VALUES(?,?,?,?,?)";

$stmt = $conn->prepare($sql);
$stmt->bind_param("sssss", $tb_usuario_nome_completo, $tb_usuario_data_nascimento, $tb_usuario_email, $tb_usuario_nome_usuario, $tb_usuario_senha);
$stmt->execute();

	echo "<br><br><br>Dados inseridos na tabela ('tb_usuario') com sucesso !";

$stmt->close();
$conn->close();
?>